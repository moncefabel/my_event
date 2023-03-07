import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_mobile/constants/utils.dart';
import 'package:app_mobile/router.dart';

import 'package:app_mobile/features/screens/Home/home.dart';
import 'package:app_mobile/features/screens/onboarding/onboarding.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyEvent',
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const Scaffold(
        body: SingleChildScrollView(
          child: OnboardingScreen(),
        ),
      ),
    );
  }
}
