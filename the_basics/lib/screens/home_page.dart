import 'package:flutter/material.dart';
import 'package:the_basics/screens/page1.dart';
import 'package:the_basics/screens/page2.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orange,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Call'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'),
        ],
      ),
      body: Navigator(
        onGenerateRoute: (settings) {
          Widget page = Page1();
          if (settings.name == 'page2') page = Page2();
          return MaterialPageRoute(builder: (_) => page);
        },
      ),
    );
  }
}
