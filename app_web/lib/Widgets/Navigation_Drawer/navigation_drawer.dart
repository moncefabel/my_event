import 'package:app_web/Extensions/hover_extensions.dart';
import 'package:flutter/material.dart';
import 'package:app_web/Widgets/Navigation_Drawer/drawer_item.dart';
import 'package:app_web/Widgets/Navigation_Drawer/navigation_drawer_header.dart';
import 'package:app_web/routing/route_names.dart';

class NavigationDrawers extends StatelessWidget {
  const NavigationDrawers({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 300,
      child: ListView(children: [
        const NavigationDrawerHeader(),
        const DrawerItem('Connection', Icons.login, null, connectionRoute)
            .moveUpOnHover,
        const DrawerItem('Reservations', Icons.list_rounded, null, aboutRoute).moveUpOnHover,
      ]),
    );
  }
}
