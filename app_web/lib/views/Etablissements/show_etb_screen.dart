import 'package:app_web/Widgets/signle_etb.dart';
import 'package:app_web/features/proprio/services/proprio_service.dart';
import 'package:app_web/views/Etablissements/add_etb_screen.dart';
import 'package:app_web/views/Etablissements/modify_etb_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Widgets/loader.dart';
import '../../models/etb.dart';

class EtbsScreen extends StatefulWidget {
  const EtbsScreen({Key? key}) : super(key: key);

  @override
  State<EtbsScreen> createState() => _EtbsScreenState();
}

class _EtbsScreenState extends State<EtbsScreen> {
  List<Etablissement>? etablissements;
  final ProprioService proprioService = ProprioService();

  @override
  void initState() {
    super.initState();
    fetchAllEtbs();
  }

  fetchAllEtbs() async {
    etablissements = await proprioService.fetchAllEtb(context);
    setState(() {});
  }

  void deleteEtb(Etablissement etb, int index) {
    proprioService.deleteEtb(
        context: context,
        etb: etb,
        onSuccess: () {
          etablissements!.removeAt(index);
          setState(() {});
        });
  }

  void navigateToAddEtb() {
    Navigator.pushNamed(context, AddEtbScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return etablissements == null
        ? const Loader()
        : Scaffold(
            body: Column(
              children: [
                etablissements!.isEmpty
                    ? Title(
                        color: Colors.black,
                        child: Text(
                          'Veuillez Ajoutez Un Etablissement',
                          style: GoogleFonts.sourceSansPro(
                              fontWeight: FontWeight.bold, fontSize: 30.0),
                        ))
                    : Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Expanded(
                          child: ListView.builder(
                            itemCount: etablissements!.length,
                            itemBuilder: (context, index) {
                              final etbsData = etablissements![index];
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                        height: 200,
                                        width: 300,
                                        child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ModifyEtbScreen(
                                                            etb: etbsData)),
                                              );
                                            },
                                            child: SingleEtb(
                                                image: etbsData.images[0])),
                                      ),
                                      Text(
                                        etbsData.nameEtb,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            deleteEtb(etbsData, index);
                                          },
                                          icon: const Icon(
                                            Icons.delete_outline,
                                          )),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                      ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: navigateToAddEtb,
              tooltip: 'Add a Product',
              child: const Icon(Icons.add),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
