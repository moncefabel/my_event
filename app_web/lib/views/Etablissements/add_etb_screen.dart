// ignore_for_file: avoid_print, unused_field, prefer_const_constructors

import 'dart:io';

import 'package:app_web/Widgets/OnHoverButton.dart';
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

  void _removeImage(int index) {
    setState(() {
      _imageFiles.removeAt(index);
    });
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
    priceController.dispose();
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
          nameEtb: nameEtbController.text,
          prix: priceController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Form(
                  key: _addEtbFormKey,
                  child: SizedBox(
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 600,
                          ),
                          Column(
                            children: [
                              Text('Nom du lieu'),
                              SizedBox(
                                width: 200,
                                child: TextField(controller: nameEtbController),
                              ),
                              Padding(padding: EdgeInsets.only(top: 10)),
                              Text('Lieu'),
                              SizedBox(
                                width: 200,
                                child: TextField(controller: lieuController),
                              ),
                              Padding(padding: EdgeInsets.only(top: 10)),
                              Text('Capacite Maximale'),
                              SizedBox(
                                width: 200,
                                child: TextField(
                                  controller: capaciteMaxController,
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 10)),
                              Text('Capacite minimale'),
                              SizedBox(
                                width: 200,
                                child: TextField(
                                  controller: capaciteMinController,
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 10)),
                              Text('Heure d\'ouverture'),
                              SizedBox(
                                width: 200,
                                child: TextField(
                                  controller: heureOController,
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 10)),
                              Text('Heure de fermeture'),
                              SizedBox(
                                width: 200,
                                child: TextField(
                                  controller: heureFController,
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 10)),
                              Text('Prix'),
                              SizedBox(
                                width: 200,
                                child: TextField(
                                  controller: priceController,
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 10)),
                              Text('Type'),
                              SizedBox(
                                width: 200,
                                child: TextField(
                                  controller: typeController,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 30)),
            SizedBox(
              height: 50.0,
              child: InkWell(
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
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                ),
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.only(right: 5.0),
                itemCount: _imageFiles.length,
                itemBuilder: (context, index) {
                  return GestureDetector(onTap: () {
                    _removeImage(index);
                  }, child: OnHoverButton((isHovered) {
                    IconData? icon = isHovered ? Icons.remove : null;
                    return Stack(
                      children: [
                        Icon(icon),
                        Image.network(
                          _imageFiles[index].path,
                          width: 100,
                          height: 100,
                        ),
                      ],
                    );
                  }));
                },
              ),
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
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 30)),
          ],
        ),
      ),
    );
  }
}
