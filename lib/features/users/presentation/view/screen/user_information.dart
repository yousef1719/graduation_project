import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/models/user_model.dart';
import 'package:graduation_project/core/utils/styles.dart';
import 'package:graduation_project/features/users/presentation/view/widget/background_shape.dart';
import 'package:graduation_project/features/users/presentation/view/widget/custom_elvetaed_button.dart';

class UserInformation extends StatelessWidget {
  const UserInformation({this.userModel, super.key});
  final UserModel? userModel;

  @override
  Widget build(BuildContext context) {
    final UserModel userModel = Get.arguments;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          BackgroundShape(),
          Padding(
            padding: EdgeInsets.all(14.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 40.r,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person,
                            size: 50.sp, color: kPrimaryColor),
                      ),
                      SizedBox(width: 25.w),
                      Text('STUDENT INFORMATION',
                          style: Styles(
                                  color: kBackgroundColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700)
                              .textStyleInter),
                    ],
                  ),
                ),
                SizedBox(
                  height: 120.h,
                ),
                _infoRow('• Name: ', userModel.name),
                _infoRow('• ID: ', userModel.id),
                _infoRow('• Department: ', userModel.department),
                _infoRow('• Academic Level: ', userModel.academicLevel),
                _infoRow('• Email: ', userModel.email),
                _infoRow('• Status: ', userModel.status),
                SizedBox(height: 96.h),
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
                      width: 20.w,
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

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Text(
        '$label$value',
        style: Styles(
          color: Colors.black,
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
        ).textStyleInter,
      ),
    );
  }
}
