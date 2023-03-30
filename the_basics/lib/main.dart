import 'package:flutter/material.dart';
import 'package:the_basics/dashboard_page.dart';
import 'package:the_basics/test.dart';
import 'package:the_basics/widgets/button_stuff.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyWidget(),
    );
  }
}
