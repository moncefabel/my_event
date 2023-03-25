import 'package:app_web/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:app_web/routing/route_names.dart';

import 'navbar_item.dart';

class NavigationBarTabletDesktop extends StatefulWidget {
  const NavigationBarTabletDesktop({super.key});

  @override
  State<NavigationBarTabletDesktop> createState() => _NavigationBarTabletDesktopState();
}

class _NavigationBarTabletDesktopState extends State<NavigationBarTabletDesktop> {

    AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              //const NavBarLogo('Main', homeRoute),
              Row(
                mainAxisSize: MainAxisSize.min,
                children:  <Widget>[
                  const NavBarItem('Connection', connectionRoute),
                  const SizedBox(
                    width: 60,
                  ),
                  const NavBarItem('Reservations', aboutRoute), 
                  
                ],
                
              )
            ]));
  }
}

