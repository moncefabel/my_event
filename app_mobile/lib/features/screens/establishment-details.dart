import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myevent/constants/utils.dart';


class Scene extends StatefulWidget {
 
 static const String routeName = '/details';
 const Scene({Key? key}) : super(key: key);
  @override
  State<Scene> createState() => _SceneState();
}


class _SceneState extends State<Scene> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // establishmentdetailsXtq (3308:194)
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xfffefefe),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // autogroupjtdbDFs (9zPtvDpgpiPNFq4GqKJtDb)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 120*fem),
              width: double.infinity,
              height: 618*fem,
              child: Stack(
                children: [
                  Positioned(
                    // rectangle224725Yy (3308:195)
                    left: 0*fem,
                    top: 0*fem,
                    child: Align(
                      child: SizedBox(
                        width: 375*fem,
                        height: 400*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            color: Color(0xffd9d9d9),
                            image: DecorationImage (
                              fit: BoxFit.cover,
                              image: AssetImage (
                                'assets/screens/images/rectangle-22472-bg.png',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // tophKT (3308:196)
                    left: 24*fem,
                    top: 60*fem,
                    child: Container(
                      width: 260*fem,
                      height: 48*fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // arrowbackNAh (3308:198)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 18*fem, 0*fem),
                            width: 48*fem,
                            height: 48*fem,
                            child: Image.asset(
                              'assets/screens/images/arrow-back.png',
                              width: 48*fem,
                              height: 48*fem,
                            ),
                          ),
                          Text(
                            // establishmentdetails1jT (3308:197)
                            'Establishment  Details',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont (
                              'Plus Jakarta Sans',
                              fontSize: 18*ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.4444444444*ffem/fem,
                              letterSpacing: 0.09*fem,
                              color: Color(0xfffefefe),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    // rectangle224735DX (3308:204)
                    left: 0*fem,
                    top: 347*fem,
                    child: Align(
                      child: SizedBox(
                        width: 375*fem,
                        height: 271*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            color: Color(0xfffefefe),
                            borderRadius: BorderRadius.only (
                              topLeft: Radius.circular(30*fem),
                              topRight: Radius.circular(30*fem),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // slider5sj (3308:205)
                    left: 160*fem,
                    top: 307*fem,
                    child: Container(
                      width: 56*fem,
                      height: 8*fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // dotZH7 (3308:206)
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
                            // dot3TB (3308:207)
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
                            // dotjqo (3308:208)
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
                  ),
                  Positioned(
                    // detailfDf (3308:209)
                    left: 24*fem,
                    top: 470*fem,
                    child: Container(
                      width: 158*fem,
                      height: 68*fem,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // detailsjzD (3308:211)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 16*fem),
                            child: Text(
                              'Details',
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
                            // tajmahalestkdaetkdanhb (3308:210)
                            'Taj Mahal est kda et kda ',
                            style: SafeGoogleFont (
                              'Plus Jakarta Sans',
                              fontSize: 14*ffem,
                              fontWeight: FontWeight.w400,
                              height: 2*ffem/fem,
                              letterSpacing: 0.07*fem,
                              color: Color(0xff111111),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    // titleFr5 (3308:212)
                    left: 24*fem,
                    top: 378*fem,
                    child: Container(
                      width: 327*fem,
                      height: 60*fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // aboutXYh (3308:213)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 36.67*fem, 0*fem),
                            width: 250.33*fem,
                            height: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  // tajmahalzSH (3308:214)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 8*fem),
                                  child: Text(
                                    'Taj Mahal',
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
                                Container(
                                  // detailFND (3308:215)
                                  width: double.infinity,
                                  height: 20*fem,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // group1000003528m5f (3308:216)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 48*fem, 0*fem),
                                        height: double.infinity,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              // vectorFFj (3308:217)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 8.67*fem, 0*fem),
                                              width: 10.67*fem,
                                              height: 13.33*fem,
                                              child: Image.asset(
                                                'assets/screens/images/vector.png',
                                                width: 10.67*fem,
                                                height: 13.33*fem,
                                              ),
                                            ),
                                            Text(
                                              // parisfranceWhT (3308:218)
                                              'Paris, France',
                                              style: SafeGoogleFont (
                                                'Plus Jakarta Sans',
                                                fontSize: 12*ffem,
                                                fontWeight: FontWeight.w500,
                                                height: 1.6666666667*ffem/fem,
                                                letterSpacing: 0.06*fem,
                                                color: Color(0xff434e58),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        // group1000003529Qnq (3308:219)
                                        height: double.infinity,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              // starjKK (3308:220)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 4*fem, 0*fem),
                                              width: 14*fem,
                                              height: 14*fem,
                                              child: Image.asset(
                                                'assets/screens/images/star.png',
                                                width: 14*fem,
                                                height: 14*fem,
                                              ),
                                            ),
                                            RichText(
                                              // type16Cyb (3308:221)
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
                                                    text: '(41 Reviews)',
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
                          Container(
                            // wishlist2bF (3308:222)
                            width: 40*fem,
                            height: 40*fem,
                            child: Image.asset(
                              'assets/screens/images/wishlist.png',
                              width: 40*fem,
                              height: 40*fem,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // reviewvAq (3308:223)
              margin: EdgeInsets.fromLTRB(24*fem, 0*fem, 24*fem, 14*fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // titleD9w (3308:224)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 16*fem),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // reviewsuHf (3308:225)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 217*fem, 0*fem),
                          child: Text(
                            'Reviews',
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
                          // seeallyoK (3308:226)
                          'See all',
                          style: SafeGoogleFont (
                            'Plus Jakarta Sans',
                            fontSize: 14*ffem,
                            fontWeight: FontWeight.w500,
                            height: 1.5714285714*ffem/fem,
                            letterSpacing: 0.07*fem,
                            color: Color(0xff009b8d),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // listHJD (3308:227)
                    width: double.infinity,
                    height: 130*fem,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // imageziR (3308:228)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 16*fem, 0*fem),
                          width: 45*fem,
                          height: 45*fem,
                          child: Image.asset(
                            'assets/screens/images/image.png',
                            width: 45*fem,
                            height: 45*fem,
                          ),
                        ),
                        Container(
                          // descriptions1X (3308:231)
                          width: 266*fem,
                          height: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // group1000003199yaM (3308:233)
                                width: double.infinity,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      // jhonekenoadyJ6q (3308:234)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 48*fem, 0*fem),
                                      child: Text(
                                        'Jhone Kenoady',
                                        style: SafeGoogleFont (
                                          'Plus Jakarta Sans',
                                          fontSize: 18*ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.4444444444*ffem/fem,
                                          letterSpacing: 0.09*fem,
                                          color: Color(0xff111111),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      // nov2022Yms (3308:235)
                                      '23 Nov 2022',
                                      style: SafeGoogleFont (
                                        'Plus Jakarta Sans',
                                        fontSize: 14*ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.5714285714*ffem/fem,
                                        letterSpacing: 0.07*fem,
                                        color: Color(0xff9ca4ab),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // autogroupkspmTtq (9zPvH1tjGpP9YPHvA3kSpm)
                                padding: EdgeInsets.fromLTRB(0*fem, 8*fem, 0*fem, 0*fem),
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      // ratingsNW1 (3308:236)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 16*fem),
                                      padding: EdgeInsets.fromLTRB(0*fem, 0.3*fem, 0*fem, 0.28*fem),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            // iconstarqPb (3308:237)
                                            width: 14*fem,
                                            height: 13.42*fem,
                                            child: Image.asset(
                                              'assets/screens/images/icon-star-n4u.png',
                                              width: 14*fem,
                                              height: 13.42*fem,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8*fem,
                                          ),
                                          Container(
                                            // iconstarKZf (3308:239)
                                            width: 14*fem,
                                            height: 13.42*fem,
                                            child: Image.asset(
                                              'assets/screens/images/icon-star-9eD.png',
                                              width: 14*fem,
                                              height: 13.42*fem,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8*fem,
                                          ),
                                          Container(
                                            // iconstard4Z (3308:241)
                                            width: 14*fem,
                                            height: 13.42*fem,
                                            child: Image.asset(
                                              'assets/screens/images/icon-star.png',
                                              width: 14*fem,
                                              height: 13.42*fem,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8*fem,
                                          ),
                                          Container(
                                            // iconstar81K (3308:243)
                                            width: 14*fem,
                                            height: 13.42*fem,
                                            child: Image.asset(
                                              'assets/screens/images/icon-star-ofb.png',
                                              width: 14*fem,
                                              height: 13.42*fem,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8*fem,
                                          ),
                                          Container(
                                            // iconstar26h (3308:245)
                                            width: 14*fem,
                                            height: 13.42*fem,
                                            child: Image.asset(
                                              'assets/screens/images/icon-star-mS5.png',
                                              width: 14*fem,
                                              height: 13.42*fem,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      // ametminimmollitnondeseruntulla (3308:232)
                                      constraints: BoxConstraints (
                                        maxWidth: 266*fem,
                                      ),
                                      child: Text(
                                        'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
                                        style: SafeGoogleFont (
                                          'Plus Jakarta Sans',
                                          fontSize: 14*ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.5714285714*ffem/fem,
                                          letterSpacing: 0.07*fem,
                                          color: Color(0xff111111),
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
              // priceandactionkS1 (3308:247)
              padding: EdgeInsets.fromLTRB(24*fem, 22*fem, 24*fem, 22*fem),
              width: double.infinity,
              height: 90*fem,
              decoration: BoxDecoration (
                color: Color(0xfffefefe),
              ),
              child: Container(
                // content3vu (3308:249)
                width: double.infinity,
                height: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // personBXK (3308:250)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 43*fem, 0*fem),
                      child: RichText(
                        text: TextSpan(
                          style: SafeGoogleFont (
                            'Plus Jakarta Sans',
                            fontSize: 20*ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.4*ffem/fem,
                            letterSpacing: 0.1*fem,
                            color: Color(0xff111111),
                          ),
                          children: [
                            TextSpan(
                              text: '\$32 ',
                              style: SafeGoogleFont (
                                'Plus Jakarta Sans',
                                fontSize: 20*ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.4*ffem/fem,
                                letterSpacing: 0.1*fem,
                                color: Color(0xff111111),
                              ),
                            ),
                            TextSpan(
                              text: '/ Person',
                              style: SafeGoogleFont (
                                'Plus Jakarta Sans',
                                fontSize: 16*ffem,
                                fontWeight: FontWeight.w500,
                                height: 1.5*ffem/fem,
                                letterSpacing: 0.08*fem,
                                color: Color(0xff78828a),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      // labelvFw (I3308:251;23:221)
                      width: 178*fem,
                      height: double.infinity,
                      decoration: BoxDecoration (
                        color: Color(0xff4c9fc1),
                        borderRadius: BorderRadius.circular(20*fem),
                      ),
                      child: Center(
                        child: Text(
                          'Book Now',
                          style: SafeGoogleFont (
                            'Poppins',
                            fontSize: 14*ffem,
                            fontWeight: FontWeight.w500,
                            height: 1.5714285714*ffem/fem,
                            letterSpacing: 0.07*fem,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
          );
  }
}