import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constants/color_palette.dart';
// import '../../../../../models/etablissement.dart';
// import '../../home_services.dart';

class FilterCategory extends StatefulWidget {
  final Position place;
  const FilterCategory({
    Key? key,
    required this.place,
  }) : super(key: key);

  @override
  State<FilterCategory> createState() => _FilterCategoryState();
}

class _FilterCategoryState extends State<FilterCategory> {
  String selectedItem = 'Appartment';
  int counter = -1;
  final List<String> locationTypes = [
    'Appartment',
    'Bar',
    'Restaurant',
    'Air BNB',
    'Pool',
    'Rooftop',
    'Underground',
    'Mansion',
    'Complex'
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
      child: ShaderMask(
        shaderCallback: ((Rect bounds) {
          return const LinearGradient(
                  begin: Alignment(0.7, -1.0),
                  end: Alignment(1.0, -1.0),
                  colors: <Color>[Colors.black, Colors.transparent])
              .createShader(bounds);
        }),
        blendMode: BlendMode.dstATop,
        child: Container(
          color: const Color(0xFF0D0F14),
          width: MediaQuery.of(context).size.width - 20.0,
          height: 40.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ...locationTypes.map((e) {
                counter++;
                if (counter <= 8)
                  return _buildTypes(e, counter);
                else {
                  counter = 0;
                  return _buildTypes(e, counter);
                }
              }).toList()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTypes(location, counter) {
    return Padding(
      padding: counter != 0
          ? const EdgeInsets.only(left: 25.0)
          : const EdgeInsets.only(left: 7.0),
      child: Container(
        height: 50.0,
        color: const Color(0xFF0D0F14),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedItem = location;
                });
              },
              child: Text(
                location,
                style: GoogleFonts.sourceSansPro(
                    fontWeight: FontWeight.bold,
                    color: location == selectedItem
                        ? ColorPalette().lcoationSelected
                        : ColorPalette().locationUnselected,
                    fontSize: 17.0),
              ),
            ),
            const SizedBox(height: 4.0),
            Container(
              height: 8.0,
              width: 8.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: location == selectedItem
                      ? ColorPalette().lcoationSelected
                      : Colors.transparent),
            )
          ],
        ),
      ),
    );
  }
}
