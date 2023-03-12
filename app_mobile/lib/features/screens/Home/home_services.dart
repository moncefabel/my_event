import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myevent/constants/error_handling.dart';
import 'package:myevent/constants/utils.dart';
import 'package:myevent/models/etablissement.dart';
import 'package:http/http.dart' as http;
import 'package:myevent/provider/customer_provider.dart';
import 'package:provider/provider.dart';

class HomeServices {
  Future<List<Etablissement>> fetchEtbsByPlace({
    required BuildContext context,
    required String place
  }) async {
    final customerProvider = Provider.of<CustomerProvider>(context, listen: false);
    List<Etablissement> etbsList = [];
    
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/apiEtb/etbs?lieu=$place'),
          headers: <String, String>{
            'Content-type': 'application/json; charset=UTF-8',
            'jwt': customerProvider.customer.token
        },);
        // ignore: use_build_context_synchronously
        httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            for (int i = 0; i < jsonDecode(res.body).length; i++) {
            etbsList.add(
              Etablissement.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
          });

    }catch (e) {
      print("hello");
      // showSnackBar(context, e.toString());
    }
    return etbsList;
  }
}
