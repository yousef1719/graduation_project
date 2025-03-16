import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/utils/assets.dart';
import 'package:graduation_project/core/utils/styles.dart';
import 'package:graduation_project/core/widgets/shared_widgets/addition_text_button.dart';
import 'package:graduation_project/core/widgets/shared_widgets/custom_text_button.dart';
import 'package:graduation_project/features/auth/presentation/view/screen/login_page.dart';
import 'package:graduation_project/features/auth/presentation/view/screen/signup_page.dart';
import 'package:graduation_project/features/users/presentation/view/screen/user_information.dart';

class SplashRegViewBody extends StatefulWidget {
  const SplashRegViewBody({super.key});

  @override
  State<SplashRegViewBody> createState() => _SplashRegViewBodyState();
}

class _SplashRegViewBodyState extends State<SplashRegViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 80,
          ),
          Image.asset(
            AssetsData.logo,
            width: 149,
            height: 153,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'WHO',
            softWrap: true,
            style: Styles(
                    color: kPrimaryColor,
                    fontSize: 40,
                    fontWeight: FontWeight.w400)
                .textStyleTrad,
          ),
          SizedBox(
            height: 22,
          ),
          CustomTextButton(
            color: kPrimaryColor,
            text: 'Login',
            type: ButtonType.outlined,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            },
          ),
          SizedBox(
            height: 16,
          ),
          CustomTextButton(
            color: kPrimaryColor,
            text: 'Sign up',
            type: ButtonType.filled,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignupPage(),
                ),
              );
            },
          ),
          Padding(
              padding: const EdgeInsets.only(top: 240),
              child: AdditionTextButton(
                text: 'Continue as a guest',
                color: kPrimaryColor,
                fontsize: 16,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserInformation(),
                    ),
                  );
                },
              )),
        ],
      ),
    );
  }
}
