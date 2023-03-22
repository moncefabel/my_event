import 'package:flutter/material.dart';
import 'package:app_web/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../providers/proprio_provider.dart';

class NavigationDrawerHeader extends StatelessWidget {
  const NavigationDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    String firstName =
        Provider.of<ProprioProvider>(context, listen: false).proprio.firstName;
    return SingleChildScrollView(
      child: Container(
        height: 150,
        color: primaryColor,
        alignment: Alignment.center,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(
            firstName,
            style: GoogleFonts.sourceSansPro(color: Colors.black),
          ),
        ]),
      ),
    );
  }
}
