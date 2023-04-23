import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myevent/features/auth/services/notification_service.dart';

import '../../../models/booking.dart';

class HistoricBuyPage extends StatefulWidget {
  const HistoricBuyPage({super.key});

  @override
  State<HistoricBuyPage> createState() => _HistoricBuyPageState();
}

class _HistoricBuyPageState extends State<HistoricBuyPage> {
  NotificationService notificationService = NotificationService();
  List<Booking>? bookings;
  @override
  void initState() {
    super.initState();
    getConfirmedBookigns();
  }

  getConfirmedBookigns() async {
    bookings = await notificationService.fetchBookings(context: context);
    setState(() {});
  }

  Widget buildHistoricBuyList() {
    return bookings == null
        ? const CircularProgressIndicator()
        : bookings!.isEmpty
            ? Center(
                child: Text(
                  "Aucune réservation en cours",
                  style: GoogleFonts.sourceSansPro(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade400,
                      fontSize: 20.0),
                ),
              )
            : ListView.builder(
                itemCount: bookings!.length,
                itemBuilder: (context, index) {
                  Booking data = bookings![index];
                  return Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          leading: const Icon(Icons.shopping_bag),
                          title: Text(data.nameEtb),
                          subtitle: Text(
                              '${data.date} - ${data.time.substring(11,16)}h - ${data.state}'),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UsePaypal(
                                    sandboxMode: true,
                                    clientId:
                                        "AcNqwjQVSkpyvqPjYvJjwHar7D5YDffX3F7MOEg2aQC3LCv8Dm1Ld070hOXWMat0u8Ao9nW87RykYn23",
                                    secretKey:
                                        "EBzQ65-HwD_AYc7bxL9bX9CuwVu3HBtdgbz-UanlAJgrvvFJ5BckVAnYWGIxqntLDNMqRULMlU7uLU1j",
                                    returnURL: "https://samplesite.com/return",
                                    cancelURL: "https://samplesite.com/cancel",
                                    onSuccess: (Map params) async {
                                      print("onSuccess! $params");
                                    },
                                    onError: (error) {
                                      print("onError $error");
                                    },
                                    onCancel: (params) {
                                      print("cancelled: $params");
                                    },
                                    transactions: const [
                                      {
                                        "amount": {
                                          "total": '10',
                                          "currency": "EUR",
                                          "details": {
                                            "subtotal": '10',
                                          }
                                        },
                                      }
                                    ],
                                    note: "Contact us")),
                          );
                        },
                        icon: data.state == "Confirmé"
                            ? const Icon(Icons.paypal_outlined)
                            : const Icon(Icons.delete),
                      ),
                    ],
                  );
                },
              );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservations'),
      ),
      body: buildHistoricBuyList(),
    );
  }
}
