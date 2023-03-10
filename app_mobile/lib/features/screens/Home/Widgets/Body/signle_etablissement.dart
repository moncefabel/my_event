import 'package:flutter/material.dart';

import 'package:myevent/features/screens/Home/home_services.dart';

import '../../../../../constants/utils.dart';
import '../../../../../models/etablissement.dart';

class SingleEtb extends StatefulWidget {
  final String place;
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
    print("hello");
    etbs = await homeService.fetchEtbsByPlace(
        context: context, place: widget.place);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return etbs == null
        ? const Text("hello")
        : Column(
            // autogroupjfd7V1X (9zPr3Dncresfe4mcsNJfD7)

            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // listqMX (1:511)
                margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 3 * fem, 0 * fem),
                width: double.infinity,
                height: 94.6 * fem,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // rectangle22469igD (1:512)
                      width: 86 * fem,
                      height: 94.6 * fem,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.network(
                          etbs![0].images[0],
                        ),
                      ),
                      
                    ),
                    Container(
                      // autogrouptzrdnRB (9zPrqXnndnwDXcM29ttZrD)
                      padding: EdgeInsets.fromLTRB(
                          12 * fem, 5.5 * fem, 0 * fem, 6.6 * fem),
                      height: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // group1000003484UJ1 (1:513)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 28 * fem, 0 * fem),
                            width: 127 * fem,
                            height: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  // group1000003483MMo (1:518)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 15.2 * fem),
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        // endigadabeachSPF (1:519)
                                        margin: EdgeInsets.fromLTRB(0 * fem,
                                            0 * fem, 0 * fem, 2.4 * fem),
                                        child: Text(
                                          etbs![0].nameEtb,
                                          style: SafeGoogleFont(
                                            'Plus Jakarta Sans',
                                            fontSize: 16 * ffem,
                                            fontWeight: FontWeight.w700,
                                            height: 1.5 * ffem / fem,
                                            letterSpacing: 0.08 * fem,
                                            color: Color(0xff111111),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        // days4nights5h7 (1:520)
                                        etbs![0].heureOuverture+' to '+etbs![0].heureFermeture,
                                        style: SafeGoogleFont(
                                          'Plus Jakarta Sans',
                                          fontSize: 12 * ffem,
                                          fontWeight: FontWeight.w500,
                                          height: 1.6666666667 * ffem / fem,
                                          letterSpacing: 0.06 * fem,
                                          color: Color(0xff78828a),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  // group1000003465mpq (1:514)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 54 * fem, 0 * fem),
                                  padding: EdgeInsets.fromLTRB(
                                      3 * fem, 0 * fem, 0 * fem, 0 * fem),
                                  width: double.infinity,
                                  height: 20.9 * fem,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // bxsmap11SRB (1:516)
                                        margin: EdgeInsets.fromLTRB(
                                            0 * fem, 1.1 * fem, 7 * fem, 0 * fem),
                                        width: 12 * fem,
                                        height: 16.5 * fem,
                                        child: Image.asset(
                                          'assets/screens/images/bxs-map-1-1-FZo.png',
                                          width: 12 * fem,
                                          height: 16.5 * fem,
                                        ),
                                      ),
                                      Container(
                                        // australiau3s (1:515)
                                        margin: EdgeInsets.fromLTRB(
                                            0 * fem, 0 * fem, 0 * fem, 0.9 * fem),
                                        child: Text(
                                          etbs![0].lieu,
                                          style: SafeGoogleFont(
                                            'Plus Jakarta Sans',
                                            fontSize: 12 * ffem,
                                            fontWeight: FontWeight.w500,
                                            height: 1.6666666667 * ffem / fem,
                                            letterSpacing: 0.06 * fem,
                                            color: Color(0xff78828a),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                                Container(
                                  // personkqB (1:521)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 1.1 * fem),
                                  child: RichText(
                                    text: TextSpan(
                                      style: SafeGoogleFont(
                                        'Plus Jakarta Sans',
                                        fontSize: 12 * ffem,
                                        fontWeight: FontWeight.w500,
                                        height: 1.6666666667 * ffem / fem,
                                        letterSpacing: 0.06 * fem,
                                        color: Color(0xff000000),
                                      ),
                                      children: [
                                        TextSpan(
                                          text: etbs![0].prix+"\€"
                                          ,
                                          style: SafeGoogleFont(
                                            'Plus Jakarta Sans',
                                            fontSize: 14 * ffem,
                                            fontWeight: FontWeight.w700,
                                            height: 1.5714285714 * ffem / fem,
                                            letterSpacing: 0.07 * fem,
                                            color: Color(0xff111111),
                                          ),
                                        ),
                                        TextSpan(
                                          text: '/Person',
                                          style: SafeGoogleFont(
                                            'Plus Jakarta Sans',
                                            fontSize: 12 * ffem,
                                            fontWeight: FontWeight.w500,
                                            height: 1.6666666667 * ffem / fem,
                                            letterSpacing: 0.06 * fem,
                                            color: Color(0xff78828a),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}
