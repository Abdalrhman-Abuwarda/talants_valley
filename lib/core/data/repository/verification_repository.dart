import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:talants_valley/core/data/network/api/end_points.dart';
import 'package:talants_valley/core/data/network/dioClient.dart';
import 'package:talants_valley/core/model/userModel.dart';


class VerificationRepository{
  Dio dio = Dio();


  //---------------------sendCodeEmailRepository-----------------------

sendCodeEmailRepository() async{
  final Response response= await DioClient(dio).post(Endpoints.sendCodeEmail);
  return response.data;
}


//------------------------verificationEmailRepository---------------------------
verificationEmailRepository(String code) async {
  final Response response = await DioClient(dio).post(Endpoints.verificationEmail, data: {
    "verificationCode": code,
  });

  return response.data;
}

//-----------------------sendCodeMobileRepository-------------------------------

sendCodeMobileRepository() async{
  final Response response = await DioClient(dio).post(Endpoints.sendCodeMobile);
  return response.data;
}


//---------------------verificationMobileRepository-----------------------------
verificationMobileRepository(String code) async {
  final response = await DioClient(dio).post(Endpoints.verificationMobile, data: {
    "verificationCode": code,
  });
  debugPrint(response.data);
  return response.data;
}


//-----------------------------getUserRepository--------------------------------

getUserRepository() async{
  final response = await DioClient(dio).get(Endpoints.getUserData);
  // debugPrint(response.data["data"]);
  final user = UserModel.fromJson(response.data["data"]);
  return user;
}

//--------------------------verificationIDRepository----------------------------

Future<dynamic> verificationIDRepository(File file, String idNumber,String idDocumentType) async {
  final formData = FormData.fromMap(
      {
        "file": await MultipartFile.fromFile(file.path),
        "idNumber": idNumber,
        "idDocumentType": idDocumentType,
      }
  );

  final response = await DioClient(dio).post(Endpoints.verificationID, data: formData);
    // debugPrint(response.data);
  debugPrint("This is the response of verification ID ${response.data}");
    return response.data;
}


//------------------------verificationAddressRepository-------------------------

Future<dynamic> verificationAddressRepository(File file, String address1,String address2, String city, String addressDocumentType, String country, String? otherDocumentType) async {
  final formData = FormData.fromMap(
      {
        "file": await MultipartFile.fromFile(file.path),
        "address1": address1,
        "address2": address2,
        "city": city,
        "addressDocumentType": addressDocumentType,
        "country": country,
        "otherDocumentType": otherDocumentType,
      }
  );

  final response = await DioClient(dio).post(Endpoints.verificationAddress, data: formData);
    // debugPrint(response.data);
  debugPrint("This is the response of verification ID ${response.data}");
    return response.data;
}

}