// ignore_for_file: avoid_print, unused_field, prefer_const_constructors

import 'package:app_web/Widgets/OnHoverButton.dart';
import 'package:app_web/Widgets/location_list.dart';
import 'package:app_web/features/proprio/services/proprio_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants/app_colors.dart';
import '../../features/network_service.dart';
import '../../models/auto_complete/auto_complete_predictions.dart';
import '../../models/auto_complete/place_auto_complete_response.dart';

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

  String _description = '';

  List<AutoCompletePrediction> placePredictions = [];
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

  void placeAutoComplete(String query) async {
    Uri uri = Uri.https("maps.googleapis.com",
        'maps/api/place/autocomplete/json', {"input": query, "key": apiKey});
    String? response = await NetworkService.fetchUrl(uri);
    print(uri);
    if (response != null) {
      PlaceAutocompleteResponse result =
          PlaceAutocompleteResponse.parseAutoCompleteResult(response);
      if (result.predictions != null) {
        setState(() {
          placePredictions = result.predictions!;
        });
      }
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
                          Expanded(
                            child: Column(
                              children: [
                                Text('Nom du lieu'),
                                SizedBox(
                                  width: 500,
                                  child:
                                      TextField(controller: nameEtbController),
                                ),
                                Padding(padding: EdgeInsets.only(top: 10)),
                                Text('Lieu'),
                                SizedBox(
                                    width: 500,
                                    child: TextFormField(
                                      onChanged: (value) {
                                        placeAutoComplete(value);
                                      },
                                      controller: lieuController,
                                      textInputAction: TextInputAction.search,
                                    )),
                                Padding(padding: EdgeInsets.only(top: 10)),
                                Text('Capacite Maximale'),
                                SizedBox(
                                  width: 500,
                                  child: TextField(
                                    controller: capaciteMaxController,
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(top: 10)),
                                Text('Capacite minimale'),
                                SizedBox(
                                  width: 500,
                                  child: TextField(
                                    controller: capaciteMinController,
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(top: 10)),
                                Text('Heure d\'ouverture'),
                                SizedBox(
                                  width: 500,
                                  child: TextField(
                                    controller: heureOController,
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(top: 10)),
                                Text('Heure de fermeture'),
                                SizedBox(
                                  width: 500,
                                  child: TextField(
                                    controller: heureFController,
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(top: 10)),
                                Text('Prix'),
                                SizedBox(
                                  width: 500,
                                  child: TextField(
                                    controller: priceController,
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(top: 10)),
                                Text('Type'),
                                SizedBox(
                                  width: 500,
                                  child: TextField(
                                    controller: typeController,
                                  ),
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(top: 10)),
                                const Text('Description'),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  width: 500,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: TextField(
                                    decoration: const InputDecoration(
                                      hintText: 'Type your description here',
                                      border: InputBorder.none,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        _description = value;
                                      });
                                    },
                                    maxLines: null,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: placePredictions.length,
                    itemBuilder: (context, index) => LocationList(
                          press: () {
                            lieuController.text =
                                placePredictions[index].description.toString();
                          },
                          location: placePredictions[index].description!,
                        ))),
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
