import 'package:app_web/Extensions/hover_extensions.dart';
import 'package:flutter/material.dart';
import 'package:app_web/Widgets/Navigation_Drawer/drawer_item.dart';
import 'package:app_web/Widgets/Navigation_Drawer/navigation_drawer_header.dart';
import 'package:app_web/routing/route_names.dart';

class NavigationDrawers extends StatelessWidget {
  const NavigationDrawers({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 16)]),
      child: Flex(direction: Axis.vertical, children: [
        const NavigationDrawerHeader(),
        const Flexible(
                child: DrawerItem('Connection', Icons.login, connectionRoute))
            .moveUpOnHover,
        const Flexible(child: DrawerItem('About', Icons.help, aboutRoute))
            .moveUpOnHover,
      ]).showCursorOnHover,
    );
  }
}
