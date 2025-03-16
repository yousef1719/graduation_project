import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/utils/assets.dart';
import 'package:graduation_project/core/utils/styles.dart';
import 'package:graduation_project/core/widgets/shared_widgets/addition_text_button.dart';
import 'package:graduation_project/core/widgets/shared_widgets/background_gradient.dart';
import 'package:graduation_project/core/widgets/shared_widgets/circle_progress_indicator.dart';
import 'package:graduation_project/features/splash/presentation/views/screens/splash_reg_view_body.dart';

class SecureOnboarding extends StatelessWidget {
  const SecureOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundGradient(),
        Positioned(
          top: 25,
          left: 10,
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios,
                size: 20, color: kBackgroundColor),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: AdditionTextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SplashRegViewBody(),
                        ),
                      );
                    },
                    text: 'Skip',
                    color: kBackgroundColor,
                    fontsize: 16,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 30),
                child: Image.asset(
                  AssetsData.securephoto,
                  width: 326,
                  height: 326,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'SECURE',
                        style: Styles(
                          fontWeight: FontWeight.w800,
                          color: kSecondaryColor,
                          fontSize: 30,
                        ).textStyleInter,
                      ),
                      Text(
                        ' & ',
                        style: Styles(
                                fontWeight: FontWeight.w800,
                                color: kTextColor,
                                fontSize: 30)
                            .textStyleInter,
                      ),
                      Text(
                        'PRIVATE',
                        style: Styles(
                          fontWeight: FontWeight.w800,
                          color: kSecondaryColor,
                          fontSize: 30,
                        ).textStyleInter,
                      ),
                    ],
                  ),
                  Text(
                    ' Your Face. ',
                    style: Styles(
                            fontWeight: FontWeight.w800,
                            color: kTextColor,
                            fontSize: 30)
                        .textStyleInter,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 5),
                    child: Text(
                      'Your data is encrypted and protected at all',
                      style: Styles(
                              fontWeight: FontWeight.w400,
                              color: kTextColor,
                              fontSize: 16)
                          .textStyleInter,
                    ),
                  ),
                  Text(
                    'times.',
                    style: Styles(
                            fontWeight: FontWeight.w400,
                            color: kTextColor,
                            fontSize: 16)
                        .textStyleInter,
                  )
                ],
              ),
              SizedBox(
                height: 105,
              ),
              CircleProgressIndicator(
                value: 1,
                angel: -3.14 / 2,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SplashRegViewBody(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
