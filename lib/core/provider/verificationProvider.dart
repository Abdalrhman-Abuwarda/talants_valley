import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:talants_valley/core/data/repository/verificationRepository.dart';
import 'package:talants_valley/core/model/userModel.dart';

import '../../routing/navigations.dart';
import '../../routing/router.dart';
import '../../utils/helper.dart';
import '../../utils/validate.dart';
import '../data/local/sharedController.dart';

class VerificationProvider with ChangeNotifier{
  String? validateFunction(String? value) => Validate.validateEmail(value);
  File? imageIDFile;
  File? imageAddressFile;


//------------------------------sendCodeEmail-----------------------------------

Future<dynamic> sendCodeEmail() async{
  final dateResponse = VerificationRepository().sendCodeEmailRepository();
  debugPrint(dateResponse.toString());
  // Helpers.showSnackBar(message: "The process done successfully");
  ServiceNavigations.serviceNavi
      .pushNamedAndRemoveUtils(RouteGenerator.verificationEmailPage);
  notifyListeners();
}

//---------------------------verificationEmail----------------------------------

  Future<dynamic> verificationEmail({required String code}) async{
  final dataResponse = VerificationRepository().verificationEmailRepository(code);
  debugPrint(dataResponse.toString());
  Helpers.showSnackBar(message: "The process done successfully");
  ServiceNavigations.serviceNavi
      .pushNamedAndRemoveUtils(RouteGenerator.successVerificationEmail);
  notifyListeners();
  }


//---------------------------sendMobileCode-------------------------------------

Future<dynamic> sendCodeMobile() async{
  final dateResponse = VerificationRepository().sendCodeMobileRepository();
  debugPrint(dateResponse.toString());
  // Helpers.showSnackBar(message: "The process done successfully");
  ServiceNavigations.serviceNavi
      .pushNamedAndRemoveUtils(RouteGenerator.verificationMobilePage);
  notifyListeners();
}


//--------------------------verificationMobile----------------------------------

  Future<dynamic> verificationMobile({required String code}) async {
  final dataResponse = VerificationRepository().verificationMobileRepository(code);
  debugPrint(dataResponse.toString());
  Helpers.showSnackBar(message: "The process done successfully");
  ServiceNavigations.serviceNavi
      .pushNamedAndRemoveUtils(RouteGenerator.successVerificationMobile);
  notifyListeners();
  }

//------------------------------------------------------------------------------

  Future<dynamic> getUser() async {
  final dataResponse = await VerificationRepository().getUserRepository();
  debugPrint("This is the data of user\n $dataResponse");
  SharedPrefController().saveData(user: dataResponse);
  ServiceNavigations.serviceNavi
      .pushNamedAndRemoveUtils(RouteGenerator.mainVerificationPage);
  notifyListeners();
  }



//------------------------------------------------------------------------------
  Function()? mainOnPressedFunction() =>
      ServiceNavigations.serviceNavi.pushNamedAndRemoveUtils(RouteGenerator.homePage);

  Function()? idVerifiedPressedFunction() =>
      ServiceNavigations.serviceNavi
          .pushNamedAndRemoveUtils(RouteGenerator.verificationIDPage);

  Function()? addressVerifiedPressedFunction() =>
      ServiceNavigations.serviceNavi
          .pushNamedAndRemoveUtils(RouteGenerator.verificationAdressPage);


//------------------------------------------------------------------------------

Future picKImageID() async{
  final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  if(image != null) {
      imageIDFile = File(image.path);
    }
    // imagePath = imageTemporary.toString();
  debugPrint("This is the path $imageIDFile");
  notifyListeners();
}

//------------------------------------------------------------------------------

Future picKImageAddress() async{
  final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  if(image != null) {
    imageAddressFile = File(image.path);
    }
    // imagePath = imageTemporary.toString();
  debugPrint("This is the path $imageAddressFile");
  notifyListeners();
}

//-----------------------------verificationID-----------------------------------

Future<dynamic> verificationID({required String idNumber, required String idDocumentType}) async{
  final dataResponse = await VerificationRepository().verificationIDRepository(imageIDFile!, idNumber, idDocumentType);
  debugPrint(dataResponse.toString());
  // Helpers.showSnackBar(message: dataResponse["message"]);
  getUser();
  notifyListeners();
}

//------------------------------------------------------------------------------

Future<dynamic> verificationAdress({String? otherDocumentType, required String address1, required String address2, required String city, required String addressDocumentType, required String country,}) async{
  final dataResponse = await VerificationRepository().verificationAddressRepository(imageAddressFile!, address1, address2, city, addressDocumentType, country, otherDocumentType);
  debugPrint(dataResponse.toString());
  // Helpers.showSnackBar(message: dataResponse["message"]);
  getUser();
  notifyListeners();
}

}