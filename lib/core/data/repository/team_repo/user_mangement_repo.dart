import 'package:flutter/material.dart';
import 'package:talants_valley/core/data/network/api/dio_client.dart';
import 'package:talants_valley/core/model/general_model/user_model.dart';

import '../../../../locator.dart';
import '../../network/api/end_points.dart';

class UserManagementRepo {
  final DioClient  _dioClient =  locator<DioClient>();


//--------------------------------getUsers--------------------------------------
  Future<dynamic> getUsersRepository({required int offset}) async {
    final response = await _dioClient.get("${Endpoints.getUsers}$offset");
    final List usersList = response.data["data"]["users"];
    debugPrint("${usersList.length}");
    List<UserModel> users =
        usersList.map((user) => UserModel.fromJson(user)).toList();
    return users;
  }

//----------------------------getUserDetailsRepository--------------------------

  Future<UserModel> userDetailsRepository(String userId) async {
    final response =
        await _dioClient.get('${Endpoints.getUserDetails}$userId');
    final UserModel userDetails =
        UserModel.fromJson(response.data["data"]["user"]);
    debugPrint(userDetails.email);
    return userDetails;
  }

//--------------------------------deleteUser------------------------------------
  Future<dynamic> deleteUserRepository(String id) async {
     await _dioClient.delete('${Endpoints.deleteUser}$id');
    }

//--------------------------------blockUser-------------------------------------

  Future<dynamic> blockUserRepository(String id) async {
    final response = await _dioClient.put('${Endpoints.blockUser}$id');
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

        await _dioClient.put("${Endpoints.editInformationUser}$id", data:
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
  }

//--------------------------------changeRoleRepository--------------------------

Future<dynamic> changeRoleRepository(String id) async {
    final response = await _dioClient.put(Endpoints.changeRole);
    return response.data["data"]["role"];
}

}
