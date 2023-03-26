import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
class Booking{

  final String userId;
  final String ownerId;
  final String etbId;
  final String state;
  // final int people;
  final String time;
  final String date;
  final String token;

  Booking({
    required this.userId,
    required this.date,
    required this.etbId,
    required this.state,
    required this.ownerId,
    // required this.people,
    required this.time,
    required this.token
  });

  Map<String, dynamic> toMap() {
      
      return {
        'userId': userId,
        'ownerId': ownerId,
        'etbId': etbId,
        'state': state,
        'date': date,
        // 'people': people,
        'time': time,
        'tokenDevice': token
        
      };
    }
  factory Booking.fromMap(Map<String, dynamic> map){
    return Booking(
      userId: map['userId'] ?? '',
      ownerId: map['ownerId'] ?? '', 
      etbId: map['etbId'] ?? '', 
      // people: map['people'] ?? '', 
      date: map['date'] ?? '',
      time: map['time'] ?? '',
      state: map['state'] ?? '',
      token: map['tokenDevice'] ?? ''

    );
  }

  String toJson() => json.encode(toMap());
  factory Booking.fromJson(String source) => Booking.fromMap(json.decode(source));

}
