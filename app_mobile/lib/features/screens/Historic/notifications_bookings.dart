import 'package:flutter/material.dart';
import 'package:myevent/features/auth/services/notification_service.dart';

import '../../../models/booking.dart';
import '../../auth/services/auth_service.dart';

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
        : ListView.builder(
            itemCount: bookings!.length,
            itemBuilder: (context, index) {
              Booking data = bookings![index];
              // String formattedDate = DateFormat.yMMMd().format(data['date']);
              // String formattedPrice = '\$${data['price'].toStringAsFixed(2)}';
              return ListTile(
                leading: const Icon(Icons.shopping_bag),
                title: Text(data.nameEtb),
                subtitle: Text('${data.date} - ${data.time} ${data.state}'),
              );
            },
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservations'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                AuthService().logOut(context);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: buildHistoricBuyList(),
    );
  }
}
