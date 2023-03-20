import 'package:flutter/material.dart';
import 'package:the_basics/dashboard_page.dart';
import 'package:the_basics/screens/historic_buy_page.dart';
import 'package:the_basics/screens/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(), //DashboardPage(), //HistoricBuyPage(),
    );
  }
}
