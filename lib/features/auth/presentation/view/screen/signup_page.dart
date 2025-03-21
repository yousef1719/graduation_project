import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/utils/styles.dart';
import 'package:graduation_project/core/widgets/shared_widgets/addition_text_button.dart';
import 'package:graduation_project/core/widgets/shared_widgets/custom_text_button.dart';
import 'package:graduation_project/core/widgets/shared_widgets/custom_text_form_field.dart';
import 'package:graduation_project/core/widgets/shared_widgets/show_snack_bar.dart';
import 'package:graduation_project/features/auth/presentation/view/screen/login_page.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class SignupPage extends StatefulWidget {
  SignupPage({this.confirmPassword, this.email, this.password, super.key});

  String? email;
  String? password;
  String? confirmPassword;
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  GlobalKey<FormState> formkey = GlobalKey();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      color: kPrimaryColor,
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(14.w),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 50.h),
                  Text(
                    'Sign Up',
                    style: Styles(
                      fontWeight: FontWeight.w500,
                      color: kTextColor,
                      fontSize: 24.sp,
                    ).textStyleInter,
                  ),
                  SizedBox(height: 70.h),
                  CustomTextFormField(
                    onChanged: (data) {
                      widget.email = data;
                    },
                    hintText: 'Email',
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  CustomTextFormField(
                    onChanged: (data) {
                      widget.password = data;
                    },
                    hintText: 'Password',
                    isPassword: true,
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  CustomTextFormField(
                    onChanged: (data) {
                      widget.confirmPassword = data;
                    },
                    hintText: 'Confirm Password',
                    isPassword: true,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextButton(
                    onPressed: () async {
                      if (widget.password != widget.confirmPassword) {
                        showSnackBar(context, 'Passwords do not match');
                        return;
                      }
                      if (formkey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        try {
                          await registerUser();
                          // ignore: use_build_context_synchronously
                          showSnackBar(context, 'Success');
                          Navigator.push(
                            // ignore: use_build_context_synchronously
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        } on FirebaseAuthException catch (ex) {
                          if (ex.code == 'weak-password') {
                            // ignore: use_build_context_synchronously
                            showSnackBar(context, 'Weak Password');
                          } else if (ex.code == 'email-already-in-use') {
                            // ignore: use_build_context_synchronously
                            showSnackBar(context, 'Eamil Already Exists.');
                          }
                        } catch (ex) {
                          // ignore: use_build_context_synchronously
                          showSnackBar(context, 'there was an Error.');
                        }
                        isLoading = false;
                        setState(() {});
                      } else {}
                    },
                    color: kPrimaryColor,
                    text: 'Sign up',
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'By signing in your approving to our ',
                        style: Styles(
                                fontWeight: FontWeight.w400,
                                color: kHintColor,
                                fontSize: 14.sp)
                            .textStyleInter,
                      ),
                      Text(
                        'Terms &',
                        style: Styles(
                                fontWeight: FontWeight.w600,
                                color: kPrimaryColor,
                                fontSize: 14.sp)
                            .textStyleInter,
                      ),
                    ],
                  ),
                  Text(
                    'conditions and privacy policy',
                    style: Styles(
                            fontWeight: FontWeight.w500,
                            color: kPrimaryColor,
                            fontSize: 14.sp)
                        .textStyleInter,
                  ),
                  SizedBox(height: 150.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: Styles(
                                fontWeight: FontWeight.w500,
                                color: kHintColor,
                                fontSize: 16.sp)
                            .textStyleInter,
                      ),
                      AdditionTextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                        text: 'Sign in',
                        color: kPrimaryColor,
                        fontsize: 15.sp,
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> registerUser() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: widget.email!, password: widget.password!);
  }
}
