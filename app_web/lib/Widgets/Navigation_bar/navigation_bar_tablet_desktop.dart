import 'package:flutter/material.dart';
import 'package:testapp/routing/route_names.dart';

import 'navbar_item.dart';
import 'navbar_logo.dart';

class NavigationBarTabletDesktop extends StatelessWidget {
  const NavigationBarTabletDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const NavBarLogo('Main', homeRoute),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  NavBarItem('Connection', connectionRoute),
                  SizedBox(
                    width: 60,
                  ),
                  NavBarItem('About', aboutRoute),
                ],
              )
            ]));
  }
}
