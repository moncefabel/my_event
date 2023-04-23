import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetworkService{

  static Future<String?> fetchUrl(Uri uri) async{
    try{
      final response = await http.get(uri);
      if(response.statusCode == 200){
        return response.body;
      }
      
    }catch(e){
      debugPrint(e.toString());
    }
    return null;
  }
}