import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar(this.leftIcon, {this.leftCallback});
  final IconData leftIcon;
  final Function? leftCallback;
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 25,
        right: 25
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween
      , children: [
        GestureDetector(
          onTap: leftCallback != null ? () => leftCallback!() : null, 
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            
            child: Icon(leftIcon)
          ),
        ),
      ],)
    );
  }
}