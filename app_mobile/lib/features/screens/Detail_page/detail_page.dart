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
}
