import 'package:flutter/material.dart';

import 'filter_clas.dart';
import 'filter_page.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);
  @override
  State<SearchBar> createState() => _SearchBarState();
}
class _SearchBarState extends State<SearchBar> {
final List<String> items = [   'bar','restaurent','boite de nuit ','chicha','sale des fetes'  ];
   TextEditingController searchController = TextEditingController();
     List<String> filteredItems(String query) {
    List<String> filteredList = [];
    for (var item in items) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        filteredList.add(item);
      }
    }
    return filteredList;
  }
void showFilterPage() {
  EstablishmentFilter filter = EstablishmentFilter(); // create a filter instance
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => FilterPage(filter: filter),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      TextFormField(
        controller: searchController,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.only(left: 10, right: 10),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
            hintText: "Search",
            prefixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  _showFilterSheet(context);
                },
              ),
             suffixIcon: IconButton(
                icon: const Icon(Icons.filter_list),
                onPressed: showFilterPage,
              ),
            ),
            onChanged: (query) {
              setState(() {}); // Trigger a rebuild with the filtered items.
            },
      )
    
    ]));
  }
}

void _showFilterSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.sort),
            title: const Text('Sort by'),
            onTap: () {
              // Handle sort option selection here
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.filter_alt),
            title: const Text('Filter by'),
            onTap: () {
              // Handle filter option selection here
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}

