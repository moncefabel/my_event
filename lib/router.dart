
import 'package:flutter/material.dart';
import 'package:myevent/features/screens/Home/home.dart';

Route<dynamic> ?generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const  HomeScreen(),
      );
    
  
  }
}

