import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myevent/models/booking.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;


import '../../../constants/error_handling.dart';
import '../../../constants/utils.dart';
import '../../../provider/customer_provider.dart';

class NotificationService{

  Future<List<Booking>> fetchBookings({
    required BuildContext context,
  }) async {
  
    final customerProvider = Provider.of<CustomerProvider>(context, listen: false);
    List<Booking> bookingsList = [];

    try {
      http.Response res =
          await http.get(Uri.parse('$uri/apiBooking/userBookings'),
          headers: <String, String>{
            'Content-type': 'application/json; charset=UTF-8',
            'jwt': customerProvider.customer.token,
            'id': customerProvider.customer.id
        },);
        // ignore: use_build_context_synchronously
        httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            for (int i = 0; i < jsonDecode(res.body).length; i++) {
            bookingsList.add(
              Booking.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
          });

    }catch (e) {
      print(e.toString());
    }
    return bookingsList;
  }
}