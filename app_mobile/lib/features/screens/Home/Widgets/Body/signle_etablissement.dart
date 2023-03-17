import 'package:flutter/material.dart';
import 'package:myevent/features/screens/Detail_page/detail_page.dart';

import 'package:myevent/features/screens/Home/home_services.dart';

import '../../../../../models/etablissement.dart';

class SingleEtb extends StatefulWidget {
  final List<double>? place;
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
        context: context, place: widget.place!);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return etbs == null
        ? const Text("No establishments near to your lcoation")
        : Column(children: [
            SizedBox(
                height: 800,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: etbs!.length,
                  itemBuilder: (context, index) {
                    final etb = etbs![index];
                    return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            DetailPage.routeName,
                            arguments: etb,
                          );
                        },
                        child: Container(
                            margin: const EdgeInsets.only(top: 10.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Row(children: [
                              Flexible(
                                flex: 1,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      bottomLeft: Radius.circular(20.0)),
                                  child: Image.network(
                                    etb.images[0],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        etb.nameEtb,
                                        textAlign: TextAlign.left,
                                        maxLines: 2,
                                        style: const TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          const Icon(Icons.location_on),
                                          const SizedBox(height: 5),
                                          Text(
                                            etb.lieu,
                                            style:
                                                const TextStyle(fontSize: 10),
                                            maxLines: 3,
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Text("${etb.prix}€",
                                          style: const TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                ),
                              )
                            ])));
                  },
                ))
          ]);
  }
}
