import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/features/splash/presentation/views/screens/splash_view.dart';
import 'package:graduation_project/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const WhoApp());
}

class WhoApp extends StatelessWidget {
  const WhoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData().copyWith(
          scaffoldBackgroundColor: kBackgroundColor,
        ),
        home: SplashView(),
      ),
    );
  }
}
