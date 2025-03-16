import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:graduation_project/constants.dart';

class BottomAppbarWidget extends StatelessWidget {
  const BottomAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GNav(
        rippleColor: Colors.white,
        hoverColor: Colors.white,
        haptic: true,
        tabBorderRadius: 15,
        tabActiveBorder: Border.all(color: kPrimaryColor, width: 1),
        tabBorder: Border.all(color: Colors.grey, width: 1),
        tabShadow: [
          BoxShadow(color: Colors.white.withValues(alpha: .5), blurRadius: 8)
        ],
        curve: Curves.easeOutExpo,
        duration: Duration(milliseconds: 5),
        gap: 8,
        color: Colors.grey,
        activeColor: kPrimaryColor,
        iconSize: 24,
        tabBackgroundColor: kPrimaryColor.withValues(alpha: .1),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tabs: [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.settings,
            text: 'Setting',
          )
        ]);
  }
}
