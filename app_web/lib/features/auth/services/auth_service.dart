// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:app_web/constants/error_handling.dart';
import 'package:app_web/constants/app_colors.dart';
import 'package:app_web/constants/utils.dart';
import 'package:app_web/models/proprio.dart';
import 'package:app_web/views/Etablissements/add_etb_screen.dart';
import 'package:app_web/views/Etablissements/show_etb_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../providers/proprio_provider.dart';
import '../../../routing/route_names.dart';

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
          token: '',
          phoneNumber: phoneNumber);

      http.Response res = await http.post(Uri.parse('$uri/api/register'),
          body: proprio.toJson(),
          headers: <String, String>{
            'Content-type': 'application/json; charset=UTF-8',
          });
      // ignore: use_build_context_synchronously
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

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(Uri.parse('$uri/api/signIn'),
          body: jsonEncode({'email': email, 'password': password}),
          headers: <String, String>{
            'Content-type': 'application/json; charset=UTF-8',
          });

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            Provider.of<ProprioProvider>(context, listen: false)
                .setProprio(res.body);
            await prefs.setString("jwt", jsonDecode(res.body)['token']);
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder:(_) => const EtbsScreen(),
              ),
              (route) => false,
            );
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void getProprioData(
    BuildContext context,
  ) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? token = prefs.getString('jwt');

      if(token == null){
        prefs.setString('jwt', '');
      }
      var tokenRes = await http.post(
        Uri.parse('$uri/proprioId'),
        headers: <String, String>{
            'Content-type': 'application/json; charset=UTF-8',
            'jwt': token!
        },
      );

      var response = jsonDecode(tokenRes.body);
      if(response == true ){
        http.Response userRes = await http.get(
          Uri.parse('$uri/'),
          headers: <String, String>{
            'Content-type': 'application/json; charset=UTF-8',
            'jwt': token
          },
        );
        var userProvider = Provider.of<ProprioProvider>(context,listen: false);
        userProvider.setProprio(userRes.body);
      }
    } catch (e) {
      // showSnackBar(context, e.toString());
    }
  }
}
