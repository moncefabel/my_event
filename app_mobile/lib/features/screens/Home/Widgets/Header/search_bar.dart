import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      TextFormField(
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Colors.blue)),
            hintText: "Le jardinier",
            prefixIcon: Icon(Icons.search),
            prefixIconColor: Colors.yellow),
      )
    ]));
  }
}
