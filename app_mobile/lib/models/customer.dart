import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:myevent/provider/customer_provider.dart';
import 'package:provider/provider.dart';
class Customer{

  final String id;
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String token;
  Position position;

  Customer({
    required this.id, 
    required this.email, 
    required this.password, 
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.token,
    required this.position
  });

  Map<String, dynamic> toMap() {
      return {
        '_id': id,
        'firstName': firstName,
        'email': email,
        'password': password,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
        'token': token,
        'position': position
      };
    }
  factory Customer.fromMap(Map<String, dynamic> map){
    return Customer(
      id: map['_id'] ?? '', 
      email: map['email'] ?? '', 
      password: map['password'] ?? '', 
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      token: map['token'] ?? '',
      position: map['position'] ?? Position(longitude: 0,
        latitude: 0, 
        timestamp: DateTime(2023), 
        accuracy: 0, 
        altitude: 0, 
        heading: 0, 
        speed: 0, 
        speedAccuracy: 0)
,  );
  }

  String toJson() => json.encode(toMap());
  factory Customer.fromJson(String source) => Customer.fromMap(json.decode(source));

  

}