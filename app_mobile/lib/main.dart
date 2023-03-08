import 'package:flutter/material.dart';
import 'package:app_mobile/constants/utils.dart';
import 'package:app_mobile/router.dart';

import 'package:app_mobile/features/screens/onboarding/onboarding.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
