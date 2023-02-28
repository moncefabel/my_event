import 'package:flutter/material.dart';
import 'package:testapp/constants/app_colors.dart';

class NavigationDrawerHeader extends StatelessWidget {
  const NavigationDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 150,
        color: primaryColor,
        alignment: Alignment.center,
        child: Column(mainAxisSize: MainAxisSize.min, children: const [
          Text(
            'Skill Up',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white),
          ),
          Text(
            'Click Here',
            style: TextStyle(color: Colors.white),
          )
        ]),
      ),
    );
  }
}
