import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:myevent/constants/utils.dart';
import 'package:myevent/notification_view.dart';
import 'package:myevent/provider/customer_provider.dart';
import 'package:myevent/router.dart';
import 'package:myevent/features/screens/onboarding/onboarding.dart';
import 'package:provider/provider.dart';

/*void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => CustomerProvider(),
    )
  ], child:  const MyApp()));
}*/

void main() {
  runApp(const MyApp1());
}

class MyApp1 extends StatelessWidget {
  const MyApp1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notification Screen',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const NotificationView(),
    );
  }
}

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
