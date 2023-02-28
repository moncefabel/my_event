import 'package:flutter/material.dart';
import 'package:testapp/Widgets/Navigation_Drawer/drawer_item.dart';
import 'package:testapp/Widgets/Navigation_Drawer/navigation_drawer_header.dart';
import 'package:testapp/routing/route_names.dart';

class NavigationDrawers extends StatelessWidget {
  const NavigationDrawers({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 16)]),
      child: Flex(direction: Axis.vertical, children: const [
        Flexible(child: NavigationDrawerHeader()),
        Flexible(child: DrawerItem('Connection', Icons.login, connectionRoute)),
        Flexible(child: DrawerItem('About', Icons.help, aboutRoute))
      ]),
    );
  }
}
