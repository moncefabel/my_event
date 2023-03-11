import 'package:flutter/material.dart';

import 'package:myevent/features/screens/Home/home_services.dart';
import 'package:myevent/features/screens/establishment-details.dart';

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
    etbs = await homeService.fetchEtbsByPlace(
        context: context, place: widget.place);
    print(etbs![0].nameEtb);

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

            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                SizedBox(
                    // listqMX (1:511)
                    // margin:
                    //     EdgeInsets.fromLTRB(0 * fem, 0 * fem, 3 * fem, 0 * fem),
                    // width: double.infinity,
                    height: 170,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(left: 15),
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      itemCount: etbs!.length,
                      itemBuilder: (context, index) {
                        final etb = etbs![index];
                        return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                Scene.routeName,
                              );
                            },
                            child: Column(children: [
                              SizedBox(
                                // rectangle22469igD (1:512)
                                // width: 86 * fem,
                                height: 130,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Image.network(
                                    etb.images[0],
                                  ),
                                ),
                              ),
                              Text(
                                etb.nameEtb,
                                style: SafeGoogleFont(
                                  'Plus Jakarta Sans',
                                  fontSize: 16 * ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.5 * ffem / fem,
                                  letterSpacing: 0.08 * fem,
                                  color: Color(0xff111111),
                                ),
                              ),
                            ]));
                      },
                    ))
              ]);
  }
}
