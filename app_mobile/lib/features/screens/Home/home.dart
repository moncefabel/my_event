import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myevent/constants/utils.dart';
import 'package:myevent/features/screens/Home/Widgets/FooterBar/navigation_bar.dart';
import 'package:myevent/features/screens/Home/Widgets/Body/etablissements_display.dart';
import 'package:myevent/features/screens/onboarding/onboarding.dart';
import 'package:provider/provider.dart';

import '../../../provider/customer_provider.dart';
import 'Widgets/Body/header_body.dart';
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
    // double baseWidth = 375;
    // double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    // return Container(
    //   width: double.infinity,
    //   child: Container(
    //     // homeL1j (1:360)
    //     padding: EdgeInsets.fromLTRB(22 * fem, 40 * fem, 23 * fem, 18 * fem),
    //     width: double.infinity,
    //     decoration: BoxDecoration(
    //       color: Color(0xfffefefe),
    //     ),
        return MaterialApp(
          home: Provider.of<CustomerProvider>(context).customer.token.isNotEmpty
          ? NavBar()
          : OnboardingScreen()          
        );
    //   ),
    // );
  }
}
