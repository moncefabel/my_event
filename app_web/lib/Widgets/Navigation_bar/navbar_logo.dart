import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Services/navigation_service.dart';
import '../../locator.dart';

class NavBarLogo extends StatelessWidget {
  final String title;
  final String navigationPath;
  const NavBarLogo(this.title, this.navigationPath, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //should not use service directily in ui to change state
        //better use from a view model
        locator<NavigationService>().navigateTo(navigationPath);
      },
      child: SizedBox(
        
        child: Text(
          "MyEventPro",
          style: GoogleFonts.lobster(
            fontSize: 30.0,
            color: Colors.white
          )),
      ),
    );
  }
}
