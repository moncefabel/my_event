
import 'package:flutter/material.dart';
import 'package:myevent/features/screens/Home/home.dart';
import 'package:myevent/features/screens/Login/login_screen.dart';

import 'features/screens/Login/components/login_form.dart';

Route<dynamic> ?generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const  HomeScreen(),
      );
    case LoginForm.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LoginScreen()
      );
    
  
  }
}

