import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../constants/color_palette.dart';
import '../../../models/etablissement.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/heroicons_solid.dart';
import 'package:iconify_flutter/icons/ri.dart';

import 'home_services.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
  List<Etablissement>? etbs;
  final HomeServices homeService = HomeServices();
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
      fetchEtbsByPlace();
    }
  }

  fetchEtbsByPlace() async {
    if (_currentPosition != null) {
      etbs = await homeService.fetchEtbsByPlace(
          context: context, place: _currentPosition!);
    }

    setState(() {});
  }

  String selectedItem = 'Appartment';
  int counter = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette().scaffoldBg,
      bottomNavigationBar: _buildBottomBar(),
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
            Container(
              padding: const EdgeInsets.only(left: 15.0, top: 15.0),
              width: (MediaQuery.of(context).size.width / 3) * 2 + 25.0,
              child: Text(
                'Find the perfect spot for you',
                style: GoogleFonts.sourceSansPro(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 40.0),
              ),
            ),
            const SizedBox(height: 20.0),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
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
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height / 2) - 50.0,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                padding: const EdgeInsets.only(top: 5.0),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Container(
                      color: const Color(0xFF0D0F14),
                      width: MediaQuery.of(context).size.width - 10.0,
                      height: 255.0,
                      child: etbs == null
                          ? const CircularProgressIndicator()
                          : ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                ...etbs!.map((e) {
                                  return _buildLocationItem(e);
                                }).toList()
                              ],
                            ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 10.0),
                    child: Text(
                      'Locations you must try',
                      style: GoogleFonts.sourceSansPro(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 10.0),
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      height: 125.0,
                      width: MediaQuery.of(context).size.width - 20.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: <Color>[
                                ColorPalette().gradientTopLeft,
                                Colors.black
                              ])),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 115.0,
                            width: 125.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: const DecorationImage(
                                    image: AssetImage('assets/images/4.jfif'),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            height: 115.0,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 100.0,
                                  width:
                                      MediaQuery.of(context).size.width - 185.0,
                                  child: Text('Our location of the day',
                                      style: GoogleFonts.sourceSansPro(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 16.0)),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
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

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      height: 50.0,
      decoration: const BoxDecoration(color: Color(0xFF1A1819)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: const Iconify(
              Ri.home_fill,
              color: Color(0xFFD17742),
            ),
          ),
          Container(
              child: const Iconify(
            Ri.handbag_fill,
            color: Color(0xFF4E4F53),
          )),
          Container(
            child: const Iconify(
              Ri.heart_2_fill,
              color: Color(0xFF4E4F53),
            ),
          ),
          Container(
            child: Stack(
              children: [
                const Iconify(
                  HeroiconsSolid.bell,
                  color: Color(0xFF4E4F53),
                ),
                Positioned(
                    top: 2.0,
                    left: 15.0,
                    child: Container(
                      height: 7.0,
                      width: 7.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.5),
                          color: Colors.red),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLocationItem(Etablissement lItem) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: GestureDetector(
        onTap: () {
          // Navigator.of(context).push(MaterialPageRoute(
          //     builder: (context) => ItemDetails(lItem: lItem)));
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    ColorPalette().gradientTopLeft,
                    Colors.black
                  ])),
          height: 200.0,
          width: 150.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 140.0,
                width: 150.0,
                child: Stack(
                  children: [
                    Positioned(
                      top: 10.0,
                      left: 10.0,
                      child: Hero(
                        tag: lItem.images[0].toString(),
                        child: SizedBox(
                          height: 120.0,
                          width: 130.0,
                          child: Image.network(
                            lItem.images[0],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 10.0,
                      top: 10.0,
                      child: Container(
                        height: 25.0,
                        width: 45.0,
                        decoration: BoxDecoration(
                            color: const Color(0xFF342520).withOpacity(0.7),
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(15.0),
                              bottomLeft: Radius.circular(15.0),
                            )),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.star,
                                  color: ColorPalette().lcoationSelected,
                                  size: 15.0),
                              Text(
                                lItem.capaciteMax.toString(),
                                style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 13.0),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  lItem.nameEtb,
                  style: GoogleFonts.sourceSansPro(
                      color: Colors.white, fontSize: 16.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, bottom: 5.0),
                child: Text(
                  lItem.lieu,
                  style: GoogleFonts.sourceSansPro(
                      fontWeight: FontWeight.w200,
                      color: Colors.white,
                      fontSize: 13.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 40.0,
                        width: 60.0,
                        child: Row(
                          children: [
                            Text('\$',
                                style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.bold,
                                    color: ColorPalette().lcoationSelected,
                                    fontSize: 20.0)),
                            Text(lItem.prix,
                                style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20.0))
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          //toDo
                        },
                        child: Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: BoxDecoration(
                              color: ColorPalette().lcoationSelected,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: const Center(
                            child: Icon(
                              Icons.add,
                              size: 11.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
