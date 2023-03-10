import 'package:flutter/material.dart';
import 'package:myevent/features/screens/Home/Widgets/Body/header_body.dart';
import 'package:myevent/features/screens/Home/Widgets/Header/header_section.dart';
import '../Header/search_bar.dart';
import 'signle_etablissement.dart';

class EtbDisplay extends StatefulWidget {
  const EtbDisplay({Key? key}) : super(key: key);

  @override
  State<EtbDisplay> createState() => _EtbDisplayState();
}

class _EtbDisplayState extends State<EtbDisplay>{
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Column(
        // margin: EdgeInsets.fromLTRB(2 * fem, 0 * fem, 0 * fem, 29 * fem),
        // width: 328 * fem,
        // child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  const [
              HeaderSection(),
              SizedBox(
                width: 300,
                height: 70,
                child: SearchBar(),
              ),
              HeaderBody(),
              SingleEtb(place: 'Paris',)
            ]);
  }
}
