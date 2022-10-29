import 'package:dio/dio.dart';
import 'package:talants_valley/core/data/network/api/endPoints.dart';
import 'package:talants_valley/core/data/network/dioClient.dart';

class VerificationRepository{
  Dio dio = Dio();

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


//------------------------------------------------------------------------------


}