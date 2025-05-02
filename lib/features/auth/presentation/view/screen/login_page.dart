// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/utils/styles.dart';
import 'package:graduation_project/core/widgets/shared_widgets/addition_text_button.dart';
import 'package:graduation_project/core/widgets/shared_widgets/custom_text_button.dart';
import 'package:graduation_project/core/widgets/shared_widgets/custom_text_form_field.dart';
import 'package:graduation_project/core/widgets/shared_widgets/show_snack_bar.dart';
import 'package:graduation_project/features/auth/presentation/view/screen/forgot_password.dart';
import 'package:graduation_project/features/auth/presentation/view/screen/signup_page.dart';
import 'package:graduation_project/features/auth/presentation/view/widget/divider_with_text.dart';
import 'package:graduation_project/features/auth/presentation/view/widget/social_logo.dart';
import 'package:graduation_project/features/home/presentation/views/screens/home_view.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formkey = GlobalKey();
  String? email, password;
  bool isLoading = false;
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      color: kPrimaryColor,
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(14),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 60.h),
                  Text(
                    'Hello,',
                    style: Styles(
                      fontWeight: FontWeight.w500,
                      color: kPrimaryColor,
                      fontSize: 24.sp,
                    ).textStyleInter,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Welcome back',
                    style: Styles(
                      fontWeight: FontWeight.w500,
                      color: kTextColor,
                      fontSize: 24.sp,
                    ).textStyleInter,
                  ),
                  SizedBox(height: 40.h),
                  CustomTextFormField(
                    onChanged: (data) {
                      email = data;
                    },
                    hintText: 'Email',
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  CustomTextFormField(
                    onChanged: (data) {
                      password = data;
                    },
                    hintText: 'Password',
                    isPassword: true,
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Checkbox(
                        value: _isChecked,
                        onChanged: (bool? newValue) {
                          setState(() {
                            _isChecked = newValue ?? false;
                          });
                        },
                        activeColor: kPrimaryColor,
                        checkColor: kBackgroundColor,
                      ),
                      Text(
                        'Remember me',
                        style: Styles(
                          fontWeight: FontWeight.w500,
                          color: kHintColor,
                          fontSize: 12.sp,
                        ).textStyleInter,
                      ),
                      Spacer(),
                      AdditionTextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgotPassword(),
                            ),
                          );
                        },
                        text: 'Forget password',
                        color: kPrimaryColor,
                        fontsize: 12.sp,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomTextButton(
                      onPressed: () async {
                        if (formkey.currentState!.validate()) {
                          isLoading = true;
                          setState(() {});
                          try {
                            await loginUser();
                            if (!mounted) return;
                            showSnackBar(context, 'Success');
                            await Future.delayed(Duration(seconds: 3));
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeView(),
                              ),
                              (route) => false,
                            );
                          } on FirebaseAuthException catch (ex) {
                            print('FirebaseAuthException code: ${ex.code}');

                            if (ex.code == 'user-not-found') {
                              showSnackBar(context, 'User Not Found!');
                            } else if (ex.code == 'wrong-password') {
                              showSnackBar(context, 'Wrong Password.');
                            } else if (ex.code == 'invalid-credential') {
                              showSnackBar(
                                  context, 'Invalid Email Or Password !');
                            } else {
                              showSnackBar(
                                  context, 'Unexpected error: ${ex.code}');
                            }
                          } catch (ex) {
                            showSnackBar(context,
                                'there was an Error. Please try agian later');
                            print('Other exception: $ex');
                          }
                          isLoading = false;
                          setState(() {});
                        } else {}
                      },
                      color: kPrimaryColor,
                      text: 'Sign in'),
                  SizedBox(
                    height: 30.h,
                  ),
                  DividerWithText(),
                  SizedBox(
                    height: 25.h,
                  ),
                  SocialLogo(),
                  SizedBox(height: 130.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account?',
                        style: Styles(
                                fontWeight: FontWeight.w500,
                                color: kHintColor,
                                fontSize: 13.sp)
                            .textStyleInter,
                      ),
                      AdditionTextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupPage(),
                            ),
                          );
                        },
                        text: 'Sign up',
                        color: kPrimaryColor,
                        fontsize: 13.sp,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
