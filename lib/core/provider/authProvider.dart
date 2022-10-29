import 'package:flutter/material.dart';
import 'package:talants_valley/core/data/local/sharedController.dart';
import 'package:talants_valley/core/data/repository/authRepository.dart';
import 'package:talants_valley/core/model/responseDataModel.dart';

import '../../routing/navigations.dart';
import '../../routing/router.dart';
import '../../utils/helper.dart';

class AuthProvider with ChangeNotifier{
bool isPassword = true;
void suffixPressed(){
  isPassword = !isPassword;
  notifyListeners();
}

//-----------------------------LoginUser----------------------------------------
Future<dynamic> LoginUser(String email, String password) async{
  final dataResponse = await AuthRepository().loginUserRepository(email: email, password: password);
  SharedPrefController().saveData(data: dataResponse);
  print(dataResponse.user.email);
  // Helpers.showSnackBar(message: "login successfully");
  ServiceNavigations.serviceNavi
      .pushNamedAndRemoveUtils(RouteGenerator.mainVerificationPage);
  notifyListeners();
}


//--------------------------SignupUser------------------------------------------
Future<dynamic> SignupUser(
    { required String firstName,
      required String lastName,
      required String mobile,
      required String country,
      required String email,
      required String password}) async{
  final dataResponse = await AuthRepository().signupUserRepository(firstName: firstName, lastName: lastName, mobile: mobile, country: country, email: email, password: password);
  SharedPrefController().saveData(data: dataResponse);
  print(dataResponse.user.email);
  Helpers.showSnackBar(message: "Signup successfully");
  ServiceNavigations.serviceNavi
      .pushNamedAndRemoveUtils(RouteGenerator.mainVerificationPage);
  notifyListeners();
}


//-------------------------------forgetPassword---------------------------------

Future<dynamic> forgetPassword({required String email}) async{
  final dataResponse = await AuthRepository().forgetPasswordRepository(email: email);
  SharedPrefController().saveId(id: dataResponse.toString());
  Helpers.showSnackBar(message: "Signup successfully");
  ServiceNavigations.serviceNavi
      .pushNamedWidget(RouteGenerator.checkEmailPage);
  notifyListeners();
}

//---------------------------------checkEmailPassword---------------------------

Future<dynamic> checkEmailPassword({ required String verificationCode}) async {
  final dataResponse = await AuthRepository().checkEmailRrpository(id: SharedPrefController().getId(), verificationCode: verificationCode);
  SharedPrefController().saveRecoverToken(recoverToken: dataResponse);
  Helpers.showSnackBar(message: "The process done successfully");
  ServiceNavigations.serviceNavi
      .pushNamedWidget(RouteGenerator.createNewPassword);
  notifyListeners();
}

//-------------------------------createNewPassword------------------------------

Future<dynamic> createNewPassword({required String password}) async{
  final dataResponse = await AuthRepository().createNewPasswordRepository(password: password, recoverToken: SharedPrefController().getRecoverToken());
  Helpers.showSnackBar(message: dataResponse["message"]);
  ServiceNavigations.serviceNavi
      .pushNamedWidget(RouteGenerator.successResetPage);
  notifyListeners();
}
}