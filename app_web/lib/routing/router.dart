import 'package:app_web/views/Connection/connection.view.dart';
import 'package:app_web/views/Etablissements/add_etb_screen.dart';
import 'package:flutter/material.dart';
import 'package:app_web/routing/route_names.dart';
import 'package:app_web/views/Home/home_views.dart';
import '../views/About/about_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeRoute:
      return _getPageRoute(const HomeView());
    case aboutRoute:
      return _getPageRoute(const AboutView());
    case connectionRoute:
      return _getPageRoute(const ConnectionView());
    case AddEtbScreen.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const AddEtbScreen(),
      );
    default:
      throw MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}

PageRoute _getPageRoute(Widget child) {
  return _FadeRoute(child: child);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  _FadeRoute({required this.child})
      : super(
            pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) =>
                child,
            transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) =>
                FadeTransition(
                  opacity: animation,
                  child: child,
                ));
}
