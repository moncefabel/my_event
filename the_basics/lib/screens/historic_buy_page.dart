import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:the_basics/color_palette.dart';

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
        return Padding(
            padding: EdgeInsets.only(
                left: 25.0, right: 25.0, top: 10.0, bottom: 10.0),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[
                          ColorPalette().gradientTopLeft,
                          Colors.black54
                        ])),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.shopping_bag,
                        color: Colors.white,
                      ),
                      title: Text(
                        data['item'],
                        style: GoogleFonts.sourceSansPro(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                      subtitle: Text(
                        '$formattedDate - $formattedPrice',
                        style: GoogleFonts.sourceSansPro(
                            fontSize: 14, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette().scaffoldBg,
      appBar: AppBar(
        backgroundColor: ColorPalette().scaffoldBg,
        title: Text('History'),
      ),
      body: buildHistoricBuyList(),
    );
  }
}
