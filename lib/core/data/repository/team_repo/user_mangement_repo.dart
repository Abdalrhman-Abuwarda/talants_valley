
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:talants_valley/core/data/network/api/dio_client.dart';
import 'package:talants_valley/core/model/general_model/user_model.dart';

import '../../network/api/end_points.dart';

class UserManagementRepo {
  Dio dio = Dio();

//--------------------------------getUsers--------------------------------------
  Future<dynamic> getUsersRepository({required int offset}) async {
    final response = await DioClient(  ).get("${Endpoints.getUsers}$offset");
    debugPrint("This is response data ${response.data}");
    debugPrint("This is Lists of users ${response.data["data"]["users"]}");
    final List usersList = response.data["data"]["users"];
    debugPrint("${usersList.length}");
    List<UserModel> users =
        usersList.map((user) => UserModel.fromJson(user)).toList();
    return users;
  }

//----------------------------getUserDetailsRepository--------------------------

  Future<dynamic> userDetailsRepository(String userId) async {
    final response =
        await DioClient(  ).get('${Endpoints.getUserDetails}$userId');
    debugPrint("This is response data ${response.data}");
    debugPrint(
        "This is user Details of users in Repository \n ${response.data["data"]["user"]}");
    final UserModel userDetails =
        UserModel.fromJson(response.data["data"]["user"]);
    debugPrint(userDetails.email);
    return userDetails;
  }

//--------------------------------deleteUser------------------------------------
  Future<dynamic> deleteUserRepository(String id) async {
    final response = await DioClient(  ).delete('${Endpoints.deleteUser}$id');
    debugPrint("This is response data ${response.data}");
    debugPrint(
        "This is message of user dalete in Repository \n ${response.data["message"]}");
  }

//--------------------------------blockUser-------------------------------------

  Future<dynamic> blockUserRepository(String id) async {
    final response = await DioClient(  ).put('${Endpoints.blockUser}$id');
    debugPrint("This is response data \n ${response.data}");
    debugPrint(
        "This is message of user Block in Repository \n ${response.data["message"]}");
    debugPrint(
        "This is isBlocked value in Repository \n ${response.data["data"]["isBlocked"]}");
    return response.data["data"]["isBlocked"];
  }

//------------------------------editUserInformation-----------------------------

  Future<dynamic> editUserInformationRepository(String id,
      {required String firstName,
      required String lastName,
      required String email,
      required String mobile,
      required String idNumber,
      required String address1,
      required String address2,
      required String city,
      required String country}) async {
    // print("this is request ${Endpoints.editInformationUser}$id");

    final response =
        await DioClient(  ).put("${Endpoints.editInformationUser}$id", data:
        // {
        //   "firstName": "Asseel11111",
        //   "lastName": "Aseel",
        //   "email": "aseel20@gmail.com",
        //   "mobile": "+97087655555",
        //   "idNumber": "2222222",
        //   "address": {
        //     "address1": "address test 1",
        //     "address2": "address2 test 2",
        //     "city": "Gaza",
        //     "country": "Palestine"
        //   }
        // }

        {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "mobile": mobile,
      "idNumber": idNumber,
      "address": {
        "address1": address1,
        "address2": address2,
        "city": "city",
        "country": country
      }
    }
    );
    debugPrint("This is response data in Repository \n ${response.data}");
  }

//--------------------------------changeRoleRepository--------------------------

Future<dynamic> changeRoleRepository(String id) async {
    final response = await DioClient(  ).put(Endpoints.changeRole);
    debugPrint(
        "This is response of change user in Repository \n $response");
    debugPrint(
        "This is response of change user in Repository \n ${response.data["data"]["role"]}");
    return response.data["data"]["role"];
}

}
