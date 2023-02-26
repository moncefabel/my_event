import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:testapp/Widgets/Navigation_bar/navigation_bar_tablet_desktop.dart';
import 'navigation_bar_mobile.dart';

class NavigationBars extends StatelessWidget {
  const NavigationBars({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: const NavigationBarMobile(),
      tablet: const NavigationBarTabletDesktop(),
    );
  }
}
