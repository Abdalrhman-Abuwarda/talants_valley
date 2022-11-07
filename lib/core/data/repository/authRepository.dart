import 'package:dio/dio.dart';
import 'package:talants_valley/core/data/local/sharedController.dart';
import 'package:talants_valley/core/data/network/api/endPoints.dart';
import 'package:talants_valley/core/data/network/dioClient.dart';

import '../../model/responseDataModel.dart';
import '../../model/userModel.dart';

class AuthRepository {
  Dio dio = Dio();

  
  //----------------------------------------loginUserRepository-------------------------------

  Future<UserModel> loginUserRepository(
      {required String email, required String password}) async {
    final response = await DioClient(dio).post(Endpoints.userLogin, data: {
      "email": email,
      "password": password,
    });
    print(response.statusCode);
    print(response.data);
    SharedPrefController().saveAccessToken(tocken: response.data["data"]["accessToken"]);
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
    print(response.statusCode);
    print(response.data);
    final data = DataModel.fromJson(response.data["data"]);
    print("This is user id ${data.user.id}");
    return data;
  }
  
  //-----------------------------forgetPasswordRepository-----------------------

Future<dynamic> forgetPasswordRepository({required String email}) async{
    final response = await DioClient(dio).post(Endpoints.userForgetPassword, data: {
      "email": email,
    });
    print(response.data);
    final userId = response.data["data"]["_id"];
    print("This is user id $userId");
    return userId;
}

//-------------------------------checkEmailRrpository---------------------------

Future<dynamic> checkEmailRrpository({required String id, required String verificationCode}) async {
  final response = await DioClient(dio).post(Endpoints.userVerifyPassword, data: {
    "_id": id,
    "verificationCode": verificationCode,
  });
  print(response.data);
  final recoverToken = response.data["data"]["recoverToken"];
  print(recoverToken);
  return recoverToken;
}

//------------------------------------------------------------------------------

Future<dynamic> createNewPasswordRepository({required String password, required String recoverToken}) async {
    final response = await DioClient(dio).post(Endpoints.crateNewPassword, data: {
      "password": password,
      "recoverToken": recoverToken,
    });
    print(response.data);
    return response.data;
}
}
