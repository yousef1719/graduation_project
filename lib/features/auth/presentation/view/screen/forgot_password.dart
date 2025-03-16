// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/utils/styles.dart';
import 'package:graduation_project/core/widgets/shared_widgets/custom_text_button.dart';
import 'package:graduation_project/core/widgets/shared_widgets/custom_text_form_field.dart';
import 'package:graduation_project/core/widgets/shared_widgets/show_snack_bar.dart';
import 'package:graduation_project/features/auth/presentation/view/screen/login_page.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();
  bool isLoading = false;
  Future resetPassword() async {
    final email = _emailController.text.trim();

    if (email.isEmpty || !email.contains('@')) {
      showSnackBar(context, 'Please enter a valid email');
      return;
    }
    try {
      setState(() {
        isLoading = true;
      });
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      showSnackBar(context, 'Check your email');
      _emailController.clear();
      await Future.delayed(
        const Duration(seconds: 3),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => LoginPage(),
        ),
      );
    } on FirebaseAuthException catch (ex) {
      String errorMessage;
      switch (ex.code) {
        case 'user-not-found':
          errorMessage = 'No user found with this email';
          break;
        case 'invalid-email':
          errorMessage = 'Invalid email address';
          break;
        case 'too-many-requests':
          errorMessage = 'Too many requests. Please try again later.';
          break;
        default:
          errorMessage = 'An error occurred. Please try again.';
      }
      showSnackBar(context, errorMessage);
    } catch (ex) {
      showSnackBar(context, 'Coudn\'t send your a message');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                      size: 22, color: kPrimaryColor, Icons.arrow_back_ios),
                ),
              ),
            ),
            Spacer(
              flex: 1,
            ),
            Text(
              'Confirm it\'s you.',
              style: Styles(
                fontWeight: FontWeight.w600,
                color: kHintColor,
                fontSize: 18,
              ).textStyleInter,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Please verify your email to continue',
              style: Styles(
                fontWeight: FontWeight.w400,
                color: Color(0xff787878),
                fontSize: 14,
              ).textStyleInter,
            ),
            SizedBox(
              height: 40,
            ),
            CustomTextFormField(
              hintText: 'Enter your email',
              controller: _emailController,
            ),
            SizedBox(
              height: 24,
            ),
            CustomTextButton(
              color: kPrimaryColor,
              text: 'Continue',
              onPressed: () => resetPassword(),
            ),
            Spacer(
              flex: 6,
            ),
          ],
        ),
      ),
    );
  }
}
