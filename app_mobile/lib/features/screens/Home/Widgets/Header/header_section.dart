import 'package:flutter/material.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:myevent/features/screens/Historic/notifications_bookings.dart';

import 'localisation_display.dart';
import 'profil_image.dart';

class HeaderSection extends StatefulWidget {
  const HeaderSection({super.key, required this.currentPosition});
  final Position currentPosition;
  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      // userCJq (1:383)
      margin: EdgeInsets.fromLTRB(20 * fem, 25 * fem, 3 * fem, 28 * fem),
      width: double.infinity,
      height: 46 * fem,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            // profileUXF (1:399)
            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 134 * fem, 0 * fem),
            height: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const ProfilImage(),
                LocalisationDisplay(currentPosition: widget.currentPosition)
              ],
            ),
          ),
          SizedBox(
            // actionJgd (1:384)
            width: 60 * fem,
            height: 60 * fem,
            child: IconButton(
              iconSize: 40,
              icon: Icon(
                Icons.circle_notifications,
                color: Colors.blue.shade200,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const HistoricBuyPage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
