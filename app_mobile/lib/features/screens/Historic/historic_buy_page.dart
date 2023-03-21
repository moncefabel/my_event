import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myevent/features/screens/Params/log_out_button.dart';

import '../../auth/services/auth_service.dart';

class HistoricBuyPage extends StatefulWidget {
  const HistoricBuyPage({super.key});

  @override
  State<HistoricBuyPage> createState() => _HistoricBuyPageState();
}

class _HistoricBuyPageState extends State<HistoricBuyPage> {
  List<Map<String, dynamic>> historicBuyData = [
    {
      'date': DateTime(2022, 12, 1),
      'item': 'Laptop',
      'price': 1200.00,
    },
    {
      'date': DateTime(2022, 11, 15),
      'item': 'Smartphone',
      'price': 800.00,
    },
    {
      'date': DateTime(2022, 10, 20),
      'item': 'Tablet',
      'price': 500.00,
    },
  ];

  Widget buildHistoricBuyList() {
    return ListView.builder(
      itemCount: historicBuyData.length,
      itemBuilder: (context, index) {
        Map<String, dynamic> data = historicBuyData[index];
        String formattedDate = DateFormat.yMMMd().format(data['date']);
        String formattedPrice = '\$${data['price'].toStringAsFixed(2)}';
        return ListTile(
          leading: Icon(Icons.shopping_bag),
          title: Text(data['item']),
          subtitle: Text('$formattedDate - $formattedPrice'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buy History'),
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
