import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/utils/styles.dart';

class DividerWithText extends StatelessWidget {
  const DividerWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: Divider(
              thickness: 2,
              color: Colors.black,
              indent: 61,
              endIndent: 5,
            )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'or continue with',
                style: Styles(
                        fontWeight: FontWeight.w500,
                        color: Color(0xff4B4B4B),
                        fontSize: 16)
                    .textStyleInter,
              ),
            ),
            Expanded(
              child: Divider(
                thickness: 2,
                color: kPrimaryColor,
                indent: 5,
                endIndent: 61,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
