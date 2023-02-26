import 'package:flutter/material.dart';
import 'package:app_web/constants/app_colors.dart';

class NavigationDrawerHeader extends StatelessWidget {
  const NavigationDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: primaryColor,
      alignment: Alignment.center,
      child: Column(mainAxisSize: MainAxisSize.min, children: const <Widget>[
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
    );
  }
}
