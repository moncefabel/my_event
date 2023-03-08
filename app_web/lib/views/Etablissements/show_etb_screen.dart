import 'package:app_web/Widgets/signle_etb.dart';
import 'package:app_web/features/proprio/services/proprio_service.dart';
import 'package:app_web/views/Etablissements/add_etb_screen.dart';
import 'package:flutter/material.dart';

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

  void deleteEtb(Etablissement etb, int index){
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
            body: GridView.builder(
              itemCount: etablissements!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index){
                final etbsData = etablissements![index];
                return Column(
                  children: [
                    SizedBox(
                      height:140,
                      child: SingleEtb(
                        image:etbsData.images[0]
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Text(
                            etbsData.nameEtb,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                        ),
                        ),
                        IconButton(
                          onPressed: () {
                            deleteEtb(etbsData, index);
                          },
                          icon: const Icon(
                            Icons.delete_outline,
                          ))
                      ],
                    )
                  ],
                );
              },
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
