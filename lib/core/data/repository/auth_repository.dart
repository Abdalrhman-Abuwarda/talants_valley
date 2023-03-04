import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:talants_valley/core/data/local/sharedController.dart';
import 'package:talants_valley/core/data/network/api/end_points.dart';
import 'package:talants_valley/core/data/network/dioClient.dart';

import '../../model/responseDataModel.dart';
import '../../model/userModel.dart';

class AuthRepository {
  Dio dio = Dio();

  
  //----------------------------------------loginUserRepository-------------------------------

  Future loginUserRepository(
      {required String email, required String password}) async {
    final response = await DioClient(dio).post(Endpoints.userLogin, data: {
      "email": email,
      "password": password,
    });
    debugPrint(response.statusCode.toString());
    debugPrint(response.data);
    SharedPrefController().saveAccessToken(tocken: response.data["data"]["accessToken"]);
    SharedPrefController().saveRefreshToken(tocken: response.data["data"]["refreshToken"]);
    final user = UserModel.fromJson(response.data["data"]["user"]);
    return user;
  }

  
  //---------------------------------------signupUserRepository-------------------------------
  Future<DataModel> signupUserRepository(
      {required String firstName,
      required String lastName,
      required String mobile,
      required String country,
      required String email,
      required String password}) async {
    final response = await DioClient(dio).post(Endpoints.userSignup, data: {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "mobile": mobile,
      "password": password,
      "country": country,
    });
    debugPrint(response.statusCode.toString());
    debugPrint(response.data);
    final data = DataModel.fromJson(response.data["data"]);
    debugPrint("This is user id ${data.user.id}");
    return data;
  }
  
  //-----------------------------forgetPasswordRepository-----------------------

Future<dynamic> forgetPasswordRepository({required String email}) async{
    final response = await DioClient(dio).post(Endpoints.userForgetPassword, data: {
      "email": email,
    });
    debugPrint(response.data);
    final userId = response.data["data"]["_id"];
    debugPrint("This is user id $userId");
    return userId;
}

//-------------------------------checkEmailRrpository---------------------------

Future<dynamic> checkEmailRrpository({required String id, required String verificationCode}) async {
  final response = await DioClient(dio).post(Endpoints.userVerifyPassword, data: {
    "_id": id,
    "verificationCode": verificationCode,
  });
  debugPrint(response.data);
  final recoverToken = response.data["data"]["recoverToken"];
  debugPrint(recoverToken);
  return recoverToken;
}

//------------------------------------------------------------------------------

Future<dynamic> createNewPasswordRepository({required String password, required String recoverToken}) async {
    final response = await DioClient(dio).post(Endpoints.crateNewPassword, data: {
      "password": password,
      "recoverToken": recoverToken,
    });
    debugPrint(response.data);
    return response.data;
}
}
