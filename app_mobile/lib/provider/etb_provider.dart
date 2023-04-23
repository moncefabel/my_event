import 'package:flutter/material.dart';
import 'package:myevent/models/etablissement.dart';

import '../models/customer.dart';

class EtbProvider extends ChangeNotifier {
   List<Etablissement> etbs = [];


  List<Etablissement> get etb => etbs;
  void setEtbs(List<Etablissement> newEtbs){
    
    for (var etb in newEtbs) {
      etbs.add(etb);
    }
    notifyListeners();
  }

  void clearValue(){
    etbs.clear();
  }

}
