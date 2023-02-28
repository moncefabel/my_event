import 'package:flutter/material.dart';
import 'package:app_web/constants/app_colors.dart';

import '../../Services/navigation_service.dart';
import '../../locator.dart';

class CallToActionMobile extends StatelessWidget {
  final String title;
  final String navigationPath;
  const CallToActionMobile(this.title, this.navigationPath, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        locator<NavigationService>().navigateTo(navigationPath);
      },
      child: Container(
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: primaryColor, borderRadius: BorderRadius.circular(5)),
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white),
        ),
      ),
    );
  }
}
