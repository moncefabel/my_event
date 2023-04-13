import 'package:flutter/material.dart';

class ProfilImage extends StatelessWidget {
  const ProfilImage({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      // yyo (1:400)
      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 15 * fem, 0 * fem),
      width: 50 * fem,
      height: 50 * fem,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100 * fem),
        child: Image.asset(
          'assets/screens/images/.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
