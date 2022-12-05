import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/core/data/local/sharedController.dart';
import 'package:talants_valley/core/data/repository/authRepository.dart';
import 'package:talants_valley/core/model/responseDataModel.dart';
import 'package:talants_valley/core/provider/verificationProvider.dart';

import '../../routing/navigations.dart';
import '../../routing/router.dart';
import '../../utils/helper.dart';

class AuthProvider with ChangeNotifier{
bool isPassword = true;
String? postCode;
Duration duration = const Duration();

 // maxSeconds = 120;
int seconds = 59;
int minutes = 1;
Timer? timer;
 int counterMinutes = 0;
 bool timerCansele = false;

 twoDigits(int n) => n.toString().padLeft(2, "0");
// final minute = twoDigits(const Duration().inMinutes.remainder(60));
void startTimer() {
  timer = Timer.periodic(const Duration(seconds: 1), (_) {
    if(seconds != 0 ) {
        seconds--;
      notifyListeners();
      }else if(seconds == 0 && minutes != 0){
      if (minutes != 0 ){
        minutes--;
        seconds += 60;
      }
    }
    else {
      timer?.cancel();
      notifyListeners();
    }
  });
}
// void savePsotCode(String code){}

void suffixPressed(){
  isPassword = !isPassword;
  notifyListeners();
}

//-----------------------------LoginUser----------------------------------------

Future<dynamic> LoginUser(String email, String password) async{
  debugPrint("This is in authProvider before the function repository");
  final dataResponse = await AuthRepository().loginUserRepository(email: email, password: password);
  debugPrint("This is in authProvider after the function repository");
 // final context= ServiceNavigations.serviceNavi.navKey.currentContext;
 //      Provider.of<VerificationProvider>(context!,listen: false).getUser();
  debugPrint("This is in authProvider before the SharedPreferance");
  SharedPrefController().saveData(user: dataResponse);
  debugPrint("This is in authProvider after the SharedPreferance");
  debugPrint(dataResponse.email);
  Helpers.showSnackBar(message: "login successfully");
  ServiceNavigations.serviceNavi
      .pushNamedAndRemoveUtils(RouteGenerator.mainVerificationPage);
  // notifyListeners();
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
  Helpers.showSnackBar(message: "Signup successfully");
  ServiceNavigations.serviceNavi
      .pushNamedAndRemoveUtils(RouteGenerator.signInPage);
  notifyListeners();
}


//-------------------------------forgetPassword---------------------------------

Future<dynamic> forgetPassword({required String email}) async{
  final dataResponse = await AuthRepository().forgetPasswordRepository(email: email);
  SharedPrefController().saveId(id: dataResponse.toString());
  Helpers.showSnackBar(message: "Send code successfully");
  ServiceNavigations.serviceNavi
      .pushNamedWidget(RouteGenerator.checkEmailPage);
  notifyListeners();
}

//---------------------------resendCode-----------------------------------------

  Future<dynamic> resendCode({required String email}) async{
    final dataResponse = await AuthRepository().forgetPasswordRepository(email: email);
    SharedPrefController().saveId(id: dataResponse.toString());
    seconds = 60;
    minutes = 1;
    debugPrint("This is before");
    startTimer();
    debugPrint("This is after");
    Helpers.showSnackBar(message: "resend code successfully");
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

//------------------------------------------------------------------------------

Future<dynamic> logout() async {
  SharedPrefController().logout();
  ServiceNavigations.serviceNavi
      .pushNamedAndRemoveUtils(RouteGenerator.signInPage);
}

}