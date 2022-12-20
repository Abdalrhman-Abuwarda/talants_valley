import 'package:country_phone_code_picker/constants/country_codes.dart';
import 'package:flutter/material.dart';
import 'package:talants_valley/core/data/repository/team/userMangementRepoaitory.dart';
import 'package:talants_valley/core/model/userModel.dart';

import '../../../routing/navigations.dart';
import '../../../routing/router.dart';
import '../../../utils/helper.dart';

class UserManagementProvider extends ChangeNotifier {

  String? postCode;
  final List<String> countriesName =
      countries.map((country) => country.name).toList();
  String? selectedCountryAddress;

  void onChangeCountryAddress(Object? value) {
    selectedCountryAddress = value as String;
    notifyListeners();
  }

//-------------------------------getUsersProvider-------------------------------

  List<UserModel> listUsers = [];

  Future<dynamic> getUsers() async {
    final dataResponse = await UserManagementRepository().getUsersRepository();
    debugPrint("This is dataResponse in provider $dataResponse");
    listUsers = dataResponse;
    debugPrint("This is length listUsers ${listUsers.length}");
    notifyListeners();
  }

//--------------------------------getUserDetails--------------------------------
  UserModel? userDetails;

  Future<dynamic> getUserDetails(String userId) async {
    final dataResponse =
        await UserManagementRepository().userDetailsRepository(userId);
    debugPrint("This is user Details in provider \n $dataResponse");
    userDetails = dataResponse;
    ServiceNavigations.serviceNavi
        .pushNamedAndRemoveUtils(RouteGenerator.getUserDetails);
    notifyListeners();
  }

//----------------------------------deleteUser----------------------------------

  Future<dynamic> deleteUser(String userId) async {
    final dataResponse =
        await UserManagementRepository().deleteUserRepository(userId);
    debugPrint("This is response of delete User in provider \n $dataResponse");
    listUsers.removeWhere((element) => element.id == userId);
    Helpers.showSnackBar(message: "Delete User successfully");
    notifyListeners();
  }

//--------------------------------blockUser-------------------------------------

  Future<dynamic> blockUser(String userId) async {
    final dataResponse =
        await UserManagementRepository().blockUserRepository(userId);
    debugPrint("This is response of delete User in provider \n $dataResponse");
    debugPrint("This is dataResponse in provider $dataResponse");
    int index = listUsers.indexWhere((item) => item.id == userId);
    listUsers[index].isBlocked = dataResponse;
    debugPrint(
        "This is value of user block ${listUsers[index].isBlocked.toString()}");
    Helpers.showSnackBar(message: "Block User successfully");
    notifyListeners();
  }

//--------------------------------onTapUserEdit--------------------------------

  UserModel? selectedUser;

  void Function()? onTapEditUser(String userId) {
    int index = listUsers.indexWhere((item) => item.id == userId);
    selectedUser = listUsers[index];
    ServiceNavigations.serviceNavi
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
    int index = listUsers.indexWhere((item) => item.id == userId);
    listUsers[index].role = dataResponse;
    userDetails!.role = dataResponse;
    notifyListeners();
}

}
