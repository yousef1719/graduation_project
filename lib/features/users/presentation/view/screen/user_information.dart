import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/utils/styles.dart';
import 'package:graduation_project/features/users/presentation/view/widget/background_shape.dart';
import 'package:graduation_project/features/users/presentation/view/widget/custom_elvetaed_button.dart';

class UserInformation extends StatelessWidget {
  const UserInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          BackgroundShape(),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
                        child:
                            Icon(Icons.person, size: 50, color: kPrimaryColor),
                      ),
                      SizedBox(width: 25),
                      Text('STUDENT INFORMATION',
                          style: Styles(
                                  color: kBackgroundColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700)
                              .textStyleInter),
                    ],
                  ),
                ),
                SizedBox(
                  height: 120,
                ),
                Text('• Name: mark john',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                SizedBox(height: 32),
                Text('• ID: 123678445',
                    style: Styles(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700)
                        .textStyleInter),
                SizedBox(height: 32),
                Text('• Department: computer science',
                    style: Styles(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700)
                        .textStyleInter),
                SizedBox(height: 32),
                Text('• Academic Level: level 4',
                    style: Styles(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700)
                        .textStyleInter),
                SizedBox(height: 32),
                Text('• Email: mark@gmail.com',
                    style: Styles(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700)
                        .textStyleInter),
                SizedBox(height: 32),
                Text('• Status: Active',
                    style: Styles(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700)
                        .textStyleInter),
                SizedBox(height: 96),
                Row(
                  children: [
                    CustomElvetaedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      backgroundcolor: kPrimaryColor,
                      text: 'Back',
                      color: kBackgroundColor,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    CustomElvetaedButton(
                      onPressed: () {},
                      backgroundcolor: kBackgroundColor,
                      text: 'Done',
                      color: kPrimaryColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
