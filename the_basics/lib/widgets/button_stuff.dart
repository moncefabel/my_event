import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool _button1Visible = true;
  bool _button2Visible = true;

  void _handleButton1Pressed() {
    setState(() {
      _button1Visible = false;
    });
  }

  void _handleButton2Pressed() {
    setState(() {
      _button2Visible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: <Widget>[
            if (_button1Visible)
              ElevatedButton(
                onPressed: _handleButton1Pressed,
                child: Text('Button 1'),
              ),
            if (_button2Visible)
              ElevatedButton(
                onPressed: _handleButton2Pressed,
                child: Text('Button 2'),
              ),
          ],
        ),
      ),
    );
  }
}
