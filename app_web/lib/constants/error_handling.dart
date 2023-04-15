import 'dart:convert';

import 'package:app_web/constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;

    case 400:
      final res = jsonDecode(response.body);
      if (res['code'].toString().contains("11000")) {
        popUpUniqueEmail(context, "Email déjà utilisé");
      }
      break;
    case 402:
      popUpError(context, "Email Introuvable");

      break;
    case 401:
      popUpError(context, "Mot de passe incorrect");
      break;
    case 408:
      popUpError(context, "Capacités non valide");
      break;
    case 409:
      popUpError(context, "Horaires non valide");
      break;


    default:
    // showSnackBar(context, response.body);
  }
}
