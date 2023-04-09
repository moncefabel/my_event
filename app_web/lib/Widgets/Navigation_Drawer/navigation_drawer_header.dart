import 'package:app_web/features/auth/services/auth_service.dart';
import 'package:app_web/providers/proprio_provider.dart';
import 'package:flutter/material.dart';
import 'package:app_web/constants/app_colors.dart';
import 'package:provider/provider.dart';

class NavigationDrawerHeader extends StatefulWidget {
  const NavigationDrawerHeader({super.key});

  @override
  State<NavigationDrawerHeader> createState() => _NavigationDrawerHeaderState();
}

class _NavigationDrawerHeaderState extends State<NavigationDrawerHeader> {

  AuthService authService = AuthService();
  @override
  void initState() {
    super.initState();
    authService.getProprioData(context);
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 150,
        color: primaryColor,
        alignment: Alignment.center,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(
            "Hello ${Provider.of<ProprioProvider>(context).proprio.firstName}",
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white),
          ),
        ]),
      ),
    );
  }
}