import 'dart:convert';

import 'package:myevent/constants/error_handling.dart';
import 'package:myevent/constants/utils.dart';
import 'package:myevent/features/screens/Home/Widgets/Body/etablissements_display.dart';
import 'package:myevent/features/screens/Home/Widgets/FooterBar/navigation_bar.dart';
import 'package:myevent/features/screens/Home/home.dart';
import 'package:myevent/features/screens/Params/log_out_button.dart';

import 'package:myevent/models/customer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myevent/provider/customer_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../screens/onboarding/onboarding.dart';

class AuthService {
  void signUpUser(
      {required BuildContext context,
      required String email,
      required String password,
      required String firstName,
      required String lastName,
      required String phoneNumber}) async {
    try {
      Customer customer = Customer(
          id: '',
          email: email,
          password: password,
          firstName: firstName,
          lastName: lastName,
          token: '',
          phoneNumber: phoneNumber);

      http.Response res = await http.post(Uri.parse('$uri/apiClient/register'),
          body: customer.toJson(),
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

      http.Response res = await http.post(Uri.parse('$uri/apiClient/signIn'),
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
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder:(_) => LogOutButton(),
              ),
              (route) => false,
            );
        }
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void getCustomerData(
    BuildContext context,
  ) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? token = prefs.getString('jwt');

      if(token == null){
        prefs.setString('jwt', '');
      }
      var tokenRes = await http.post(
        Uri.parse('$uri/clientId'),
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
        var userProvider = Provider.of<CustomerProvider>(context,listen: false);
        userProvider.setCustomer(userRes.body);
      }
    } catch (e) {
      // showSnackBar(context, e.toString());
    }
  }

  void logOut(BuildContext context) async {
    try{
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.setString("jwt", '');
      print(Provider.of<CustomerProvider>(context).customer.token.isNotEmpty);
      Navigator.pushNamedAndRemoveUntil(
        context,
        HomeScreen.routeName,
        (route) => false,);
    }catch(e){
      // showSnackBar(context, e.toString());
    }
  }
}