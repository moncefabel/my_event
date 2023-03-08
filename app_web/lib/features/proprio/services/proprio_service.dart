// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:app_web/constants/error_handling.dart';
import 'package:app_web/constants/utils.dart';
import 'package:app_web/models/etb.dart';
import 'package:app_web/providers/proprio_provider.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../../constants/app_colors.dart';

class ProprioService{
  void addEtb({
    required BuildContext context,
    required type, 
    required lieu, 
    required heureOuverture,
    required heureFermeture,
    required capaciteMax,
    required capaciteMin,
    required List<XFile> images,
    required nameEtb,
    required prix
  }) async{
    final proprioProvider = Provider.of<ProprioProvider>(context, listen: false);

    try{
      final cloudinary = CloudinaryPublic("doruex4vc",'rja5gjzg');
      List<String> imageUrls = [];

      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: nameEtb),
        );
        imageUrls.add(res.secureUrl);
      }

      Etablissement newEtb = Etablissement(
        userId: proprioProvider.proprio.id, 
        id: '', 
        type: type, 
        lieu: lieu, 
        heureOuverture: heureOuverture, 
        heureFermeture: heureFermeture, 
        capaciteMax: capaciteMax, 
        capaciteMin: capaciteMin, 
        nameEtb: nameEtb,
        images: imageUrls,
        prix: prix);
      http.Response res = await http.post(
        Uri.parse('$uri/apiEtb/add'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'jwt': proprioProvider.proprio.token,
        },
        body: newEtb.toJson(),
      );
      print(res.body);
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Etablissement ajouté avec succés');
        });
      
    }catch(e){
      showSnackBar(context, e.toString());
    }
  }

  Future<List<Etablissement>> fetchAllEtb (BuildContext context) async{
    final proprioProvider = Provider.of<ProprioProvider>(context, listen: false);

    List<Etablissement> etbs = [];
    try{
      http.Response res = await http.get(
        Uri.parse('$uri/apiEtb/allEtb'),
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
            etbs.add(
              Etablissement.fromJson(
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
    return etbs;
  }
}