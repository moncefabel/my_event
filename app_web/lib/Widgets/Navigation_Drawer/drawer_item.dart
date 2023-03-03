import 'package:flutter/material.dart';
import 'package:app_web/Widgets/Navigation_bar/navbar_item.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final IconData? icon2;
  final String navigationPath;
  const DrawerItem(this.title, this.icon, this.icon2, this.navigationPath,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 60),
      child: Row(
        children: <Widget>[
          Icon(icon),
          Icon(icon2),
          const SizedBox(
            width: 30,
          ),
          NavBarItem(title, navigationPath)
        ],
      ),
    );
  }
}
