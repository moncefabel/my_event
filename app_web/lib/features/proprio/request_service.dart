import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../constants/app_colors.dart';
import '../../constants/error_handling.dart';
import '../../models/booking.dart';
import '../../providers/proprio_provider.dart';

class RequestServices{

  Future<List<Booking>> fetchAllRequests (BuildContext context) async{
    final proprioProvider = Provider.of<ProprioProvider>(context, listen: false);

    List<Booking> requests = [];
    try{
      http.Response res = await http.get(
        Uri.parse('$uri/apiBooking/bookings'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'jwt': proprioProvider.proprio.token,
          'id': proprioProvider.proprio.id
        },
      );
      
      // ignore: use_build_context_synchronously
      httpErrorHandle(
        response: res, 
        context: context, 
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            requests.add(
              Booking.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        }
      );
    }catch(e){
      // showSnackBar(context, e.toString());
    }
    return requests;
  }
}