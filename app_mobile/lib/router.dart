
import 'package:flutter/material.dart';
import 'package:myevent/features/screens/Detail_page/detail_page.dart';
import 'package:myevent/features/screens/Home/home.dart';
import 'package:myevent/features/screens/Login/components/login_screen.dart';
import 'package:myevent/features/screens/onboarding/onboarding.dart';
import 'package:myevent/models/etablissement.dart';

import 'features/screens/Home/Widgets/Body/home_display.dart';
import 'features/screens/Login/components/login_form.dart';
import 'features/screens/establishment-details.dart';

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
    case OnboardingScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const OnboardingScreen()
      );
        
      case DetailPage.routeName:
       var etb=routeSettings.arguments as Etablissement;
      return MaterialPageRoute(
        
        settings: routeSettings,
        builder: (_) => DetailPage(establishment:etb)
      );
    case Scene.routeName:
        return MaterialPageRoute(
        settings: routeSettings,

        builder: (_) => const Scene()
        );
  }
}

