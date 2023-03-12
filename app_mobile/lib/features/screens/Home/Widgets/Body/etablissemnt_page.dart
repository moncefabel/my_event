/*import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

import '../../../../../constants/utils.dart';
import '../../../../../models/etablissement.dart';

import '../../../Detail_page/detail_page.dart';
import '../../home_services.dart';
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart';

class PageBody extends StatefulWidget {
  final String? filter;

  const PageBody({Key? key, this.filter}) : super(key: key);

  @override
  State<PageBody> createState() => _PageBodyState();
}

class _PageBodyState extends State<PageBody> {
  List<Etablissement> etbs = [];
  final HomeServices homeService = HomeServices();
  String? _currentAddress;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  getLocation() async {
    // Get the current location
    final locationData = await Location().getLocation();
    // Reverse geocode the current location to get the address
    final addresses = await Geocoder.local.findAddressesFromCoordinates(
        Coordinates(locationData.latitude!, locationData.longitude!));
    final firstAddress = addresses.first;
    setState(() {
      _currentAddress = firstAddress.addressLine;
    });
    // Fetch the establishments based on the current address
    fetchEtbsByPlace(_currentAddress);
  }

  fetchEtbsByPlace(String? place) async {
    etbs = await homeService.fetchEtbsByPlace(context: context, place: place ?? '');
    setState(() {});
  }

  List<Etablissement> getFilteredEtbs() {
    if (widget.filter == null) {
      return etbs;
    } else {
      return etbs.where((e) => e.category == widget.filter).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    List<Etablissement> filteredEtbs = getFilteredEtbs();

    return Scaffold(
      body: ListView.builder(
        itemCount: filteredEtbs.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailPage(establishment: filteredEtbs[index]),
                ),
              );
            },
            child: ListTile(
              title: Text(filteredEtbs[index].nameEtb),
              subtitle: Text(filteredEtbs[index].lieu),
              //leading: Image.network('https://example.com/image.jpg'),
            ),
          );
        },
      ),
    );
  }
}
*/