import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page1')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, 'page2'),
          child: Text('Go to Page2'),
        ),
      ),
    );
  }
}
