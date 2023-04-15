import 'package:flutter/material.dart';
import 'package:myevent/features/screens/Detail_page/image_dialog.dart';
import 'package:myevent/features/screens/Detail_page/price_etb.dart';
import 'package:myevent/models/etablissement.dart';

class EtbDetail extends StatelessWidget {
  EtbDetail(this.etb);
  final Etablissement etb;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      color: Colors.white,
      child: Column(
        children: [
          Text(etb.nameEtb,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildIconText(Icons.access_time_outlined, Colors.blue,
                  "${etb.heureOuverture.hour.toString()}:00 - ${etb.heureFermeture.hour.toString()}:00"),
              _buildIconText(Icons.man_2_outlined, Colors.red,
                  "${etb.capaciteMin.toString()} - ${etb.capaciteMax.toString()}")
            ],
          ),
          SizedBox(height: 30),
          PriceEtb(etb),
          SizedBox(
            height: 30,
          ),
          Row(children: [
            Text(
              "Images",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ]),
          Container(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40)),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (_) => ImageDialog(etb.images[index]));
                        },
                        child: Image.network(
                          etb.images[index],
                          width: 90,
                        ),
                      ),
                    ],
                  )),
              separatorBuilder: (_, index) => SizedBox(
                width: 5,
              ),
              itemCount: etb.images.length,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                'Description',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            etb.description,
            style: TextStyle(wordSpacing: 1.2, height: 1.5, fontSize: 16),
          )
        ],
      ),
    );
  }

  Widget _buildIconText(IconData icon, Color color, String text) {
    return Row(
      children: [
        Icon(icon, color: color, size: 20),
        Text(text, style: TextStyle(fontSize: 16))
      ],
    );
  }
}
