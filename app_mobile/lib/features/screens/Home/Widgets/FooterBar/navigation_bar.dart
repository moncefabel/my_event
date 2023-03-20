 import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/heroicons_solid.dart';
import 'package:iconify_flutter/icons/ri.dart';

import '../../../Historic/historic_buy_page.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 25.0, right: 25.0),
      height: 50.0,
      decoration: BoxDecoration(color: Color(0xFF1A1819)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            Container(
                child: Iconify(
              Ri.home_fill,
              color: Color(0xFFD17742),
            )),
          
         GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => HistoricBuyPage()));
            },
            child: Container(
                child: Iconify(
              Ri.handbag_fill,
              color: Color(0xFF4E4F53),
            )),
          ),
          Container(
            child: Iconify(
              Ri.heart_2_fill,
              color: Color(0xFF4E4F53),
            ),
          ),
          Container(
            child: Stack(
              children: [
                Iconify(
                  HeroiconsSolid.bell,
                  color: Color(0xFF4E4F53),
                ),
                Positioned(
                    top: 2.0,
                    left: 15.0,
                    child: Container(
                      height: 7.0,
                      width: 7.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.5),
                          color: Colors.red),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
  }

 
  
