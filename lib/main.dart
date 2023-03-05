import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myevent/constants/utils.dart';
import 'package:myevent/router.dart';

import 'package:myevent/features/screens/Home/home.dart';
import 'package:myevent/features/screens/onboarding/onboarding.dart';
 import 'package:myevent/features/screens/establishment-details.dart';

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
		home: Scaffold(
		body: SingleChildScrollView(
			child: OnboardingScreen(),
		),
		),
	);
	}
}
