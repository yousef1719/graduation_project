import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/models/user_model.dart';
import 'package:graduation_project/core/utils/styles.dart';
import 'package:graduation_project/features/home/presentation/views/screens/home_view.dart';
import 'package:graduation_project/features/users/presentation/view/widget/background_shape.dart';
import 'package:graduation_project/features/users/presentation/view/widget/custom_elvetaed_button.dart';

class UserInformation extends StatelessWidget {
  const UserInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final UserModel userModel = Get.arguments as UserModel;

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
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700)
                              .textStyleInter),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100.h,
                ),
                _infoRow('• Name: ', userModel.name),
                _infoRow('• Email: ', userModel.email),
                _infoRow('• Department: ', userModel.department),
                _infoRow('• Phone: ', userModel.phone),
                _infoRow('• Academic year: ', userModel.academicyear),
                _infoRow('• Status: ', userModel.status),
                SizedBox(height: 50.h),
                Row(
                  children: [
                    CustomElvetaedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      backgroundcolor: kBackgroundColor,
                      text: 'Back',
                      color: kPrimaryColor,
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    CustomElvetaedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeView(),
                          ),
                        );
                      },
                      backgroundcolor: kPrimaryColor,
                      text: 'Done',
                      color: kBackgroundColor,
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
      padding: EdgeInsets.only(bottom: 32.h),
      child: Text(
        '$label$value',
        style: Styles(
          color: Colors.black,
          fontSize: 14.sp,
          fontWeight: FontWeight.w700,
        ).textStyleInter,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
