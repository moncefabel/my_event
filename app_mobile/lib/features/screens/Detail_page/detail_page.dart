import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/color_palette.dart';

import '../../../constants/color_palette.dart';
import '../../../models/etablissement.dart';
import '../Booking/Booking_page.dart';

class EtbDetails extends StatefulWidget {
  final Etablissement etb;
  const EtbDetails({super.key, required this.etb});

  @override
  State<EtbDetails> createState() => _EtbDetailsState();
}

class _EtbDetailsState extends State<EtbDetails> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: screenHeight,
            width: screenWidth,
            color: Colors.black,
          ),
          Hero(
              tag: widget.etb.images.toString(),
              child: Container(
                height: (screenHeight / 2) + 70.0,
                width: screenWidth,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.etb.images.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Image.network(
                      widget.etb.images[index],
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),

          Positioned(
            top: 35.0,
            left: 10.0,
            child: Container(
              color: Colors.transparent,
              height: 50.0,
              width: screenWidth - 20.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 45.0,
                      width: 45.0,
                      decoration: BoxDecoration(
                          color: Color(0xFF14181D),
                          border:
                              Border.all(color: Color(0xFF322B2E), width: 1.0),
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Color(0xFF525154),
                        size: 17.0,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      //todo
                    },
                    child: Container(
                      height: 45.0,
                      width: 45.0,
                      decoration: BoxDecoration(
                          color: Color(0xFF14181D),
                          border:
                              Border.all(color: Color(0xFF322B2E), width: 1.0),
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Icon(
                        Icons.favorite_rounded,
                        color: Color(0xFF525154),
                        size: 17.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: (screenHeight / 2) - 30.0,
            child: GlassContainer(
              height: 150.0,
              width: screenWidth,
              blur: 4,
              border: Border.fromBorderSide(BorderSide.none),
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.black.withOpacity(0.6),
              child: Container(
                height: 140.0,
                width: screenWidth - 20.0,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 25.0),
                      height: 140.0,
                      width: (screenWidth - 20.0) / 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.etb.nameEtb,
                            style: GoogleFonts.sourceSansPro(
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.etb.lieu,
                            style: GoogleFonts.sourceSansPro(
                              color: Color(0xFFADADAD),
                              fontSize: 17.0,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: ColorPalette().lcoationSelected,
                                size: 22.0,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              // Text(
                              //   widget.etb.rating.toString(),
                              //   style: GoogleFonts.sourceSansPro(
                              //       color: Colors.white,
                              //       fontSize: 17.0,
                              //       fontWeight: FontWeight.bold),
                              // ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20, left: 25.0),
                      height: 140.0,
                      width: (screenWidth - 20.0) / 2,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Horaires:',
                                style: GoogleFonts.sourceSansPro(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: screenHeight / 2 + 140.0,
            child: Container(
              height: screenHeight / 2 - 140,
              width: screenWidth,
              child: ListView(
                padding: EdgeInsets.only(left: 15.0),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: GoogleFonts.sourceSansPro(
                            color: Color(0xFF999A9B), fontSize: 17.0),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        height: 50.0,
                        width: screenWidth - 30.0,
                        child: Text(widget.etb.description,
                            style: GoogleFonts.sourceSansPro(
                                color: Colors.white, fontSize: 17.0)),
                      ),
                      SizedBox(height: 120.0),
                      Container(
                        width: screenWidth - 30.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 50.0,
                              child: Column(
                                children: [
                                  Text(
                                    'Price',
                                    style: GoogleFonts.sourceSansPro(
                                        color: Color(0xFF999A9B),
                                        fontSize: 17.0),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        widget.etb.prix.toString(),
                                        style: GoogleFonts.sourceSansPro(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 20.0),
                                      ),
                                      Text(
                                        ' €',
                                        style: GoogleFonts.sourceSansPro(
                                            fontWeight: FontWeight.bold,
                                            color:
                                                ColorPalette().lcoationSelected,
                                            fontSize: 20.0),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                               Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => BookingPage(etb: widget.etb)),
                                );
                              },
                              child: Container(
                                height: 50.0,
                                width: (screenWidth / 2) + 50.0,
                                decoration: BoxDecoration(
                                    color: const  Color(0xff4c9fc1),
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Center(
                                  child: Text('Book Now',
                                      style: GoogleFonts.sourceSansPro(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 17.0)),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}