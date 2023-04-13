import 'dart:io';

import 'package:app_web/views/Connection/SignIn/sign_in_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

void popUpUniqueEmail(BuildContext context, String text) {
  if (ScaffoldMessenger.of(context).mounted) {
    AwesomeDialog(
      context: context,
      showCloseIcon: true,
      title: "Erreur",
      desc: text,
      btnOk: ElevatedButton(
        child: const Text("Sign In"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SignInScreen()),
          );
        },
      ),
    ).show();
  }
}

void signInErrors(BuildContext context, String text) {
  if (ScaffoldMessenger.of(context).mounted) {
    AwesomeDialog(
      context: context,
      showCloseIcon: true,
      title: "Erreur",
      desc: text,
    ).show();
  }
}

void showSnackBar(BuildContext context, String text) {
  if (ScaffoldMessenger.of(context).mounted) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}
Future<List<File>> pickImages() async {
  List<File> images = [];
  try {
    var files = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );
    if (files != null && files.files.isNotEmpty) {
      for (int i = 0; i < files.files.length; i++) {
        images.add(File(files.files[i].path!));
      }
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return images;
}
