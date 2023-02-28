import 'dart:js';
import 'dart:math';

import 'package:app_web/constants/error_handling.dart';
import 'package:app_web/constants/app_colors.dart';
import 'package:app_web/constants/utils.dart';
import 'package:app_web/models/proprio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService {
  void signUpUser(
      {required BuildContext context,
      required String email,
      required String password,
      required String firstName,
      required String lastName,
      required String phoneNumber}) async {
    try {
      Proprio proprio = Proprio(
          id: '',
          email: email,
          password: password,
          firstName: firstName,
          lastName: lastName,
          phoneNumber: phoneNumber);

      http.Response res = await http.post(Uri.parse('$uri/api/register'),
          body: proprio.toJson(),
          headers: <String, String>{
            'Content-type': 'application/json; charset=UTF-8',
          });
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Account created successfully');
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
