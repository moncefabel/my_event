import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_mobile/constants/utils.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // homeL1j (1:360)
        padding: EdgeInsets.fromLTRB(22*fem, 40*fem, 23*fem, 18*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xfffefefe),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // userCJq (1:383)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 3*fem, 28*fem),
              width: double.infinity,
              height: 46*fem,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // profileUXF (1:399)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 134*fem, 0*fem),
                    height: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // yyo (1:400)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 15*fem, 0*fem),
                          width: 40*fem,
                          height: 40*fem,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100*fem),
                            child: Image.asset(
                              'assets/screens/images/.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          // group1000003474FRX (1:401)
                          width: 92*fem,
                          height: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                // hiandykt5 (1:402)
                                'Hi, Andy',
                                style: SafeGoogleFont (
                                  'Plus Jakarta Sans',
                                  fontSize: 18*ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.4444444444*ffem/fem,
                                  letterSpacing: 0.09*fem,
                                  color: Color(0xff111111),
                                ),
                              ),
                              Container(
                                // group1000003473SW1 (1:403)
                                padding: EdgeInsets.fromLTRB(2.67*fem, 0*fem, 0*fem, 0*fem),
                                width: double.infinity,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // bxsmap11LrH (1:405)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 6.67*fem, 0*fem),
                                      width: 10.67*fem,
                                      height: 13.33*fem,
                                      child: Image.asset(
                                        'assets/screens/images/bxs-map-1-1-ftZ.png',
                                        width: 10.67*fem,
                                        height: 13.33*fem,
                                      ),
                                    ),
                                    Text(
                                      // netherlands1Bj (1:404)
                                      'Netherlands',
                                      style: SafeGoogleFont (
                                        'Plus Jakarta Sans',
                                        fontSize: 12*ffem,
                                        fontWeight: FontWeight.w500,
                                        height: 1.6666666667*ffem/fem,
                                        letterSpacing: 0.06*fem,
                                        color: Color(0xff78828a),
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
                  Container(
                    // actionJgd (1:384)
                    width: 46*fem,
                    height: 46*fem,
                    child: Image.asset(
                      'assets/screens/images/action.png',
                      width: 46*fem,
                      height: 46*fem,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // inputfieldp9B (1:361)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 3*fem, 36*fem),
              width: 327*fem,
              height: 52*fem,
              decoration: BoxDecoration (
                color: Color(0xfff6f8fe),
                borderRadius: BorderRadius.circular(24*fem),
              ),
              child: Container(
                // frame16Mb (I1:361;23:250)
                padding: EdgeInsets.fromLTRB(17.5*fem, 14*fem, 17*fem, 14*fem),
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration (
                  color: Color(0xfff6f8fe),
                  borderRadius: BorderRadius.circular(24*fem),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // iconsearchywB (I1:361;23:251)
                      margin: EdgeInsets.fromLTRB(0*fem, 0.54*fem, 9.3*fem, 0*fem),
                      width: 15.2*fem,
                      height: 15.54*fem,
                      child: Image.asset(
                        'assets/screens/images/icon-search.png',
                        width: 15.2*fem,
                        height: 15.54*fem,
                      ),
                    ),
                    Container(
                      // smalllabelregular12px3AM (I1:361;23:253;23:197)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 172*fem, 0*fem),
                      child: Text(
                        'Search...',
                        style: SafeGoogleFont (
                          'Plus Jakarta Sans',
                          fontSize: 16*ffem,
                          fontWeight: FontWeight.w500,
                          height: 1.5*ffem/fem,
                          letterSpacing: 0.08*fem,
                          color: Color(0xff9ca4ab),
                        ),
                      ),
                    ),
                    Container(
                      // filteri1b (I1:361;23:254)
                      width: 26*fem,
                      height: 18*fem,
                      child: Image.asset(
                        'assets/screens/images/filter.png',
                        width: 26*fem,
                        height: 18*fem,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              // frequentlyvisitedcMs (1:407)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 2*fem, 28*fem),
              width: 328*fem,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    // titleuLy (1:445)
                    margin: EdgeInsets.fromLTRB(1.5*fem, 0*fem, 0*fem, 16*fem),
                    width: double.infinity,
                    height: 26*fem,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // frequentlyvisitedzdK (1:446)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 111.5*fem, 0*fem),
                          child: Text(
                            'Frequently visited\n',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont (
                              'Plus Jakarta Sans',
                              fontSize: 18*ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.4444444444*ffem/fem,
                              letterSpacing: 0.09*fem,
                              color: Color(0xff111111),
                            ),
                          ),
                        ),
                        Container(
                          // sliderehs (1:447)
                          margin: EdgeInsets.fromLTRB(0*fem, 9*fem, 0*fem, 9*fem),
                          height: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // dotMsB (1:448)
                                width: 24*fem,
                                height: 8*fem,
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(100*fem),
                                  color: Color(0xff009b8d),
                                ),
                              ),
                              SizedBox(
                                width: 8*fem,
                              ),
                              Container(
                                // dotFSm (1:449)
                                width: 8*fem,
                                height: 8*fem,
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(4*fem),
                                  color: Color(0xffd1d8dd),
                                ),
                              ),
                              SizedBox(
                                width: 8*fem,
                              ),
                              Container(
                                // dot9HF (1:450)
                                width: 8*fem,
                                height: 8*fem,
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(4*fem),
                                  color: Color(0xffd1d8dd),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // itemsU4d (1:408)
                    width: double.infinity,
                    height: 232*fem,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // listnr1 (1:409)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 16*fem, 0*fem),
                          width: 156*fem,
                          height: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // group1000003468VEd (1:410)
                                padding: EdgeInsets.fromLTRB(120*fem, 13*fem, 8*fem, 13*fem),
                                width: double.infinity,
                                height: 150*fem,
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(8*fem),
                                  image: DecorationImage (
                                    fit: BoxFit.cover,
                                    image: AssetImage (
                                      'assets/screens/images/rectangle-22468-bg.png',
                                    ),
                                  ),
                                ),
                                child: Align(
                                  // group1000003464YTo (1:412)
                                  alignment: Alignment.topRight,
                                  child: SizedBox(
                                    width: 28*fem,
                                    height: 28*fem,
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 96*fem),
                                      child: Image.asset(
                                        'assets/screens/images/group-1000003464.png',
                                        width: 28*fem,
                                        height: 28*fem,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                // autogroupyrjhmbT (9zPp7CAxBTQWcnNJCXyrJH)
                                padding: EdgeInsets.fromLTRB(0*fem, 8*fem, 0*fem, 0*fem),
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      // group1000003467GHK (1:416)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 8*fem),
                                      width: 105*fem,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            // tahitibeachANh (1:417)
                                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4*fem),
                                            child: Text(
                                              'Tahiti Beach',
                                              style: SafeGoogleFont (
                                                'Plus Jakarta Sans',
                                                fontSize: 14*ffem,
                                                fontWeight: FontWeight.w600,
                                                height: 1.5714285714*ffem/fem,
                                                letterSpacing: 0.07*fem,
                                                color: Color(0xff111111),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            // group10000034652fo (1:418)
                                            padding: EdgeInsets.fromLTRB(2.33*fem, 0*fem, 0*fem, 0*fem),
                                            width: double.infinity,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  // bxsmap11j4R (1:420)
                                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 6.33*fem, 0*fem),
                                                  width: 9.33*fem,
                                                  height: 11.67*fem,
                                                  child: Image.asset(
                                                    'assets/screens/images/bxs-map-1-1-9p1.png',
                                                    width: 9.33*fem,
                                                    height: 11.67*fem,
                                                  ),
                                                ),
                                                RichText(
                                                  // polynesiafrencho4H (1:419)
                                                  text: TextSpan(
                                                    style: SafeGoogleFont (
                                                      'Plus Jakarta Sans',
                                                      fontSize: 10*ffem,
                                                      fontWeight: FontWeight.w500,
                                                      height: 1.8*ffem/fem,
                                                      letterSpacing: 0.05*fem,
                                                      color: Color(0xff78828a),
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text: 'Polynesia, ',
                                                        style: SafeGoogleFont (
                                                          'Plus Jakarta Sans',
                                                          fontSize: 10*ffem,
                                                          fontWeight: FontWeight.w500,
                                                          height: 1.8*ffem/fem,
                                                          letterSpacing: 0.05*fem,
                                                          color: Color(0xff78828a),
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: 'French ',
                                                        style: SafeGoogleFont (
                                                          'Plus Jakarta Sans',
                                                          fontSize: 10*ffem,
                                                          fontWeight: FontWeight.w500,
                                                          height: 1.8*ffem/fem,
                                                          letterSpacing: 0.05*fem,
                                                          color: Color(0xff78828a),
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
                                    Container(
                                      // group1000003466tdT (1:422)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 2*fem, 0*fem),
                                      width: double.infinity,
                                      height: 22*fem,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            // BW5 (1:423)
                                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 57*fem, 0*fem),
                                            child: Text(
                                              '\$235',
                                              style: SafeGoogleFont (
                                                'Plus Jakarta Sans',
                                                fontSize: 14*ffem,
                                                fontWeight: FontWeight.w700,
                                                height: 1.5714285714*ffem/fem,
                                                letterSpacing: 0.07*fem,
                                                color: Color(0xff111111),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            // group1000003429a2R (1:424)
                                            margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 0*fem, 1*fem),
                                            height: double.infinity,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  // starTc1 (1:425)
                                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 4*fem, 0*fem),
                                                  width: 14*fem,
                                                  height: 14*fem,
                                                  child: Image.asset(
                                                    'assets/screens/images/star-Cah.png',
                                                    width: 14*fem,
                                                    height: 14*fem,
                                                  ),
                                                ),
                                                RichText(
                                                  // type16Lvh (1:426)
                                                  text: TextSpan(
                                                    style: SafeGoogleFont (
                                                      'Plus Jakarta Sans',
                                                      fontSize: 12*ffem,
                                                      fontWeight: FontWeight.w600,
                                                      height: 1.6666666667*ffem/fem,
                                                      letterSpacing: 0.06*fem,
                                                      color: Color(0xffffcd19),
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text: '4.4 ',
                                                      ),
                                                      TextSpan(
                                                        text: '(32)',
                                                        style: SafeGoogleFont (
                                                          'Plus Jakarta Sans',
                                                          fontSize: 12*ffem,
                                                          fontWeight: FontWeight.w600,
                                                          height: 1.6666666667*ffem/fem,
                                                          letterSpacing: 0.06*fem,
                                                          color: Color(0xff78828a),
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
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // listCrR (1:427)
                          width: 156*fem,
                          height: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // group1000003468vGd (1:428)
                                padding: EdgeInsets.fromLTRB(120*fem, 13*fem, 8*fem, 13*fem),
                                width: double.infinity,
                                height: 150*fem,
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(8*fem),
                                  image: DecorationImage (
                                    fit: BoxFit.cover,
                                    image: AssetImage (
                                      'assets/screens/images/rectangle-22468-bg-zgV.png',
                                    ),
                                  ),
                                ),
                                child: Align(
                                  // group1000003464kmT (1:430)
                                  alignment: Alignment.topRight,
                                  child: SizedBox(
                                    width: 28*fem,
                                    height: 28*fem,
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 96*fem),
                                      child: Image.asset(
                                        'assets/screens/images/group-1000003464-Ko3.png',
                                        width: 28*fem,
                                        height: 28*fem,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                // autogroupubsdP3j (9zPqAuu7TVHMGhpZGiubSD)
                                padding: EdgeInsets.fromLTRB(0*fem, 8*fem, 0*fem, 0*fem),
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      // group1000003467sUh (1:434)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 8*fem),
                                      width: 125*fem,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            // stluciamountain9h7 (1:435)
                                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4*fem),
                                            child: Text(
                                              'St. Lucia Mountain',
                                              style: SafeGoogleFont (
                                                'Plus Jakarta Sans',
                                                fontSize: 14*ffem,
                                                fontWeight: FontWeight.w600,
                                                height: 1.5714285714*ffem/fem,
                                                letterSpacing: 0.07*fem,
                                                color: Color(0xff111111),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            // group1000003465CvH (1:436)
                                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 36*fem, 0*fem),
                                            padding: EdgeInsets.fromLTRB(2.33*fem, 0*fem, 0*fem, 0*fem),
                                            width: double.infinity,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  // bxsmap11UN1 (1:438)
                                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 6.33*fem, 0*fem),
                                                  width: 9.33*fem,
                                                  height: 11.67*fem,
                                                  child: Image.asset(
                                                    'assets/screens/images/bxs-map-1-1.png',
                                                    width: 9.33*fem,
                                                    height: 11.67*fem,
                                                  ),
                                                ),
                                                Text(
                                                  // southamericaKdX (1:437)
                                                  'South America',
                                                  style: SafeGoogleFont (
                                                    'Plus Jakarta Sans',
                                                    fontSize: 10*ffem,
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.8*ffem/fem,
                                                    letterSpacing: 0.05*fem,
                                                    color: Color(0xff78828a),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      // group1000003466Qus (1:440)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 4*fem, 0*fem),
                                      width: double.infinity,
                                      height: 22*fem,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            // 73b (1:441)
                                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 59*fem, 0*fem),
                                            child: Text(
                                              '\$182',
                                              style: SafeGoogleFont (
                                                'Plus Jakarta Sans',
                                                fontSize: 14*ffem,
                                                fontWeight: FontWeight.w700,
                                                height: 1.5714285714*ffem/fem,
                                                letterSpacing: 0.07*fem,
                                                color: Color(0xff111111),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            // group1000003429ZwB (1:442)
                                            margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 0*fem, 1*fem),
                                            height: double.infinity,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  // star4N9 (1:443)
                                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 4*fem, 0*fem),
                                                  width: 14*fem,
                                                  height: 14*fem,
                                                  child: Image.asset(
                                                    'assets/screens/images/star-hCH.png',
                                                    width: 14*fem,
                                                    height: 14*fem,
                                                  ),
                                                ),
                                                RichText(
                                                  // type16KYy (1:444)
                                                  text: TextSpan(
                                                    style: SafeGoogleFont (
                                                      'Plus Jakarta Sans',
                                                      fontSize: 12*ffem,
                                                      fontWeight: FontWeight.w600,
                                                      height: 1.6666666667*ffem/fem,
                                                      letterSpacing: 0.06*fem,
                                                      color: Color(0xffffcd19),
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text: '4.4 ',
                                                      ),
                                                      TextSpan(
                                                        text: '(41)',
                                                        style: SafeGoogleFont (
                                                          'Plus Jakarta Sans',
                                                          fontSize: 12*ffem,
                                                          fontWeight: FontWeight.w600,
                                                          height: 1.6666666667*ffem/fem,
                                                          letterSpacing: 0.06*fem,
                                                          color: Color(0xff78828a),
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
                                  ],
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
            Container(
              // onbudgettouroMf (1:496)
              margin: EdgeInsets.fromLTRB(2*fem, 0*fem, 0*fem, 29*fem),
              width: 328*fem,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // titleFDf (1:497)
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // announcementmC1 (1:499)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 145*fem, 0*fem),
                          child: Text(
                            'Announcement\n',
                            style: SafeGoogleFont (
                              'Plus Jakarta Sans',
                              fontSize: 18*ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.4444444444*ffem/fem,
                              letterSpacing: 0.09*fem,
                              color: Color(0xff111111),
                            ),
                          ),
                        ),
                        Container(
                          // seeall27w (1:498)
                          margin: EdgeInsets.fromLTRB(0*fem, 0.4*fem, 0*fem, 0*fem),
                          child: Text(
                            'See All',
                            style: SafeGoogleFont (
                              'Plus Jakarta Sans',
                              fontSize: 14*ffem,
                              fontWeight: FontWeight.w500,
                              height: 1.5714285714*ffem/fem,
                              letterSpacing: 0.07*fem,
                              color: Color(0xff009b8d),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // autogroupjfd7V1X (9zPr3Dncresfe4mcsNJfD7)
                    padding: EdgeInsets.fromLTRB(0*fem, 20.2*fem, 0*fem, 0*fem),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // listB9F (1:500)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 2*fem, 17.6*fem),
                          width: double.infinity,
                          height: 94.6*fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // rectangle22469TsT (1:501)
                                width: 86*fem,
                                height: 94.6*fem,
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(8*fem),
                                  color: Color(0xffd9d9d9),
                                  image: DecorationImage (
                                    fit: BoxFit.cover,
                                    image: AssetImage (
                                      'assets/screens/images/rectangle-22469-bg.png',
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                // autogroupsvpw8To (9zPrGDQy8ErACUEWtFSvPw)
                                padding: EdgeInsets.fromLTRB(12*fem, 5.5*fem, 0*fem, 6.6*fem),
                                height: double.infinity,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // group10000034842ZB (1:502)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 43*fem, 0*fem),
                                      width: 112*fem,
                                      height: double.infinity,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            // group1000003483KHP (1:507)
                                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 15.2*fem),
                                            width: double.infinity,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  // ledadubeachCry (1:508)
                                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 2.4*fem),
                                                  child: Text(
                                                    'Ledadu Beach',
                                                    style: SafeGoogleFont (
                                                      'Plus Jakarta Sans',
                                                      fontSize: 16*ffem,
                                                      fontWeight: FontWeight.w700,
                                                      height: 1.5*ffem/fem,
                                                      letterSpacing: 0.08*fem,
                                                      color: Color(0xff111111),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  // days2nightsFqF (1:509)
                                                  '3 days 2 nights',
                                                  style: SafeGoogleFont (
                                                    'Plus Jakarta Sans',
                                                    fontSize: 12*ffem,
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.6666666667*ffem/fem,
                                                    letterSpacing: 0.06*fem,
                                                    color: Color(0xff78828a),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            // group1000003465Zb3 (1:503)
                                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 39*fem, 0*fem),
                                            padding: EdgeInsets.fromLTRB(3*fem, 0*fem, 0*fem, 0*fem),
                                            width: double.infinity,
                                            height: 20.9*fem,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  // bxsmap11RNM (1:505)
                                                  margin: EdgeInsets.fromLTRB(0*fem, 1.1*fem, 7*fem, 0*fem),
                                                  width: 12*fem,
                                                  height: 16.5*fem,
                                                  child: Image.asset(
                                                    'assets/screens/images/bxs-map-1-1-peH.png',
                                                    width: 12*fem,
                                                    height: 16.5*fem,
                                                  ),
                                                ),
                                                Container(
                                                  // australiatmj (1:504)
                                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0.9*fem),
                                                  child: Text(
                                                    'Australia',
                                                    style: SafeGoogleFont (
                                                      'Plus Jakarta Sans',
                                                      fontSize: 12*ffem,
                                                      fontWeight: FontWeight.w500,
                                                      height: 1.6666666667*ffem/fem,
                                                      letterSpacing: 0.06*fem,
                                                      color: Color(0xff78828a),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      // personm4q (1:510)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 1.1*fem),
                                      child: RichText(
                                        text: TextSpan(
                                          style: SafeGoogleFont (
                                            'Plus Jakarta Sans',
                                            fontSize: 12*ffem,
                                            fontWeight: FontWeight.w500,
                                            height: 1.6666666667*ffem/fem,
                                            letterSpacing: 0.06*fem,
                                            color: Color(0xff000000),
                                          ),
                                          children: [
                                            TextSpan(
                                              text: '\$20',
                                              style: SafeGoogleFont (
                                                'Plus Jakarta Sans',
                                                fontSize: 14*ffem,
                                                fontWeight: FontWeight.w700,
                                                height: 1.5714285714*ffem/fem,
                                                letterSpacing: 0.07*fem,
                                                color: Color(0xff111111),
                                              ),
                                            ),
                                            TextSpan(
                                              text: '/Person',
                                              style: SafeGoogleFont (
                                                'Plus Jakarta Sans',
                                                fontSize: 12*ffem,
                                                fontWeight: FontWeight.w500,
                                                height: 1.6666666667*ffem/fem,
                                                letterSpacing: 0.06*fem,
                                                color: Color(0xff78828a),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // listqMX (1:511)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 3*fem, 0*fem),
                          width: double.infinity,
                          height: 94.6*fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // rectangle22469igD (1:512)
                                width: 86*fem,
                                height: 94.6*fem,
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(8*fem),
                                  color: Color(0xffd9d9d9),
                                  image: DecorationImage (
                                    fit: BoxFit.cover,
                                    image: AssetImage (
                                      'assets/screens/images/rectangle-22469-bg-pyj.png',
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                // autogrouptzrdnRB (9zPrqXnndnwDXcM29ttZrD)
                                padding: EdgeInsets.fromLTRB(12*fem, 5.5*fem, 0*fem, 6.6*fem),
                                height: double.infinity,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // group1000003484UJ1 (1:513)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 28*fem, 0*fem),
                                      width: 127*fem,
                                      height: double.infinity,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            // group1000003483MMo (1:518)
                                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 15.2*fem),
                                            width: double.infinity,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  // endigadabeachSPF (1:519)
                                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 2.4*fem),
                                                  child: Text(
                                                    'Endigada Beach',
                                                    style: SafeGoogleFont (
                                                      'Plus Jakarta Sans',
                                                      fontSize: 16*ffem,
                                                      fontWeight: FontWeight.w700,
                                                      height: 1.5*ffem/fem,
                                                      letterSpacing: 0.08*fem,
                                                      color: Color(0xff111111),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  // days4nights5h7 (1:520)
                                                  '5 days 4 nights',
                                                  style: SafeGoogleFont (
                                                    'Plus Jakarta Sans',
                                                    fontSize: 12*ffem,
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.6666666667*ffem/fem,
                                                    letterSpacing: 0.06*fem,
                                                    color: Color(0xff78828a),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            // group1000003465mpq (1:514)
                                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 54*fem, 0*fem),
                                            padding: EdgeInsets.fromLTRB(3*fem, 0*fem, 0*fem, 0*fem),
                                            width: double.infinity,
                                            height: 20.9*fem,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  // bxsmap11SRB (1:516)
                                                  margin: EdgeInsets.fromLTRB(0*fem, 1.1*fem, 7*fem, 0*fem),
                                                  width: 12*fem,
                                                  height: 16.5*fem,
                                                  child: Image.asset(
                                                    'assets/screens/images/bxs-map-1-1-FZo.png',
                                                    width: 12*fem,
                                                    height: 16.5*fem,
                                                  ),
                                                ),
                                                Container(
                                                  // australiau3s (1:515)
                                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0.9*fem),
                                                  child: Text(
                                                    'Australia',
                                                    style: SafeGoogleFont (
                                                      'Plus Jakarta Sans',
                                                      fontSize: 12*ffem,
                                                      fontWeight: FontWeight.w500,
                                                      height: 1.6666666667*ffem/fem,
                                                      letterSpacing: 0.06*fem,
                                                      color: Color(0xff78828a),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      // personkqB (1:521)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 1.1*fem),
                                      child: RichText(
                                        text: TextSpan(
                                          style: SafeGoogleFont (
                                            'Plus Jakarta Sans',
                                            fontSize: 12*ffem,
                                            fontWeight: FontWeight.w500,
                                            height: 1.6666666667*ffem/fem,
                                            letterSpacing: 0.06*fem,
                                            color: Color(0xff000000),
                                          ),
                                          children: [
                                            TextSpan(
                                              text: '\$25',
                                              style: SafeGoogleFont (
                                                'Plus Jakarta Sans',
                                                fontSize: 14*ffem,
                                                fontWeight: FontWeight.w700,
                                                height: 1.5714285714*ffem/fem,
                                                letterSpacing: 0.07*fem,
                                                color: Color(0xff111111),
                                              ),
                                            ),
                                            TextSpan(
                                              text: '/Person',
                                              style: SafeGoogleFont (
                                                'Plus Jakarta Sans',
                                                fontSize: 12*ffem,
                                                fontWeight: FontWeight.w500,
                                                height: 1.6666666667*ffem/fem,
                                                letterSpacing: 0.06*fem,
                                                color: Color(0xff78828a),
                                              ),
                                            ),
                                          ],
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
                ],
              ),
            ),
            Container(
              // serviceqdf (1:362)
              margin: EdgeInsets.fromLTRB(2*fem, 0*fem, 1*fem, 0*fem),
              width: double.infinity,
              height: 72*fem,
              child: Stack(
                children: [
                  Positioned(
                    // listihT (1:363)
                    left: 259*fem,
                    top: 0*fem,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(18.67*fem, 18.67*fem, 18.67*fem, 18.67*fem),
                      width: 64*fem,
                      height: 64*fem,
                      decoration: BoxDecoration (
                        color: Color(0xfff6f8fe),
                        borderRadius: BorderRadius.circular(32*fem),
                      ),
                      child: Center(
                        // categorymQq (1:365)
                        child: SizedBox(
                          width: 26.67*fem,
                          height: 26.67*fem,
                          child: Image.asset(
                            'assets/screens/images/category.png',
                            width: 26.67*fem,
                            height: 26.67*fem,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // list3t9 (1:371)
                    left: 174*fem,
                    top: 0*fem,
                    child: Container(
                      width: 64*fem,
                      height: 64*fem,
                      decoration: BoxDecoration (
                        color: Color(0xfff6f8fe),
                        borderRadius: BorderRadius.circular(32*fem),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            // hotel18eh (1:374)
                            left: 16*fem,
                            top: 16*fem,
                            child: Align(
                              child: SizedBox(
                                width: 32*fem,
                                height: 32*fem,
                                child: Image.asset(
                                  'assets/screens/images/hotel-1.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // actionCPf (3305:87)
                            left: 7.5487098694*fem,
                            top: 2.9981689453*fem,
                            child: Align(
                              child: SizedBox(
                                width: 20.9*fem,
                                height: 18.23*fem,
                                child: Image.asset(
                                  'assets/screens/images/action-dss.png',
                                  width: 20.9*fem,
                                  height: 18.23*fem,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    // list4wf (1:375)
                    left: 88.9999923706*fem,
                    top: 0*fem,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(16*fem, 16*fem, 16*fem, 16*fem),
                      width: 64*fem,
                      height: 64*fem,
                      decoration: BoxDecoration (
                        color: Color(0xfff6f8fe),
                        borderRadius: BorderRadius.circular(32*fem),
                      ),
                      child: Center(
                        // car18wX (1:378)
                        child: SizedBox(
                          width: 32*fem,
                          height: 32*fem,
                          child: Image.asset(
                            'assets/screens/images/car-1.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // listShK (1:379)
                    left: 4*fem,
                    top: 0*fem,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(16*fem, 16*fem, 16*fem, 16*fem),
                      width: 64*fem,
                      height: 64*fem,
                      decoration: BoxDecoration (
                        color: Color(0xfff6f8fe),
                        borderRadius: BorderRadius.circular(32*fem),
                      ),
                      child: Center(
                        // flight1uqo (1:382)
                        child: SizedBox(
                          width: 32*fem,
                          height: 32*fem,
                          child: Image.asset(
                            'assets/screens/images/flight-1.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // rectangle21owB (3306:91)
                    left: 0*fem,
                    top: 0*fem,
                    child: Align(
                      child: SizedBox(
                        width: 327*fem,
                        height: 72*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(20*fem),
                            color: Color(0xff4b9ec1),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x33a5e5ff),
                                offset: Offset(0*fem, 10*fem),
                                blurRadius: 10*fem,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // frame2RxZ (3306:92)
                    left: 41*fem,
                    top: 24*fem,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(3*fem, 1*fem, 1*fem, 1*fem),
                      width: 246*fem,
                      height: 24*fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // home5nD (3306:93)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 55*fem, 0*fem),
                            width: 18*fem,
                            height: 20*fem,
                            child: Image.asset(
                              'assets/screens/images/home.png',
                              width: 18*fem,
                              height: 20*fem,
                            ),
                          ),
                          Container(
                            // favoritem9F (3306:96)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 55*fem, 0.2*fem),
                            width: 20*fem,
                            height: 17.8*fem,
                            child: Image.asset(
                              'assets/screens/images/favorite.png',
                              width: 20*fem,
                              height: 17.8*fem,
                            ),
                          ),
                          Container(
                            // chatsEYd (3306:99)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 54*fem, 0*fem),
                            width: 18*fem,
                            height: 18*fem,
                            child: Image.asset(
                              'assets/screens/images/chats.png',
                              width: 18*fem,
                              height: 18*fem,
                            ),
                          ),
                          Container(
                            // settingsuuf (3306:101)
                            width: 22*fem,
                            height: 22*fem,
                            child: Image.asset(
                              'assets/screens/images/settings.png',
                              width: 22*fem,
                              height: 22*fem,
                            ),
                          ),
                        ],
                      ),
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