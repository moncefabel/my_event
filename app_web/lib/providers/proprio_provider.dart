import 'package:flutter/material.dart';

import '../models/proprio.dart';

class ProprioProvider extends ChangeNotifier {
  Proprio _proprio = Proprio(
      id: '',
      firstName: '',
      lastName: '',
      phoneNumber: '',
      email: '',
      password: '',
      token: '');


  Proprio get proprio => _proprio;
  void setProprio(String proprio){
    _proprio = Proprio.fromJson(proprio);
    notifyListeners();
  }

}
