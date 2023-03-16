import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../../constants/utils.dart';
import 'package:geocoding/geocoding.dart';
import 'package:permission_handler/permission_handler.dart';

class LocalisationDisplay extends StatefulWidget {
  @override
  _LocalisationDisplayState createState() => _LocalisationDisplayState();
}

class _LocalisationDisplayState extends State<LocalisationDisplay> {
  Position? _currentPosition;
  String _currentAddress = '';

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  _getCurrentLocation() async {
    var permissionStatus = await Permission.locationWhenInUse.request();
     if (permissionStatus == PermissionStatus.granted) {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentPosition = position;
    });
    await _getAddress();
  }
  }
  _getAddress() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition!.latitude, _currentPosition!.longitude);
      if (placemarks!=null && placemarks.isNotEmpty) {
        Placemark placemark = placemarks[0];
        setState(() {
          _currentAddress =
              ' ${placemark.administrativeArea}, ${placemark.country}';
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
  double baseWidth = 414;
  double fem = MediaQuery.of(context).size.width / baseWidth;
  double ffem = fem * 0.95;
  
  return Container(
    // group1000003474FRX (1:401)
    width: 92 * fem,
    height: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
           Flexible(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.only(top: 0 * fem), // add top padding
            child: Text(
              // hiandykt5 (1:402)
              'Hi, Moncef',
              style: SafeGoogleFont(
                'Plus Jakarta Sans',
                fontSize: 16 * ffem,
                fontWeight: FontWeight.w700,
                height: 1.4444444444 * ffem / fem,
                letterSpacing: 0.09 * fem,
                color: Color(0xff111111),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            _getCurrentLocation();
          },
          child: Flexible(
            flex: 1,
            child: Container(
              // group1000003473SW1 (1:403)
              padding: EdgeInsets.fromLTRB(
                  2.67 * fem, 0 * fem, 0 * fem, 0 * fem),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
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
                  ),
                  Expanded(
                    flex: 5, // increase the flex value to make the text widget bigger
                    child: Text(
                      _currentPosition != null
                          ? (_currentAddress.isNotEmpty
                              ? _currentAddress
                              : 'paris')
                          : 'Loading...',
                      style: SafeGoogleFont(
                        'Plus Jakarta Sans',
                        fontSize: 11 * ffem,
                        fontWeight: FontWeight.w500,
                        height: 1.6666666667 * ffem / fem,
                        letterSpacing: 0.06 * fem,
                        color: Color.fromARGB(255, 99, 105, 110),
                      ),
                      overflow: TextOverflow.visible, // add this line
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}



}
