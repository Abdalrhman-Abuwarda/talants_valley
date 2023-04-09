import 'package:country_phone_code_picker/constants/country_codes.dart';
import 'package:flutter/material.dart';
import 'package:talants_valley/core/data/repository/team/user_mangement_repoaitory.dart';
import 'package:talants_valley/core/model/general_model/user_model.dart';

import '../../../routing/navigations.dart';
import '../../../routing/router.dart';
import '../../../utils/helper.dart';

class UserManagementProvider extends ChangeNotifier {

  String? postCode;
  final List<String> countriesName =
      countries.map((country) => country.name).toList();
  String? selectedCountryAddress;
  int offsetUsers = 0;


//------------------------------------------------------------------------------

  void onChangeCountryAddress(Object? value) {
    selectedCountryAddress = value as String;
    notifyListeners();
  }

//-------------------------------getUsersProvider-------------------------------

  List<UserModel> users = [];

  Future<dynamic> getUsers() async {
    final dataResponse = await UserManagementRepository().getUsersRepository(offset: offsetUsers);
    users = dataResponse;
    offsetUsers += 20;
    notifyListeners();
  }

//------------------------------------------------------------------------------
  List<UserModel> otherUsers = [];
getOtherUsers() async {
  final dataResponse = await UserManagementRepository().getUsersRepository(offset: offsetUsers);
  otherUsers = dataResponse;
  offsetUsers += 20;
  users.addAll(otherUsers);
  notifyListeners();
}
//--------------------------------getUserDetails--------------------------------

  UserModel? userDetails;

  Future<dynamic> getUserDetails(String userId) async {
    final dataResponse =
        await UserManagementRepository().userDetailsRepository(userId);
    userDetails = dataResponse;
    ServiceNavigation.serviceNavi
        .pushNamedAndRemoveUtils(RouteGenerator.getUserDetails);
    notifyListeners();
  }

//----------------------------------deleteUser----------------------------------

  Future<dynamic> deleteUser(String userId) async {
    final dataResponse =
        await UserManagementRepository().deleteUserRepository(userId);
    users.removeWhere((element) => element.id == userId);
    Helpers.showSnackBar(message: "Delete User successfully");
    notifyListeners();
  }

//--------------------------------blockUser-------------------------------------

  Future<dynamic> blockUser(String userId) async {
    final dataResponse =
        await UserManagementRepository().blockUserRepository(userId);
    int index = users.indexWhere((item) => item.id == userId);
    users[index].isBlocked = dataResponse;
    Helpers.showSnackBar(message: "Block User successfully");
    notifyListeners();
  }

//--------------------------------onTapUserEdit--------------------------------

  UserModel? selectedUser;

  void Function()? onTapEditUser(String userId) {
    int index = users.indexWhere((item) => item.id == userId);
    selectedUser = users[index];
    ServiceNavigation.serviceNavi
        .pushNamedAndRemoveUtils(RouteGenerator.editUserInformationPage);
    notifyListeners();
    return null;
  }

  //------------------------------editUserInformation---------------------------
  Future<dynamic> editUserInformation(
      {required String userId,
     required String fistName,
     required String lastName,
     required String email,
     required String mobile,
     required String idNumber,
     required String address1,
     required String address2,
     required String city,
     required String country}) async {
    final dataResponse = await UserManagementRepository()
        .editUserInformationRepository(userId,
            firstName: fistName,
            lastName: lastName,
            email: email,
            mobile: mobile,
            idNumber: idNumber,
            address1: address1,
            address2: address2,
            city: city,
            country: country);

    debugPrint("This is response of edit User in provider \n $dataResponse");
    notifyListeners();
  }

  //-----------------------------changeRole-------------------------------------

Future<dynamic> changeRole(String userId) async {
    final dataResponse = await UserManagementRepository().changeRoleRepository(userId);
    int index = users.indexWhere((item) => item.id == userId);
    users[index].role = dataResponse;
    userDetails!.role = dataResponse;
    notifyListeners();
}

}
