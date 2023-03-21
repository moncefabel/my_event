import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:myevent/features/screens/Home/Widgets/Body/signle_etablissement.dart';
import 'package:myevent/features/screens/Home/Widgets/Header/search_bar.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../constants/color_palette.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/heroicons_solid.dart';

import 'Widgets/Filters_category/filter_category.dart';
import 'Widgets/FooterBar/navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      backgroundColor: ColorPalette().scaffoldBg,
      bottomNavigationBar: const BottomBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 5.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        //todo
                      },
                      child: Container(
                        padding: const EdgeInsets.all(7.0),
                        height: 42.0,
                        width: 42.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1F242C),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: const Iconify(HeroiconsSolid.view_grid,
                            size: 12.0, color: Color(0xFF4D4F52)),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        //todo
                      },
                      child: Container(
                        padding: const EdgeInsets.all(7.0),
                        height: 42.0,
                        width: 42.0,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage('assets/images/1.jfif'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    )
                  ]),
            ),
            const SizedBox(height: 20.0),
            const SizedBox(width: 400, height: 60, child: SearchBar(),),
            const SizedBox(height: 20.0),
            _currentPosition == null
            ? const Text("Categories loading...")
            : FilterCategory(place: _currentPosition!),
            _currentPosition == null
                ? const CircularProgressIndicator()
                : SingleEtb(place: _currentPosition!)
          ],
        ),
      ),
    );
  }
}
