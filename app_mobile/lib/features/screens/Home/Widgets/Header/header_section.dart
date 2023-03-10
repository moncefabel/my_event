import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'localisation_display.dart';
import 'profil_image.dart';
class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
              // userCJq (1:383)
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 3 * fem, 28 * fem),
              width: double.infinity,
              height: 46 * fem,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // profileUXF (1:399)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 134 * fem, 0 * fem),
                    height: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const ProfilImage(),
                        LocalisationDisplay()
                      ],
                    ),
                  ),
                  // ******* Widget notification ***********
                  // Container(
                  //   // actionJgd (1:384)
                  //   width: 46 * fem,
                  //   height: 46 * fem,
                  //   child: IconButton(
                  //     icon: const Icon(
                  //       Icons.notification_add
                  //     ),
                  //     onPressed: () {
                  //       // Handle button press
                  //     },
                  //   ),
                  // ),
                  SizedBox(
                    // actionJgd (1:384)
                    width: 43*fem,
                    height: 45*fem,
                    child: IconButton(
                          icon: Image.asset(
                            'assets/screens/images/action.png',
                            width: 200,
                            height: 200,
                          ),
                          onPressed: () {
                            // show the notifications 
                          },
                        ),
                  ),
                ],
              ),
            );
  }
}