import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:talants_valley/core/data/network/api/end_points.dart';
import 'package:talants_valley/core/data/network/api/dio_client.dart';
import 'package:talants_valley/core/model/general_model/user_model.dart';

import '../../../../locator.dart';

class VerificationRepo {
  final DioClient _dioClient = locator<DioClient>();

  //---------------------sendCodeEmailRepository-----------------------

  Future<Response> sendCodeEmailRepository() async {
    final Response response = await _dioClient.post(Endpoints.sendCodeEmail);
    return response.data;
  }

//------------------------verificationEmailRepository---------------------------

  Future<Response> verificationEmailRepository(String code) async {
    final Response response =
        await _dioClient.post(Endpoints.verificationEmail, data: {
      "verificationCode": code,
    });

    return response.data;
  }

//-----------------------sendCodeMobileRepository-------------------------------

  Future<Response> sendCodeMobileRepository() async {
    final Response response = await _dioClient.post(Endpoints.sendCodeMobile);
    return response.data;
  }

//---------------------verificationMobileRepository-----------------------------
  Future<Response> verificationMobileRepository(String code) async {
    final response =
        await _dioClient.post(Endpoints.verificationMobile, data: {
      "verificationCode": code,
    });
    debugPrint(response.data);
    return response.data;
  }

//-----------------------------getUserRepository--------------------------------

 Future<UserModel> getUserRepo() async {
    final response = await DioClient().get(Endpoints.getUserData);
    final user = UserModel.fromJson(response.data["data"]);
    return user;
  }

//--------------------------verificationIDRepository----------------------------

  Future<Response> verificationIDRepository(
      File file, String idNumber, String idDocumentType) async {
    final formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(file.path),
      "idNumber": idNumber,
      "idDocumentType": idDocumentType,
    });

    final response =
        await _dioClient.post(Endpoints.verificationID, data: formData);
    return response.data;
  }

//------------------------verificationAddressRepository-------------------------

  Future<dynamic> verificationAddressRepo(
      File file,
      String address1,
      String address2,
      String city,
      String addressDocumentType,
      String country,
      String? otherDocumentType) async {
    final formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(file.path),
      "address1": address1,
      "address2": address2,
      "city": city,
      "addressDocumentType": addressDocumentType,
      "country": country,
      "otherDocumentType": otherDocumentType,
    });

    final response =
        await _dioClient.post(Endpoints.verificationAddress, data: formData);
    return response.data;
  }
}
