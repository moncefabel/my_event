import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../../../constants/utils.dart';

class HeaderBody extends StatelessWidget {
  const HeaderBody({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
        // onbudgettouroMf (1:496)
        margin: EdgeInsets.fromLTRB(2 * fem, 0 * fem, 0 * fem, 29 * fem),
        width: 328 * fem,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            // titleFDf (1:497)
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // announcementmC1 (1:499)
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 145 * fem, 0 * fem),
                  child: Text(
                    'Announcement\n',
                    style: SafeGoogleFont(
                      'Plus Jakarta Sans',
                      fontSize: 18 * ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.4444444444 * ffem / fem,
                      letterSpacing: 0.09 * fem,
                      color: Color(0xff111111),
                    ),
                  ),
                ),
                Container(
                  // seeall27w (1:498)
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0.4 * fem, 0 * fem, 0 * fem),
                  child: Icon(
                    Icons.format_list_bulleted_rounded
                    // style: SafeGoogleFont(
                    //   'Plus Jakarta Sans',
                    //   fontSize: 14 * ffem,
                    //   fontWeight: FontWeight.w500,
                    //   height: 1.5714285714 * ffem / fem,
                    //   letterSpacing: 0.07 * fem,
                    //   color: Color(0xff009b8d),
                    // ),
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}
