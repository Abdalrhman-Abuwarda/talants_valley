
import 'package:talants_valley/core/data/local/shared_controller.dart';
import 'package:talants_valley/core/data/network/api/end_points.dart';
import 'package:talants_valley/core/data/network/api/dio_client.dart';


import '../../../../locator.dart';
import '../../../model/general_model/user-data_model.dart';
import '../../../model/general_model/user_model.dart';

class AuthRepo {

  final DioClient  _dioClient =  locator<DioClient>();


  //----------------------------------------loginUserRepository-------------------------------

  Future<UserModel> loginUserRepo(
      {required String email, required String password}) async {
    final response = await _dioClient.post(Endpoints.userLogin, data: {
      "email": email,
      "password": password,
    });
    SharedPrefController().saveAccessToken(token: response.data["data"]["accessToken"]);
    SharedPrefController().saveRefreshToken(token: response.data["data"]["refreshToken"]);
    final user = UserModel.fromJson(response.data["data"]["user"]);
    return user;
  }


  //---------------------------------------signupUserRepository-------------------------------
  Future<DataModel> signupUserRepo(
      {required String firstName,
      required String lastName,
      required String mobile,
      required String country,
      required String email,
      required String password}) async {
    final response = await _dioClient.post(Endpoints.userSignup, data: {
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

Future<dynamic> forgetPasswordRepo({required String email}) async{
    final response = await _dioClient.post(Endpoints.userForgetPassword, data: {
      "email": email,
    });
    final userId = response.data["data"]["_id"];
    return userId;
}

//-------------------------------checkEmailRepo---------------------------

Future<dynamic> checkEmailRepo({required String id, required String verificationCode}) async {
  final response = await _dioClient.post(Endpoints.userVerifyPassword, data: {
    "_id": id,
    "verificationCode": verificationCode,
  });
  final recoverToken = response.data["data"]["recoverToken"];
  return recoverToken;
}

//------------------------------------------------------------------------------

Future<dynamic> createNewPasswordRepo({required String password, required String recoverToken}) async {
    final response = await _dioClient.post(Endpoints.crateNewPassword, data: {
      "password": password,
      "recoverToken": recoverToken,
    });
    return response.data;
}

Future<dynamic> refreshTokenRepo({required String token}) async {
    final response = await _dioClient.post(Endpoints.refreshToken, data: {
      "refreshToken" : token
    });
    SharedPrefController().saveAccessToken(token: response.data["data"]["accessToken"]);
    SharedPrefController().saveRefreshToken(token: response.data["data"]["refreshToken"]);
}

}
