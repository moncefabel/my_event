import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../constants/app_colors.dart';
import '../../constants/error_handling.dart';
import '../../constants/utils.dart';
import '../../models/booking.dart';
import '../../models/etb.dart';
import '../../providers/proprio_provider.dart';

class RequestServices {
  Future<List<Booking>> fetchAllRequests(BuildContext context) async {
    final proprioProvider =
        Provider.of<ProprioProvider>(context, listen: false);

    List<Booking> requests = [];
    try {
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
          });
    } catch (e) {
      // showSnackBar(context, e.toString());
    }
    return requests;
  }

  void confirmRequest(
      {required BuildContext context, required String requestId}) async {
    final proprioProvider =
        Provider.of<ProprioProvider>(context, listen: false);
    try {
      http.Response res = await http.put(Uri.parse('$uri/apiBooking/confirm'),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'jwt': proprioProvider.proprio.token,
          },
          body: jsonEncode({'id': requestId}));

      // ignore: use_build_context_synchronously
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context, 'Réservation confirmée');
          });
    } catch (error) {
      print(error.toString());
    }
    
  }
  void denyRequest(
      {required BuildContext context, required String requestId}) async {
    final proprioProvider =
        Provider.of<ProprioProvider>(context, listen: false);
    try {
      http.Response res = await http.put(Uri.parse('$uri/apiBooking/decline'),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'jwt': proprioProvider.proprio.token,
          },
          body: jsonEncode({'id': requestId}));

      // ignore: use_build_context_synchronously
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context, 'Réservation refusée');
          });
    } catch (error) {
      print(error.toString());
    }
    
  }

  void sendPushNotificationsConfirmation({
    required BuildContext context,
    required Etablissement etb,
    required Booking req
  }) async{
    try{
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String,String>{
          'Content-type': 'application/json',
          'Authorization': 'key=AAAA6SxAdso:APA91bGq5CFwl8pNBN2fW7A_QeTd16xXDbhDWa-pqH9Xi1W4xRaPogNHYo4bFQN5ytI2MuzB9A0vW2Sr5HIzCT1j4kIviK8eL-xKzOwoP7WwIrgLTzw1CrNOit5vPuQX_0ItuwhOIXH9'
        },
        body: jsonEncode(
          <String, dynamic>{
            'priority':'high',
            'data': <String, dynamic>{
              'click_action':'FLUTTER_NOTIFICATION_CLICK',
              'status':'done',
              'body': 'Votre réservation au ${etb.nameEtb} à été confirmé',
              'title': 'MyEvent'
            },

            "notification": <String, dynamic>{
              "title":"MyEvent",
              "body":'Votre réservation au ${etb.nameEtb} à été confirmé',
              "android_channel_id":"dbevent"
            },
            "to": req.token
          },
        ),
      );
    }catch(error){
      print(error.toString());
    }
  }
  void sendPushNotificationsDeny({
    required BuildContext context,
    required Etablissement etb,
    required Booking req
  }) async{
    try{
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String,String>{
          'Content-type': 'application/json',
          'Authorization': 'key=AAAA6SxAdso:APA91bGq5CFwl8pNBN2fW7A_QeTd16xXDbhDWa-pqH9Xi1W4xRaPogNHYo4bFQN5ytI2MuzB9A0vW2Sr5HIzCT1j4kIviK8eL-xKzOwoP7WwIrgLTzw1CrNOit5vPuQX_0ItuwhOIXH9'
        },
        body: jsonEncode(
          <String, dynamic>{
            'priority':'high',
            'data': <String, dynamic>{
              'click_action':'FLUTTER_NOTIFICATION_CLICK',
              'status':'done',
              'body': 'Votre réservation au ${etb.nameEtb} à été refusée',
              'title': 'MyEvent'
            },

            "notification": <String, dynamic>{
              "title":"MyEvent",
              "body":'Votre réservation au ${etb.nameEtb} à été refusée',
              "android_channel_id":"dbevent"
            },
            "to": req.token
          },
        ),
      );
    }catch(error){
      print(error.toString());
    }
  }
}
