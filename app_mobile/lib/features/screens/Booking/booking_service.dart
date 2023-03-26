// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../constants/error_handling.dart';
import '../../../constants/utils.dart';
import '../../../models/booking.dart';

class BookingService {
  void requestForBooking(
      {required BuildContext context,
      required String userId,
      required String ownerId,
      required String etbId,
      required String state,
      required String date,
      required String time,
      required String token
      }) async {
    try {
      Booking reservation = Booking(
        date: date,
        ownerId: ownerId,
        state: state,
        etbId: etbId,
        // people: people,
        time: time,
        userId: userId,
        token: token
      );

      http.Response res = await http.post(Uri.parse('$uri/apiBooking/add'),
          body: reservation.toJson(),
          headers: <String, String>{
            'Content-type': 'application/json; charset=UTF-8',
          });
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Demande envoyée');
        },
      );
    } catch (e) {
      print(e.toString());
    }
  }
}