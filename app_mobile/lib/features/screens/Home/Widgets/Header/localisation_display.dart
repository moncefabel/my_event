import 'package:flutter/material.dart';

import '../../../../../constants/utils.dart';

class LocalisationDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      // group1000003474FRX (1:401)
      width: 92 * fem,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            // hiandykt5 (1:402)
            'Hi,Moncef',
            style: SafeGoogleFont(
              'Plus Jakarta Sans',
              fontSize: 18 * ffem,
              fontWeight: FontWeight.w700,
              height: 1.4444444444 * ffem / fem,
              letterSpacing: 0.09 * fem,
              color: Color(0xff111111),
            ),
          ),
          Container(
            // group1000003473SW1 (1:403)
            padding: EdgeInsets.fromLTRB(2.67 * fem, 0 * fem, 0 * fem, 0 * fem),
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // bxsmap11LrH (1:405)
                  margin: EdgeInsets.fromLTRB(
                      0 * fem, 0 * fem, 6.67 * fem, 0 * fem),
                  width: 10.67 * fem,
                  height: 13.33 * fem,
                  child: Image.asset(
                    'assets/screens/images/bxs-map-1-1-ftZ.png',
                    width: 10.67 * fem,
                    height: 13.33 * fem,
                  ),
                ),
                Text(
                  // netherlands1Bj (1:404)
                  'Paris',
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
        ],
      ),
    );
  }
}
