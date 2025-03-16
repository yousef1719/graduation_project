import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/utils/assets.dart';
import 'package:graduation_project/core/widgets/shared_widgets/custom_text_button.dart';
import 'package:graduation_project/features/home/presentation/views/screens/camera_screen.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            Center(
              child: Image.asset(
                AssetsData.scanlogo,
                width: 344,
                height: 515,
              ),
            ),
            const Spacer(),
            CustomTextButton(
              color: kPrimaryColor,
              text: 'Scan',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CameraScreen()),
                );
              },
            ),
            SizedBox(
              height: 50,
            ),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
