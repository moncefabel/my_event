import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:myevent/features/screens/Home/Widgets/Header/header_section.dart';
import '../Header/search_bar.dart';
import 'signle_etablissement.dart';
import 'package:flutter/rendering.dart';

void showLayoutGuidelines() {
  debugPaintSizeEnabled = true;
}

class EtbDisplay extends StatefulWidget {
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
      final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        _currentPosition = position;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      const HeaderSection(),
      const SizedBox(
        width: 300,
        height: 70,
        child: SearchBar(),
      ),
      SingleEtb(
        place:[_currentPosition!.longitude, _currentPosition!.latitude],
      )
    ])));
  }
}
