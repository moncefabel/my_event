import 'package:flutter/material.dart';
import 'package:myevent/features/screens/Home/Widgets/Body/etablissemnt_page.dart';
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

class _EtbDisplayState extends State<EtbDisplay>{
  @override
  Widget build(BuildContext context) {
    double baseWidth = 350;
    return Column(
        // margin: EdgeInsets.fromLTRB(2 * fem, 0 * fem, 0 * fem, 29 * fem),
        // width: 328 * fem,
        // child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  const [
              HeaderSection(),
              SizedBox(
                width: 350,
                height: 70,
                child: SearchBar(),
              ),
              SingleEtb(place: 'paris'),
              //SingleEtb(place: 'Paris',)
            ]);
  }
}
