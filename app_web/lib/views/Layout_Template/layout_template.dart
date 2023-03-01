import 'package:app_web/Widgets/Navigation_bar/navbar_logo.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:app_web/locator.dart';
import 'package:app_web/routing/route_names.dart';
import 'package:app_web/routing/router.dart';
import '../../Services/navigation_service.dart';
import '../../Widgets/Centered_view/centered_view.dart';
import '../../Widgets/Navigation_Drawer/navigation_drawer.dart';
import '../../Widgets/Navigation_bar/navigation_bar.dart';

class LayoutTemplate extends StatelessWidget {
  const LayoutTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          shadowColor: Colors.red,
          title: const NavBarLogo('home', homeRoute),
          actions: <Widget>[
            ResponsiveBuilder(builder: (context, sizingInformation) {
              if (sizingInformation.isDesktop || sizingInformation.isTablet) {
                return const Padding(
                  padding: EdgeInsets.only(right: 50.0),
                  child: NavigationBars(),
                );
              }
              return Container();
            })
          ],
        ),
        drawer: sizingInformation.isMobile ? const NavigationDrawers() : null,
        backgroundColor: Colors.yellow,
        body: CenteredView(
          child: Column(
            children: [
              Expanded(
                  child: Navigator(
                key: locator<NavigationService>().navigatorKey,
                onGenerateRoute: generateRoute,
                initialRoute: homeRoute,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
