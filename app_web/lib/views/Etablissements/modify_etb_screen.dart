import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../Widgets/OnHoverButton.dart';
import '../../features/proprio/services/proprio_service.dart';
import '../../models/etb.dart';

class ModifyEtbScreen extends StatefulWidget {
  static const String routeName = '/update-etb';
  final Etablissement etb;

  const ModifyEtbScreen({
    Key? key,
    required this.etb,
  }) : super(key: key);

  @override
  State<ModifyEtbScreen> createState() => ModifyEtbScreenState();
}

class ModifyEtbScreenState extends State<ModifyEtbScreen> {
  final TextEditingController nameEtbController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController heureOController = TextEditingController();
  final TextEditingController heureFController = TextEditingController();
  final TextEditingController capaciteMaxController = TextEditingController();
  final TextEditingController capaciteMinController = TextEditingController();
  final TextEditingController lieuController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final ProprioService proprioService = ProprioService();
  final _updateEtbFormKey = GlobalKey<FormState>();

  final List<String> imagesToString = [];
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

  @override
  void initState() {
    super.initState();
  }

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
    descriptionController.dispose();

  }

  void updateEtb() {
    if (_updateEtbFormKey.currentState!.validate()) {
      proprioService.updateEtb(
          context: context,
          id: widget.etb.id,
          type: typeController.text,
          lieu: lieuController.text,
          heureOuverture: heureOController.text,
          heureFermeture: heureFController.text,
          capaciteMax: capaciteMaxController.text,
          capaciteMin: capaciteMinController.text,
          images: widget.etb.images,
          nameEtb: nameEtbController.text,
          prix: priceController.text,
          userId: widget.etb.userId,
          description: widget.etb.description);
    }
  }

  @override
  Widget build(BuildContext context) {
    nameEtbController.text = widget.etb.nameEtb;
    lieuController.text = widget.etb.lieu;
    priceController.text = widget.etb.prix.toString();
    heureFController.text = widget.etb.heureFermeture;
    heureOController.text = widget.etb.heureOuverture;
    capaciteMaxController.text = widget.etb.capaciteMax;
    capaciteMinController.text = widget.etb.capaciteMin;
    typeController.text = widget.etb.type;
    descriptionController.text = widget.etb.description;


    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Form(
                  key: _updateEtbFormKey,
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        children: [
                          const Text('Nom du lieu'),
                          SizedBox(
                            width: 500,
                            child: TextFormField(
                              controller: nameEtbController,
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(top: 10)),
                          const Text('Lieu'),
                          SizedBox(
                            width: 500,
                            child: TextFormField(
                              controller: lieuController,
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(top: 10)),
                          const Text('Capacite Maximale'),
                          SizedBox(
                            width: 500,
                            child: TextFormField(
                              controller: capaciteMaxController,
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(top: 10)),
                          const Text('Capacite minimale'),
                          SizedBox(
                            width: 500,
                            child: TextFormField(
                              controller: capaciteMinController,
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(top: 10)),
                          const Text('Heure d\'ouverture'),
                          SizedBox(
                            width: 500,
                            child: TextFormField(
                              controller: heureOController,
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(top: 10)),
                          const Text('Heure de fermeture'),
                          SizedBox(
                            width: 500,
                            child: TextFormField(
                              controller: heureFController,
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(top: 10)),
                          const Text('Prix'),
                          SizedBox(
                            width: 500,
                            child: TextFormField(
                              controller: priceController,
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(top: 10)),
                          const Text('Type'),
                          SizedBox(
                            width: 500,
                            child: TextFormField(
                              controller: typeController,
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(top: 10)),
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
                              controller: descriptionController,
                              maxLines: null,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 30)),
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
                  updateEtb();
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
