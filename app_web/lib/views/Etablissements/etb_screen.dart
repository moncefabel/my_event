import 'package:app_web/providers/proprio_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class EtbScreen extends StatefulWidget {
  static const String routeName = '/etbs';
  const EtbScreen({Key? key}) : super(key: key);

  @override
  State<EtbScreen> createState() => _EtbScreenState();
}

class _EtbScreenState extends State<EtbScreen> {
  @override
  Widget build(BuildContext context) {
    final proprio = Provider.of<ProprioProvider>(context).proprio;
    return Scaffold(
      body: Center(
        child: Text(
          proprio.toJson(),
        )
      )
    );
  }
}