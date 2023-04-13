import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:myevent/features/auth/services/auth_service.dart';
import 'package:provider/provider.dart';

import '../../../../../constants/utils.dart';
import 'package:geocoding/geocoding.dart';

import '../../../../../provider/customer_provider.dart';

class LocalisationDisplay extends StatefulWidget {
  const LocalisationDisplay({super.key, required this.currentPosition});
  final Position? currentPosition;
  @override
  LocalisationDisplayState createState() => LocalisationDisplayState();
}

class LocalisationDisplayState extends State<LocalisationDisplay> {
  String _currentAddress = '';
  AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    _getAddress();
    authService.getCustomerData(context);
  }

  _getAddress() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          widget.currentPosition!.latitude, widget.currentPosition!.longitude);
      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks[0];
        setState(() {
          _currentAddress = ' ${placemark.locality}, ${placemark.country}';
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

    return SizedBox(
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
                Provider.of<CustomerProvider>(context).customer.token.isNotEmpty
                    ? 'Hi, ${Provider.of<CustomerProvider>(context).customer.firstName}'
                    : 'Hi',
                style: SafeGoogleFont(
                  'Plus Jakarta Sans',
                  fontSize: 16 * ffem,
                  fontWeight: FontWeight.w700,
                  height: 1.4444444444 * ffem / fem,
                  letterSpacing: 0.09 * fem,
                  color: const Color(0xff111111),
                ),
              ),
            ),
          ),
          InkWell(
            child: Flexible(
              flex: 1,
              child: Container(
                // group1000003473SW1 (1:403)
                padding:
                    EdgeInsets.fromLTRB(2.67 * fem, 0 * fem, 0 * fem, 0 * fem),
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 6.67 * fem, 0 * fem),
                        width: 15.67 * fem,
                        height: 13.33 * fem,
                        child: Image.asset(
                          'assets/screens/images/bxs-map-1-1-ftZ.png',
                          width: 10.67 * fem,
                          height: 13.33 * fem,
                        ),
                      ),
                    ),
                    Expanded(
                      flex:
                          5, // increase the flex value to make the text widget bigger
                      child: Text(
                        _currentAddress.isNotEmpty
                            ? _currentAddress
                            : 'Loading...',
                        style: SafeGoogleFont(
                          'Plus Jakarta Sans',
                          fontSize: 11 * ffem,
                          fontWeight: FontWeight.w500,
                          height: 1.6666666667 * ffem / fem,
                          letterSpacing: 0.06 * fem,
                          color: const Color.fromARGB(255, 99, 105, 110),
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
