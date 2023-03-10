import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../../../constants/utils.dart';

class SingleEtb extends StatelessWidget {
  const SingleEtb({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Column(
      // autogroupjfd7V1X (9zPr3Dncresfe4mcsNJfD7)
      
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            // listqMX (1:511)
            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 3 * fem, 0 * fem),
            width: double.infinity,
            height: 94.6 * fem,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // rectangle22469igD (1:512)
                  width: 86 * fem,
                  height: 94.6 * fem,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8 * fem),
                    color: Color(0xffd9d9d9),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/screens/images/rectangle-22469-bg-pyj.png',
                      ),
                    ),
                  ),
                ),
                Container(
                  // autogrouptzrdnRB (9zPrqXnndnwDXcM29ttZrD)
                  padding: EdgeInsets.fromLTRB(
                      12 * fem, 5.5 * fem, 0 * fem, 6.6 * fem),
                  height: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // group1000003484UJ1 (1:513)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 28 * fem, 0 * fem),
                        width: 127 * fem,
                        height: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // group1000003483MMo (1:518)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 0 * fem, 15.2 * fem),
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    // endigadabeachSPF (1:519)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 2.4 * fem),
                                    child: Text(
                                      'Endigada Beach',
                                      style: SafeGoogleFont(
                                        'Plus Jakarta Sans',
                                        fontSize: 16 * ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.5 * ffem / fem,
                                        letterSpacing: 0.08 * fem,
                                        color: Color(0xff111111),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    // days4nights5h7 (1:520)
                                    '5 days 4 nights',
                                    style: SafeGoogleFont(
                                      'Plus Jakarta Sans',
                                      fontSize: 12 * ffem,
                                      fontWeight: FontWeight.w500,
                                      height: 1.6666666667 * ffem / fem,
                                      letterSpacing: 0.06 * fem,
                                      color: Color(0xff78828a),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              // group1000003465mpq (1:514)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 54 * fem, 0 * fem),
                              padding: EdgeInsets.fromLTRB(
                                  3 * fem, 0 * fem, 0 * fem, 0 * fem),
                              width: double.infinity,
                              height: 20.9 * fem,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // bxsmap11SRB (1:516)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 1.1 * fem, 7 * fem, 0 * fem),
                                    width: 12 * fem,
                                    height: 16.5 * fem,
                                    child: Image.asset(
                                      'assets/screens/images/bxs-map-1-1-FZo.png',
                                      width: 12 * fem,
                                      height: 16.5 * fem,
                                    ),
                                  ),
                                  Container(
                                    // australiau3s (1:515)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 0.9 * fem),
                                    child: Text(
                                      'Australia',
                                      style: SafeGoogleFont(
                                        'Plus Jakarta Sans',
                                        fontSize: 12 * ffem,
                                        fontWeight: FontWeight.w500,
                                        height: 1.6666666667 * ffem / fem,
                                        letterSpacing: 0.06 * fem,
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
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 1.1 * fem),
                        child: RichText(
                          text: TextSpan(
                            style: SafeGoogleFont(
                              'Plus Jakarta Sans',
                              fontSize: 12 * ffem,
                              fontWeight: FontWeight.w500,
                              height: 1.6666666667 * ffem / fem,
                              letterSpacing: 0.06 * fem,
                              color: Color(0xff000000),
                            ),
                            children: [
                              TextSpan(
                                text: '\$25',
                                style: SafeGoogleFont(
                                  'Plus Jakarta Sans',
                                  fontSize: 14 * ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.5714285714 * ffem / fem,
                                  letterSpacing: 0.07 * fem,
                                  color: Color(0xff111111),
                                ),
                              ),
                              TextSpan(
                                text: '/Person',
                                style: SafeGoogleFont(
                                  'Plus Jakarta Sans',
                                  fontSize: 12 * ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.6666666667 * ffem / fem,
                                  letterSpacing: 0.06 * fem,
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
      );
    
  }
}
