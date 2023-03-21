import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myevent/features/screens/Home/Widgets/FooterBar/navigation_bar.dart';
import 'package:myevent/features/screens/Home/Widgets/Header/header_section.dart';
import 'package:myevent/features/screens/Home/Widgets/Header/localisation_display.dart';
import 'package:permission_handler/permission_handler.dart';
import '../Filters_category/filter_category.dart';
import '../Header/search_bar.dart';
import 'signle_etablissement.dart';
import 'package:flutter/rendering.dart';

void showLayoutGuidelines() {
  debugPaintSizeEnabled = true;
}

class EtbDisplay extends StatefulWidget {
    static const String routeName = '/home';

  const EtbDisplay({Key? key}) : super(key: key);

  @override
  State<EtbDisplay> createState() => _EtbDisplayState();
}

class _EtbDisplayState extends State<EtbDisplay> {
  Position? _currentPosition;
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      _currentPosition == null
          ? Text("Welcome",
              style: GoogleFonts.lobster(fontSize: 30.0, color: Colors.black))
          : HeaderSection(
              currentPosition: _currentPosition!,
            ),
      const SizedBox(
        width: 300,
        height: 70,
        child: SearchBar(),
      ),
      _currentPosition == null
          ? const CircularProgressIndicator()
          : SingleEtb(place: _currentPosition!)
    ])));
  }
}
