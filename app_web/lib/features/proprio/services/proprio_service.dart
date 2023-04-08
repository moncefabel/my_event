// ignore_for_file: avoid_print
import 'dart:convert';
import 'dart:math';
import 'package:app_web/constants/error_handling.dart';
import 'package:app_web/constants/utils.dart';
import 'package:app_web/models/etb.dart';
import 'package:app_web/models/proprio.dart';
import 'package:app_web/providers/proprio_provider.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../../constants/app_colors.dart';

class ProprioService {
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
    required prix,
    required description
  }) async {
    final proprioProvider =
        Provider.of<ProprioProvider>(context, listen: false);

    try {
      final cloudinary = CloudinaryPublic("doruex4vc", 'rja5gjzg');
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
          prix: prix,
          description: description);
      http.Response res = await http.post(
        Uri.parse('$uri/apiEtb/add'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'jwt': proprioProvider.proprio.token,
        },
        body: newEtb.toJson(),
      );
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context, 'Etablissement ajouté avec succés');
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<List<Etablissement>> fetchAllEtb(BuildContext context) async {
    final proprioProvider =
        Provider.of<ProprioProvider>(context, listen: false);

    List<Etablissement> etbs = [];
    try {
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
          });
    } catch (e) {
      // showSnackBar(context, e.toString());
    }
    return etbs;
  }

  void deleteEtb(
      {required BuildContext context,
      required Etablissement etb,
      required VoidCallback onSuccess}) async {
    final proprioProvider =
        Provider.of<ProprioProvider>(context, listen: false);

    try {
      http.Response res = await http.post(Uri.parse('$uri/apiEtb/delete'),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'jwt': proprioProvider.proprio.token,
          },
          body: jsonEncode({'id': etb.id}));
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          onSuccess();
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void updateEtb(
      {required BuildContext context,
      required type,
      required lieu,
      required heureOuverture,
      required heureFermeture,
      required capaciteMax,
      required capaciteMin,
      required List<String> images,
      required nameEtb,
      required prix,
      required id,
      required userId,
      required description}) async {
    final proprioProvider =
        Provider.of<ProprioProvider>(context, listen: false);

    try {
      final cloudinary = CloudinaryPublic("doruex4vc", 'rja5gjzg');
      List<String> imageUrls = [];

      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i], folder: nameEtb),
        );
        imageUrls.add(res.secureUrl);
      }

      Etablissement newEtb = Etablissement(
          id: id,
          type: type,
          lieu: lieu,
          heureOuverture: heureOuverture,
          heureFermeture: heureFermeture,
          capaciteMax: capaciteMax,
          capaciteMin: capaciteMin,
          nameEtb: nameEtb,
          images: imageUrls,
          prix: prix,
          userId: userId,
          description: description);
      http.Response res = await http.put(
        Uri.parse('$uri/apiEtb/update'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'jwt': proprioProvider.proprio.token,
        },
        body: newEtb.toJson(),
      );
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context, 'Etablissement modifié avec succés');
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void updateProprio({
    required BuildContext context,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String email,
  }) async {
    try {
      Proprio proprio = Proprio(
          id: '',
          email: email,
          firstName: firstName,
          password: '',
          lastName: lastName,
          token: '',
          phoneNumber: phoneNumber);
      final proprioProvider =
          Provider.of<ProprioProvider>(context, listen: false);
      http.Response res = await http.put(Uri.parse('$uri/api/update'),
          body: proprio.toJson(),
          headers: <String, String>{
            'Content-type': 'application/json; charset=UTF-8',
            'jwt': proprioProvider.proprio.token,
            'id': proprioProvider.proprio.id
          });
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Account created successfully');
        },
      );
    } catch (error) {
      showSnackBar(context, e.toString());
    }
  }
}