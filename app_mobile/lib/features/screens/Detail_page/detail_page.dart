import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myevent/features/screens/Detail_page/img_etb.dart';
import 'package:myevent/features/screens/Detail_page/price_etb.dart';
import '../../../constants/color_palette.dart';

import '../../../models/etablissement.dart';
import '../Booking/Booking_page.dart';
import 'custom_app_bar.dart';
import 'etb_detail.dart';

class EtbDetails extends StatefulWidget {
  final Etablissement etb;
  const EtbDetails({super.key, required this.etb});

  @override
  State<EtbDetails> createState() => _EtbDetailsState();
}

class _EtbDetailsState extends State<EtbDetails> {
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
        backgroundColor: Colors.blue.shade200,
        body: SingleChildScrollView(
            child:
                Column(
                  children: [
                    CustomAppBar(
                      Icons.arrow_back_ios_outlined,
                      leftCallback: () => Navigator.of(context).pop(),
                    ),
                    EtbImg(widget.etb),
                    EtbDetail(widget.etb),
                  ]
                )
            ));
  }


  scroll() {
    return DraggableScrollableSheet(
        initialChildSize: 0.6,
        maxChildSize: 1.0,
        minChildSize: 0.6,
        builder: (context, scrollController) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20),
                  topRight: const Radius.circular(20)),
            ),
            child: SingleChildScrollView(
              // controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 5,
                          width: 35,
                          color: Colors.black12,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    widget.etb.nameEtb,
                    style: GoogleFonts.oswald(
                        textStyle: TextStyle(
                      fontSize: 30,
                    )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.etb.lieu,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      const Text("Horaires:", style: TextStyle(fontSize: 15)),
                      const Spacer(),
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.blue.shade400,
                        child: Icon(
                          Icons.access_time,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                          "${widget.etb.heureOuverture} - ${widget.etb.heureFermeture}",
                          style: const TextStyle(fontSize: 13)),
                    ],
                  ),
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      const Text("Capacité:", style: TextStyle(fontSize: 15)),
                      const Spacer(),
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.blue.shade400,
                        child: Icon(
                          Icons.man,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                          "${widget.etb.capaciteMin} - ${widget.etb.capaciteMax}",
                          style: const TextStyle(fontSize: 13)),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),
                  Text(
                    "Description",
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.etb.description,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.black),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),
                  Container(
                    // color: Colors.yellow,
                    width: 400,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50.0,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "${widget.etb.prix.toString()} €",
                                    style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue.shade400,
                                        fontSize: 30.0),
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
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BookingPage(etb: widget.etb)),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 200,
                            decoration: BoxDecoration(
                                color: const Color(0xff4c9fc1),
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Center(
                              child: Text('Book Now',
                                  style: GoogleFonts.sourceSansPro(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 17.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
