import 'package:flutter/material.dart';

import '../models/customer.dart';

class CustomerProvider extends ChangeNotifier {
   var _customer = Customer(
      id: '',
      firstName: '',
      lastName: '',
      phoneNumber: '',
      email: '',
      password: '',
      token: '');


  Customer get customer => _customer;
  void setCustomer(String customer){
    _customer = Customer.fromJson(customer);
    notifyListeners();
  }

}
