import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../models/customer.dart';

class CustomerProvider extends ChangeNotifier {
   var _customer = Customer(
      id: '',
      firstName: '',
      lastName: '',
      phoneNumber: '',
      email: '',
      password: '',
      token: '',
      position: Position(
        longitude: 0,
        latitude: 0, 
        timestamp: DateTime(2023), 
        accuracy: 0, 
        altitude: 0, 
        heading: 0, 
        speed: 0, 
        speedAccuracy: 0));


  Customer get customer => _customer;
  void setCustomer(String customer){
    _customer = Customer.fromJson(customer);
    notifyListeners();
  }

  void setPosition(Position p){
    _customer.position = p;
  }

  void clearValue(){
    _customer = Customer(
      id: '',
      firstName: '',
      lastName: '',
      phoneNumber: '',
      email: '',
      password: '',
      token: '',
      position: Position(
        longitude: 0,
        latitude: 0, 
        timestamp: DateTime(2023), 
        accuracy: 0, 
        altitude: 0, 
        heading: 0, 
        speed: 0, 
        speedAccuracy: 0));
  }

}
