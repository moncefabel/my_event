import 'package:flutter/material.dart';
import 'package:myevent/models/etablissement.dart';

class DetailPage extends StatefulWidget {
  Etablissement? establishment;
  static const String routeName = '/DetailPage';

  DetailPage({this.establishment});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool _isLoading = false;

  Future<void> _submitReview(String reviewText) async {
    setState(() {
      _isLoading = true;
    });

    // Simulate submitting review to server
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.establishment!.nameEtb),
      ),
      body: Column(
        children: [
          Hero(
            tag: 'establishment-image-${widget.establishment!.nameEtb}',
            child: Image.network('https://example.com/image.jpg'),
          ),
          Text(widget.establishment!.lieu),
          //Text(widget.establishment.phone),
          /*Expanded(
            child: ListView.builder(
              itemCount: widget.establishment.menu.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(widget.establishment.menu[index]),
                );
              },
            ),
          ),*/
          _isLoading ? const CircularProgressIndicator() : Container(),
          ElevatedButton(
            onPressed: () => _submitReview('My review'),
            child: const Text('Submit Review'),
          ),
        ],
      ),
    );
  }
}
