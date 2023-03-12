import 'package:flutter/material.dart';

import 'filter_clas.dart';
class FilterPage extends StatefulWidget {
  final EstablishmentFilter filter;

  const FilterPage({Key? key, required this.filter}) : super(key: key);

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  EstablishmentFilter get _filter => widget.filter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: Column(
        children: [
          CheckboxListTile(
            title: Text('Bar '),
            value: _filter.bar,
            onChanged: (value) {
              setState(() {
                _filter.bar = value ?? false;
              });
            },
          ),
          CheckboxListTile(
            title: Text('Restaurent'),
            value: _filter.restaurant,
            onChanged: (value) {
              setState(() {
                _filter.restaurant = value ?? false;
              });
            },
          ),
          Slider(
            value: _filter.price,
            min: 0.0,
            max: 5.0,
            divisions: 5,
            label: 'Price',
            onChanged: (value) {
              setState(() {
                _filter.price = value;
              });
            },
          ),
          ElevatedButton(
            child: const Text('Apply Filters'),
            onPressed: () {
              Navigator.pop(context, _filter); // Close the filter page and return the selected filters.
            },
          ),
        ],
      ),
    );
  }
}
