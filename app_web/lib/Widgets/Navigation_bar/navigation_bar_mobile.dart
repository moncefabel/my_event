import 'package:flutter/material.dart';
import 'package:app_web/Widgets/Navigation_bar/navbar_logo.dart';
import 'package:app_web/routing/route_names.dart';

class NavigationBarMobile extends StatefulWidget {
  const NavigationBarMobile({super.key});

  @override
  State<NavigationBarMobile> createState() => NavigationBarMobileState();
}

class NavigationBarMobileState extends State<NavigationBarMobile> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 80,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [NavBarLogo('Main', homeRoute)],
        ));
  }
}
