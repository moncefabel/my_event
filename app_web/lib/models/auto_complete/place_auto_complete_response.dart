// ignore_for_file: prefer_null_aware_operators

import 'dart:convert';

import 'auto_complete_predictions.dart';

class PlaceAutocompleteResponse{

  final String? status;
  final List<AutoCompletePrediction>? predictions;

  PlaceAutocompleteResponse({this.status, this.predictions});

  factory PlaceAutocompleteResponse.fromJson(Map<String, dynamic> json) {
    return PlaceAutocompleteResponse(
      status: json['status'] as String?,
      predictions: json['predictions'] != null
      ? json['predictions']
      .map<AutoCompletePrediction>(
        (json) => AutoCompletePrediction.fromJson(json))
        .toList()
      : null,
      );
  }


  static PlaceAutocompleteResponse parseAutoCompleteResult(String resBody){
    final parsed = json.decode(resBody).cast<String, dynamic>();
    return PlaceAutocompleteResponse.fromJson(parsed); 
  }
}