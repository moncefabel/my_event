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
      child: Column(children: const <Widget>[
        NavigationDrawerHeader(),
        DrawerItem('Connection', Icons.login, connectionRoute),
        DrawerItem('About', Icons.help, aboutRoute)
      ]),
    );
  }
}
