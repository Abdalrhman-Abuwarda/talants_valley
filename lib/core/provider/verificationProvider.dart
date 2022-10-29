import 'package:flutter/material.dart';
import 'package:talants_valley/core/data/repository/verificationRepository.dart';

import '../../routing/navigations.dart';
import '../../routing/router.dart';
import '../../utils/helper.dart';
import '../../utils/validate.dart';
import '../data/local/sharedController.dart';

class VerificationProvider with ChangeNotifier{
  String? validateFunction(String? value) => Validate.validateEmail(value);

//------------------------------sendCodeEmail-----------------------------------

Future<dynamic> sendCodeEmail() async{
  final dateResponse = VerificationRepository().sendCodeEmailRepository();
  print(dateResponse);
  Helpers.showSnackBar(message: "The process done successfully");
  ServiceNavigations.serviceNavi
      .pushNamedAndRemoveUtils(RouteGenerator.verificationEmailPage);
  notifyListeners();
}

//---------------------------verificationEmail----------------------------------

  Future<dynamic> verificationEmail({required String code}) async{
  final dataResponse = VerificationRepository().verificationEmailRepository(code);
  print(dataResponse);
  Helpers.showSnackBar(message: "The process done successfully");
  ServiceNavigations.serviceNavi
      .pushNamedAndRemoveUtils(RouteGenerator.successVerificationEmail);
  notifyListeners();
  }


//---------------------------sendMobileCode-------------------------------------

Future<dynamic> sendCodeMobile() async{
  final dateResponse = VerificationRepository().sendCodeMobileRepository();
  print(dateResponse);
  Helpers.showSnackBar(message: "The process done successfully");
  ServiceNavigations.serviceNavi
      .pushNamedAndRemoveUtils(RouteGenerator.verificationMobilePage);
  notifyListeners();
}


//------------------------------------------------------------------------------

  Future<dynamic> verificationMobile({required String code}) async {
  final dataResponse = VerificationRepository().verificationMobileRepository(code);
  print(dataResponse);
  Helpers.showSnackBar(message: "The process done successfully");
  ServiceNavigations.serviceNavi
      .pushNamedAndRemoveUtils(RouteGenerator.successVerificationMobile);
  notifyListeners();
  }

//------------------------------------------------------------------------------
   onPressedFunction(GlobalKey<FormState> formKye) {
    if (formKye.currentState!.validate()){
      ServiceNavigations.serviceNavi.pushNamedAndRemoveUtils(RouteGenerator.homePage);
    }
  }

//------------------------------------------------------------------------------
   buttonVerificationFunction(GlobalKey<FormState> formKye){
    SharedPrefController().getData().user.verifiedMobile && SharedPrefController().getData().user.verifiedEmail == true ? onPressedFunction(formKye) : null;

  }
}