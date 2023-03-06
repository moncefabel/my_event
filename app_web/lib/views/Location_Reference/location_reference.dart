// ignore_for_file: avoid_print, unused_field

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants/app_colors.dart';

class LocationReference extends StatefulWidget {
  const LocationReference({super.key});

  @override
  State<LocationReference> createState() => _LocationReferenceState();
}

class _LocationReferenceState extends State<LocationReference> {
  File? _pickedImage;
  Uint8List webImage = Uint8List(8);

  Future<void> _pickImage() async {
    if (!kIsWeb) {
      final ImagePicker picker = ImagePicker();
      XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        File selected = File(image.path);
        setState(() {
          _pickedImage = selected;
        });
      } else {
        print('no Image');
      }
    } else if (kIsWeb) {
      final ImagePicker picker = ImagePicker();
      XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        Uint8List f = await image.readAsBytes();
        setState(() {
          webImage = f;
          _pickedImage = File('a');
        });
      } else {
        print('no Image');
      }
    } else {
      print('Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 1000,
            child: Column(
              children: 
              [
                Padding(padding: EdgeInsets.all(30)),
              
            TextFormField(
              textInputAction: TextInputAction.next,
              cursorColor: primaryColor,
              decoration: const InputDecoration(
                hintText: "Nom d'établissement",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.home),
                ),
              ),
            ),

            const Padding(padding: EdgeInsets.only(top: 30)),
            TextFormField(
              textInputAction: TextInputAction.next,
              cursorColor: primaryColor,
              decoration: const InputDecoration(
                hintText: "Adresse d'établissement",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.location_on),
                ),
              ),
            ),          
            const Padding(padding: EdgeInsets.only(top: 30)),
            TextFormField(
              textInputAction: TextInputAction.next,
              cursorColor: primaryColor,
              decoration: const InputDecoration(
                hintText: "Ajouter des images",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.image),
                ),
              ),
            ),     
            ElevatedButton(
                onPressed: () {
                  _pickImage();
                },
                child: const Icon(Icons.add)
            ),

            const Padding(padding: EdgeInsets.only(top: 30)),
            ButtonBar(
              layoutBehavior: ButtonBarLayoutBehavior.constrained,
              children: [
                InkWell(
                  onTap: () {},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Container(
                      color: Colors.blue,
                      padding: const EdgeInsets.all(10.0),
                      child: const Text(
                        'Envoyer',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.bold,
                        color: Colors.white),
                      )
                    )
                  )
                )
              ]
            )
            ]
            )
          )
        ]
        ),
      ),
    );
                        
}
}