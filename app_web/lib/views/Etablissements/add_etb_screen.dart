// ignore_for_file: avoid_print, unused_field, prefer_const_constructors

import 'dart:io';

import 'package:app_web/features/proprio/services/proprio_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants/utils.dart';

class AddEtbScreen extends StatefulWidget {
  static const String routeName = '/add-etb';
  const AddEtbScreen({super.key});

  @override
  State<AddEtbScreen> createState() => _AddEtbScreenState();
}

class _AddEtbScreenState extends State<AddEtbScreen> {
  final TextEditingController nameEtbController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController heureOController = TextEditingController();
  final TextEditingController heureFController = TextEditingController();
  final TextEditingController capaciteMaxController = TextEditingController();
  final TextEditingController capaciteMinController = TextEditingController();
  final TextEditingController lieuController = TextEditingController();

  final ProprioService proprioService = ProprioService();

  final List<XFile> _imageFiles = [];
  final ImagePicker imagePicker = ImagePicker();

  Future<void> _pickImage() async {
    final List<XFile> selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages.isNotEmpty) {
      _imageFiles.addAll(selectedImages);
      setState(() {});
    }
  }

  final _addEtbFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    nameEtbController.dispose();
    typeController.dispose();
    priceController.dispose();
    heureFController.dispose();
    heureOController.dispose();
    capaciteMaxController.dispose();
    capaciteMinController.dispose();
    lieuController.dispose();
  }

  void addEtb() {
    if (_addEtbFormKey.currentState!.validate()) {
      proprioService.addEtb(
          context: context,
          type: typeController.text,
          lieu: lieuController.text,
          heureOuverture: heureOController.text,
          heureFermeture: heureFController.text,
          capaciteMax: capaciteMaxController.text,
          capaciteMin: capaciteMinController.text,
          images: _imageFiles,
          nameEtb: nameEtbController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _addEtbFormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                SizedBox(
                    width: 1000,
                    child: Column(children: [
                      Padding(
                        padding: EdgeInsets.all(30),
                      ),
                      Text('Nom'),
                      TextField(controller: nameEtbController),
                      Padding(padding: EdgeInsets.only(top: 30)),
                      // Text('Capacite Maximale'),
                      // TextField(controller: capaciteMaxController,),
                      // Text('Capacite minimale'),
                      // TextField(controller: capaciteMinController,),
                      // Text('Heure d\'ouverture'),
                      // TextField(controller: heureOController,),
                      // Text('Heure de fermeture'),
                      // TextField(controller: heureFController,),
                      // Text('Prix'),
                      // TextField(controller: priceController,),
                      // Text('Type'),
                      // TextField(controller: typeController,),
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
                      onPressed: () {
                        addEtb();
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                const Padding(padding: EdgeInsets.only(top: 30))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
