import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:testapp/locator.dart';
import 'package:testapp/routing/route_names.dart';
import 'package:testapp/routing/router.dart';
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
        appBar: AppBar(),
        drawer: sizingInformation.isMobile ? const NavigationDrawers() : null,
        backgroundColor: Colors.white,
        body: CenteredView(
          child: Column(
            children: <Widget>[
              const NavigationBars(),
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
