import 'package:dio/dio.dart';

import 'package:talants_valley/core/data/local/shared_controller.dart';
import 'package:talants_valley/core/data/network/api/end_points.dart';
import 'package:talants_valley/core/data/network/api/dio_client.dart';


import '../../../model/general_model/user-data_model.dart';
import '../../../model/general_model/user_model.dart';

class AuthRepo {
  Dio dio = Dio();


  //----------------------------------------loginUserRepository-------------------------------

  Future loginUserRepository(
      {required String email, required String password}) async {
    final response = await DioClient().post(Endpoints.userLogin, data: {
      "email": email,
      "password": password,
    });
    SharedPrefController().saveAccessToken(token: response.data["data"]["accessToken"]);
    SharedPrefController().saveRefreshToken(token: response.data["data"]["refreshToken"]);
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
    final response = await DioClient().post(Endpoints.userSignup, data: {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "mobile": mobile,
      "password": password,
      "country": country,
    });
    final data = DataModel.fromJson(response.data["data"]);
    return data;
  }

  //-----------------------------forgetPasswordRepository-----------------------

Future<dynamic> forgetPasswordRepository({required String email}) async{
    final response = await DioClient( ).post(Endpoints.userForgetPassword, data: {
      "email": email,
    });
    final userId = response.data["data"]["_id"];
    return userId;
}

//-------------------------------checkEmailRrpository---------------------------

Future<dynamic> checkEmailRrpository({required String id, required String verificationCode}) async {
  final response = await DioClient( ).post(Endpoints.userVerifyPassword, data: {
    "_id": id,
    "verificationCode": verificationCode,
  });
  final recoverToken = response.data["data"]["recoverToken"];
  return recoverToken;
}

//------------------------------------------------------------------------------

Future<dynamic> createNewPasswordRepository({required String password, required String recoverToken}) async {
    final response = await DioClient( ).post(Endpoints.crateNewPassword, data: {
      "password": password,
      "recoverToken": recoverToken,
    });
    return response.data;
}
}
