import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myevent/constants/utils.dart';
import 'package:myevent/features/screens/Home/home.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = '/onBoarding';
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // onboarding75X (1:344)
        padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 20*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // subtractyQZ (1:345)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 29*fem),
              width: 375*fem,
              height: 490*fem,
              child: Image.asset(
                'assets/screens/images/rsz_1resteau.png',
                width: 375*fem,
                height: 490*fem,
              ),
            ),
            Center(
              // myeventeFo (3304:64)
              child: Container(
                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 7*fem, 17*fem),
                child: Text(
                  'MyEvent',
                  textAlign: TextAlign.center,
                  style: SafeGoogleFont (
                    'Aguafina Script',
                    fontSize: 36*ffem,
                    fontWeight: FontWeight.w400,
                    height: 0.8888888889*ffem/fem,
                    letterSpacing: 0.18*fem,
                    color: Color(0xff4c9fc1),
                  ),
                ),
              ),
            ),
            Container(
              // contentSSZ (1:352)
              margin: EdgeInsets.fromLTRB(17*fem, 0*fem, 24*fem, 0*fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    // weareheretomakeyourbookingeasi (1:355)
                    child: Container(
                      margin: EdgeInsets.fromLTRB(14*fem, 0*fem, 0*fem, 35*fem),
                      constraints: BoxConstraints (
                        maxWidth: 296*fem,
                      ),
                      child: Text(
                        'We are here to make your Booking easier',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont (
                          'Plus Jakarta Sans',
                          fontSize: 24*ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.3333333333*ffem/fem,
                          letterSpacing: 0.12*fem,
                          color: Color(0xff111111),
                        ),
                      ),
                    ),
                  ),
                  
                  Container(
                    // action8ih (1:357)
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                       GestureDetector(
                         onTap: () {
                    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                  },
                       child: Container(
                          // labelFoK (I1:359;23:223)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 23*fem),
                          width: double.infinity,
                          height: 58*fem,
                          decoration: BoxDecoration (
                            color: Color(0xff4c9fc1),
                            borderRadius: BorderRadius.circular(24*fem),
                          ),
                          child: Center(
                            child: Text(
                              'Get Started',
                              style: SafeGoogleFont (
                                'Plus Jakarta Sans',
                                fontSize: 18*ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.4444444444*ffem/fem,
                                letterSpacing: 0.09*fem,
                                color: Color(0xfffefefe),
                              ),
                            ),
                          ),
                        ),
                    ),
                        Center(
                          // donthaveanaccountregisternqB (1:358)
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 4*fem, 0*fem),
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: SafeGoogleFont (
                                  'Plus Jakarta Sans',
                                  fontSize: 16*ffem,
                                  fontWeight: FontWeight.w600,
                                  height: 1.5*ffem/fem,
                                  letterSpacing: 0.08*fem,
                                  color: Color(0xffffffff),
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Have an account? ',
                                    style: SafeGoogleFont (
                                      'Plus Jakarta Sans',
                                      fontSize: 16*ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.5*ffem/fem,
                                      letterSpacing: 0.08*fem,
                                      color: Color(0xff111111),
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Register',
                                    style: SafeGoogleFont (
                                      'Plus Jakarta Sans',
                                      fontSize: 16*ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.5*ffem/fem,
                                      letterSpacing: 0.08*fem,
                                      color: Color(0xff4c9fc1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
          );
  }
}