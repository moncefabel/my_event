import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:myevent/constants/utils.dart';
import 'package:myevent/provider/customer_provider.dart';
import 'package:myevent/router.dart';
import 'package:myevent/features/screens/onboarding/onboarding.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.getInitialMessage();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => CustomerProvider(),
    )
  ], child: const MyApp()));
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
