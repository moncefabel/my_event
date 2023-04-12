import 'dart:convert';

import 'package:app_web/constants/utils.dart';
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
      print(jsonDecode(response.body));
      if(jsonDecode(response.body)['message'].toString().contains("phoneNumber")){
        showSnackBar(context, "Veuillez entrer un numéro de téléphone correct");
      }
      if(jsonDecode(response.body)['message'].toString().contains("email")){
        showSnackBar(context, "Veuillez entrer une adresse mail valide");
      }
      if(jsonDecode(response.body)['message'].toString().contains("password")){
        showSnackBar(context, "Veuillez entrer un mot de passe qui comporte au moins 6 caractères dont une majuscule, miniscule, chiffre");
      }
      if(jsonDecode(response.body)['message'].toString().contains("firstName")){
        showSnackBar(context, "Veuillez entrer prénom valid");
      }
      if(jsonDecode(response.body)['message'].toString().contains("lastName")){
        showSnackBar(context, "Veuillez entrer un nom valide");
      }
      break;

    default:
      // showSnackBar(context, response.body);
  }
}