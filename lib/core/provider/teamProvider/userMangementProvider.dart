import 'package:flutter/material.dart';
import 'package:talants_valley/core/data/repository/team/userMangementRepoaitory.dart';
import 'package:talants_valley/core/model/userModel.dart';

import '../../../routing/navigations.dart';
import '../../../routing/router.dart';
class UserManagementProvider extends ChangeNotifier{


//-------------------------------getUsersProvider-------------------------------

List<UserModel> listUsers = [];
Future<dynamic> getUsers() async{
  final dataResponse = await UserManagementRepository().getUsersRepository();
  debugPrint("This is dataResponse in provider $dataResponse");
  listUsers = dataResponse;
  debugPrint("This is length listUsers ${listUsers.length}");
  notifyListeners();
}

//--------------------------------getUserDetails--------------------------------
late UserModel userDetails;

Future<dynamic> getUserDetails(String userId) async{
  final dataResponse =await UserManagementRepository().userDetailsRepository(userId);
  debugPrint("This is user Details in provider \n $dataResponse");
  userDetails = dataResponse;
  ServiceNavigations.serviceNavi
      .pushNamedAndRemoveUtils(RouteGenerator.getUserDetails);
  notifyListeners();
}
}