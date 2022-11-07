import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/core/data/network/api/endPoints.dart';
import 'package:talants_valley/core/data/network/dioClient.dart';
import 'package:talants_valley/core/model/userModel.dart';
import 'package:talants_valley/core/provider/verificationProvider.dart';

import '../../../routing/navigations.dart';
import '../../provider/authProvider.dart';

class VerificationRepository{
  Dio dio = Dio();
  var provider = Provider.of<VerificationProvider>(
      ServiceNavigations.serviceNavi.navKey.currentContext!,
      listen: false);

  //---------------------sendCodeEmailRepositoryepository-----------------------

Future<dynamic> sendCodeEmailRepository() async{
  final response= await DioClient(dio).post(Endpoints.sendCodeEmail);
  print(response.data);
  return response.data;
}


//------------------------verificationEmailRepository---------------------------
Future<dynamic> verificationEmailRepository(String code) async {
  final response = await DioClient(dio).post(Endpoints.verificationEmail, data: {
    "verificationCode": code,
  });

  print(response.data);
  return response.data;
}

//-----------------------sendCodeMobileRepository-------------------------------

Future<dynamic> sendCodeMobileRepository() async{
  final response = await DioClient(dio).post(Endpoints.sendCodeMobile);
  print(response.data);
  return response.data;
}


//---------------------verificationMobileRepository-----------------------------
Future<dynamic> verificationMobileRepository(String code) async {
  final response = await DioClient(dio).post(Endpoints.verificationMobile, data: {
    "verificationCode": code,
  });
  print(response.data);
  return response.data;
}


//-----------------------------getUserRepository--------------------------------

Future<UserModel> getUserRepository() async{
  final response = await DioClient(dio).get(Endpoints.getUserData);
  print(response.data["data"]);
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
    print("This is the response of verification ID ${response.data}");
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
    print("This is the response of verification ID ${response.data}");
    return response.data;
}

}