import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:talants_valley/core/data/network/dioClient.dart';
import 'package:talants_valley/core/model/userModel.dart';

import '../../network/api/endPoints.dart';

class UserManagementRepository{
  Dio dio = Dio();


//--------------------------------getUsers--------------------------------------
Future<dynamic> getUsersRepository() async{
  final response = await DioClient(dio).get(Endpoints.getUsers);
  debugPrint("This is response data ${response.data}");
  debugPrint("This is Lists of users ${response.data["data"]["users"]}");
  final List usersList = response.data["data"]["users"] ;
  debugPrint("${usersList.length}");
  List<UserModel> users = usersList.map((user) => UserModel.fromJson(user)).toList();
  return users;
}

//----------------------------getUserDetailsRepository--------------------------

Future<dynamic> userDetailsRepository(String userId) async {
  final response = await DioClient(dio).get('${Endpoints.getUserDetails}$userId');
  debugPrint("This is response data ${response.data}");
  debugPrint("This is user Details of users in Repository \n ${response.data["data"]["user"]}");
  final UserModel userDetails = UserModel.fromJson(response.data["data"]["user"]);
  debugPrint(userDetails.email);
  return userDetails;
}
}