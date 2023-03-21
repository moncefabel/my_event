import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myevent/constants/utils.dart';
import 'package:myevent/features/screens/Home/Widgets/FooterBar/navigation_bar.dart';
import 'package:myevent/features/screens/Home/Widgets/Body/home_display.dart';
import 'package:myevent/features/screens/onboarding/onboarding.dart';
import 'package:provider/provider.dart';

import '../../../provider/customer_provider.dart';
import 'Widgets/Header/header_section.dart';
import 'Widgets/Header/search_bar.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: NavBar());
  }
}