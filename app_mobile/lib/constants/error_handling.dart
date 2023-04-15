import 'dart:convert';

import 'package:myevent/constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}){
  switch(response.statusCode) {
    case 200:
      onSuccess();
      break;

    case 400:
      final res = jsonDecode(response.body);
      if (res['code'].toString().contains("11000")) {
        errorPopUp(context, "Email déjà utilisé");
      }
      break;
    case 402:
      errorPopUp(context, "Email Introuvable");
      break;

    case 401:
      errorPopUp(context, "Mot de passe incorrect");
      break;

    case 406:
      errorPopUp(context, "Nombre de personnes inférieur ou supérieur au nombre possible");
      break;

    case 407:
      errorPopUp(context, "L'heure ne respecte pas la plage horaire");
      break;
    
    default:
      // showSnackBar(context, response.body);
  }
}
