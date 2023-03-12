import 'package:flutter/material.dart';
import 'package:myevent/features/screens/Home/Widgets/Body/etablissemnt_page.dart';
import 'package:myevent/features/screens/Home/Widgets/Header/header_section.dart';
import '../Header/search_bar.dart';
import 'header_body.dart';
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
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Scaffold(
        // margin: EdgeInsets.fromLTRB(2 * fem, 0 * fem, 0 * fem, 29 * fem),
        // width: 328 * fem,
        // child: Column(
        body: SingleChildScrollView(
            child: Column(children: const [
      HeaderSection(),
      SizedBox(
        width: 300,
        height: 70,
        child: SearchBar(),
      ),
      HeaderBody(),
      SingleEtb(
        place: 'Paris',
      )
    ])));
  }
}
