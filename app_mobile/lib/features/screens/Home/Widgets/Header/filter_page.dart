import 'package:flutter/material.dart';
class FilterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: Column(
        children: [
          CheckboxListTile(
            title: Text('Fete'),
            value: false,
            onChanged: (value) {},
          ),
          CheckboxListTile(
            title: Text('Vegan'),
            value: false,
            onChanged: (value) {},
          ),
          Slider(
            value: 0.0,
            min: 0.0,
            max: 5.0,
            divisions: 5,
            label: 'Price',
            onChanged: (value) {},
          ),
          ElevatedButton(
            child: const Text('Apply Filters'),
            onPressed: () {
              Navigator.pop(context); // Close the filter page.
            },
          ),
        ],
      ),
    );
  }
}
