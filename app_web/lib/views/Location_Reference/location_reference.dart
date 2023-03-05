// ignore_for_file: avoid_print, unused_field

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class LocationReference extends StatefulWidget {
  const LocationReference({super.key});

  @override
  State<LocationReference> createState() => _LocationReferenceState();
}

class _LocationReferenceState extends State<LocationReference> {
  final List<XFile> _imageFiles = [];
  final ImagePicker imagePicker = ImagePicker();

  Future<void> _pickImage() async {
    final List<XFile> selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages.isNotEmpty) {
      _imageFiles.addAll(selectedImages);
      setState(() {});
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
                child: Column(children: const [
                  Padding(
                    padding: EdgeInsets.all(30),
                  ),
                  Text('Nom d\'etablissement'),
                  TextField(),
                  Padding(padding: EdgeInsets.only(top: 30)),
                  Text('Adresse de l\'etablissement'),
                  TextField(),
                  Padding(padding: EdgeInsets.only(top: 30)),
                  Text('Ajouter des images'),
                  Padding(padding: EdgeInsets.only(top: 30)),
                ])),
            InkWell(
              onTap: () {
                _pickImage();
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Container(
                    color: Colors.blue,
                    padding: const EdgeInsets.all(10.0),
                    child: const Icon(Icons.photo_camera)),
              ),
            ),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(8.9),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 7),
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.only(right: 5.0),
                      itemCount: _imageFiles.length,
                      itemBuilder: (context, index) {
                        return Image.network(
                          _imageFiles[index].path,
                          width: 20,
                          height: 20,
                        );
                      })),
            ),
            const Padding(padding: EdgeInsets.only(right: 30)),
            Center(
              child: MaterialButton(
                  color: Colors.blue,
                  onPressed: () {},
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            const Padding(padding: EdgeInsets.only(top: 30))
          ],
        ),
      ),
    );
  }
}
