import 'package:app_web/providers/proprio_provider.dart';
import 'package:app_web/views/Connection/SignIn/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../features/proprio/request_service.dart';
import '../../features/proprio/services/proprio_service.dart';
import '../../models/booking.dart';
import '../../models/etb.dart';

class LocationRentRequest extends StatefulWidget {
  const LocationRentRequest({super.key});

  @override
  State<LocationRentRequest> createState() => _LocationRentRequestState();
}

class _LocationRentRequestState extends State<LocationRentRequest> {
  RequestServices requestService = RequestServices();
  List<Etablissement>? etablissements;
  final ProprioService proprioService = ProprioService();
  List<Booking>? requests;

  @override
  void initState() {
    super.initState();
    getAllRequests();
  }

  getAllRequests() async {
    requests = await requestService.fetchAllRequests(context);
    etablissements = await proprioService.fetchAllEtb(context);
    setState(() {});
  }

  Etablissement? findEtbInTheList(String id) {
    if (etablissements != null) {
      final etb = etablissements!.firstWhere(
        (element) => element.id == id,
      );
      return etb;
    }
    return null;
  }

  void confirmRequest(String requestId) {
    requestService.confirmRequest(context: context, requestId: requestId);
  }

  void sendConfirmationPushNotifications(Etablissement etb, Booking req) {
    requestService.sendPushNotificationsConfirmation(
        context: context, etb: etb, req: req);
  }

  void sendDenyPushNotifications(Etablissement etb, Booking req) {
    requestService.sendPushNotificationsDeny(
        context: context, etb: etb, req: req);
  }

  void denyRequest(String requestId) {
    requestService.denyRequest(context: context, requestId: requestId);
  }

  @override
  Widget build(BuildContext context) {
    return Provider.of<ProprioProvider>(context).proprio.token.isEmpty
        ? const SignInScreen()
        : Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
                child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: const Text(
                    'Rent Request',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans'),
                  ),
                ),
                totalNotificationContainer(),
                viewNotificationRequest(),
                gridView()
              ],
            )),
          );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      title: const FlutterLogo(
        size: 25.0,
      ),
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
        ),
        onPressed: () {},
        color: Colors.grey,
      ),
    );
  }

  Widget totalNotificationContainer() {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 20, 15, 0),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.grey.shade300,
            )
          ]),
      child: Column(
        children: [
          const Text(
            'Total Notifications',
            style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans'),
          ),
          requests == null
              ? const CircularProgressIndicator()
              : Text(
                  requests!.length.toString(),
                  style: const TextStyle(
                      fontSize: 40,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans'),
                ),
        ],
      ),
    );
  }

  Widget viewNotificationRequest() {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
      child: const Text(
        'Booking Request',
        style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
            fontSize: 12),
      ),
    );
  }

  Widget gridView() {
    return requests == null
        ? const CircularProgressIndicator()
        : GridView.builder(
            itemCount: requests!
                .length, // replace with the actual number of items you have
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: .9,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
            ),
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 8),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              final request = requests![index];
              final etablissement = findEtbInTheList(request.etbId);
              return gridViewItem(
                etb: etablissement!,
                req: request,
              );
            },
          );
  }

  Widget gridViewItem({
    bool isButtonPressed = false,
    required Etablissement etb,
    required Booking req,
    // required int people
  }) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 120,
        maxWidth: 200,
        minHeight: 60,
        maxHeight: 200,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        elevation: 4,
        shadowColor: Colors.grey.shade100,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Image.network(
                    etb.images[0],
                    fit: BoxFit.fitHeight,
                    width: 180,
                  ),
                  // child: Text(etb.nameEtb),
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    height: 18,
                    width: 18,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: req.state == 'Confirmé'
                          ? const Color(0xFF31C911)
                          : Colors.amber,
                      border: Border.all(
                        color: Colors.white,
                        style: BorderStyle.solid,
                        width: 3,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 2),
              child: Text(
                "Date et Heure de réservation: ${req.date} à ${req.time}h",
                style: const TextStyle(
                  color: Colors.grey,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            Text(
              "Nombre de personnes: ${req.people.toString()}",
              style: const TextStyle(
                color: Colors.grey,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
            Text(
              req.state,
              style: const TextStyle(
                color: Colors.grey,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            req.state != "En attente"
                ? SizedBox(
                    height: 30,
                    width: 80,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red)),
                      onPressed: () {},
                      child: const Text(
                        'Annuler',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w200,
                            fontSize: 12.0),
                      ),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green)),
                          onPressed: () {
                            setState(() {
                              isButtonPressed = true;
                            });
                            confirmRequest(req.id);
                            sendConfirmationPushNotifications(etb, req);
                          },
                          child: const Text(
                            'Accept',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w200,
                                fontSize: 12.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                        width: 1.0,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.red)),
                          onPressed: () {
                            setState(() {
                              isButtonPressed = true;
                            });
                            denyRequest(req.id);
                            sendDenyPushNotifications(etb, req);
                          },
                          child: const Text(
                            'Deny',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w200,
                                fontSize: 12.0),
                          ),
                        ),
                      )
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
