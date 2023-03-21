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
  List<Etablissement>? etbs;
  final HomeServices homeService = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchEtbsByPlace();
  }

  fetchEtbsByPlace() async {
    etbs = await homeService.fetchEtbsByPlace(
        context: context, place: widget.place, category: "All");

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.height / 2) - 50.0,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        padding: EdgeInsets.only(top: 5.0),
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Container(
              color: Color(0xFF0D0F14),
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
        ],
      ),
    );
  }

  Widget _buildLocationItem(Etablissement etb) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
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
                    Positioned(
                      right: 10.0,
                      top: 10.0,
                      child: Container(
                        height: 25.0,
                        width: 45.0,
                        decoration: BoxDecoration(
                            color: Color(0xFF342520).withOpacity(0.7),
                            borderRadius: BorderRadius.only(
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
                                etb.capaciteMax.toString(),
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
                            Text('\$',
                                style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.bold,
                                    color: ColorPalette().lcoationSelected,
                                    fontSize: 20.0)),
                            Text(etb.prix,
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
                          child: Center(
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
