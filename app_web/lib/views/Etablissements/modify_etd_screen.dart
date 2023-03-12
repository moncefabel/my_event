import 'package:flutter/material.dart';

class ModifyEtbScreen extends StatefulWidget {
  const ModifyEtbScreen({super.key});

  @override
  State<ModifyEtbScreen> createState() => ModifyEtbScreenState();
}

class ModifyEtbScreenState extends State<ModifyEtbScreen> {
  List<String> placeHolder = ['Nom Lieu', 'Adresse'];
  List<String> content = ['weird', '14 rue anjou'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Scaffold(
          body: placeHolder.isNotEmpty
              ? ListView.builder(
                  itemCount: placeHolder.length,
                  itemBuilder: (context, index) {
                    final champ = placeHolder[index];
                    var contentStuff = content[index];
                    return ListTile(
                      title: SizedBox(
                          width: 300,
                          child: TextFormField(
                              initialValue: contentStuff,
                              onChanged: (newValue) {
                                setState(() {
                                  content[index] = newValue;
                                });
                              })),
                      leading: Text(champ),
                    );
                  })
              : const Center(
                  child: CircularProgressIndicator(),
                ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            tooltip: "Save",
            child: const Icon(Icons.save),
          )),
    );
  }
}
