import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:app_web/views/Home/home_content_desktop.dart';
import 'package:app_web/views/Home/home_content_mobile.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 100.0, left: 50.0, right: 50.0),
        child: ScreenTypeLayout(
          mobile: const HomeContentMobile(),
          desktop: const HomeContentDesktop(),
        ),
      ),
    );
  }
}
