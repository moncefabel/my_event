import 'dart:convert';

import 'package:myevent/constants/error_handling.dart';
import 'package:myevent/constants/utils.dart';

import 'package:myevent/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  void signUpUser(
      {required BuildContext context,
      required String email,
      required String password,
      required String firstName,
      required String lastName,
      required String phoneNumber}) async {
    try {
      User user = User(
          id: '',
          email: email,
          password: password,
          firstName: firstName,
          lastName: lastName,
          token: '',
          phoneNumber: phoneNumber);

      http.Response res = await http.post(Uri.parse('$uri/api/register'),
          body: user.toJson(),
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

  void signInUser(
      {required BuildContext context,
      required String email,
      required String password,
      }) async {
    try {

      http.Response res = await http.post(Uri.parse('$uri/api/signIn'),
          body: jsonEncode(
            {
              'email': email,
              'password': password
            }
          ),
          headers: <String, String>{
            'Content-type': 'application/json; charset=UTF-8',
          });
          
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString("jwt", jsonDecode(res.body)['token']);
        }
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}