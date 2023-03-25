import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myevent/features/screens/Detail_page/detail_page.dart';

import 'package:myevent/features/screens/Home/home_services.dart';

import '../../../../../constants/color_palette.dart';
import '../../../../../models/etablissement.dart';

class SingleEtb extends StatefulWidget {
  final Position place;
  const SingleEtb({
    Key? key,
    required this.place,
  }) : super(key: key);
  @override
  State<SingleEtb> createState() => _SingleEtbState();
}

class _SingleEtbState extends State<SingleEtb> {
  String selectedItem = 'All';
  int counter = -1;
  List<Etablissement>? etbs;
  final HomeServices homeService = HomeServices();

  final List<String> locationTypes = [
    'All',
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
  void initState() {
    super.initState();
    fetchEtbs();
  }

  fetchEtbs() async {
    etbs = await homeService.fetchEtbs(
        context: context, place: widget.place, category: selectedItem);
    print(etbs!.length);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.height),
      width: MediaQuery.of(context).size.width,
      child: ListView(
        padding: EdgeInsets.only(top: 5.0),
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
            child: ShaderMask(
              shaderCallback: ((Rect bounds) {
                return const LinearGradient(
                        begin: Alignment(0.7, -1.0),
                        end: Alignment(1.0, -1.0),
                        colors: <Color>[Colors.white, Colors.transparent])
                    .createShader(bounds);
              }),
              blendMode: BlendMode.dstATop,
              child: Container(
                color: Colors.white,
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
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width - 10.0,
              height: 300.0,
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
        ],
      ),
    );
  }

  Widget _buildLocationItem(Etablissement etb) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EtbDetails(etb: etb)));
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    ColorPalette().gradientTopLeft,
                    Color(0xff4c9fc1)
                  ])),
          height: 200.0,
          width: 150.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 140.0,
                width: 150.0,
                child: Stack(
                  children: [
                    Positioned(
                      top: 10.0,
                      left: 10.0,
                      child: Hero(
                        tag: etb.images[0].toString(),
                        child: Container(
                          height: 120.0,
                          width: 130.0,
                          child: Image.network(
                            etb.images[0],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  etb.nameEtb,
                  style: GoogleFonts.sourceSansPro(
                      color: Colors.white, fontSize: 16.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, bottom: 5.0),
                child: Text(
                  etb.lieu,
                  style: GoogleFonts.sourceSansPro(
                      fontWeight: FontWeight.w200,
                      color: Colors.white,
                      fontSize: 13.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40.0,
                        width: 60.0,
                        child: Row(
                          children: [
                            Text(etb.prix,
                                style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20.0)),
                            Text(' €',
                                style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20.0)),
                          ],
                        ),
                      ),
                    ]),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 20.0,
                        width: 90.0,
                        child: Row(
                          children: [
                            Text('Cap Minimale: ',
                                style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 11.0)),
                            Text(etb.capaciteMin,
                                style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 11.0)),
                            
                          ],
                        ),
                      ),
                    ]),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 20.0,
                        width: 90.0,
                        child: Row(
                          children: [
                            Text('Cap Maximale: ',
                                style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 11.0)),
                            Text(etb.capaciteMax,
                                style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 11.0)),
                            
                          ],
                        ),
                      ),
                    ]),
              ),
              
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTypes(location, counter) {
    return Padding(
      padding: counter != 0
          ? EdgeInsets.only(left: 25.0)
          : EdgeInsets.only(left: 7.0),
      child: Container(
        height: 50.0,
        color: Colors.white,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedItem = location;
                });
                fetchEtbs();
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
            SizedBox(height: 4.0),
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
