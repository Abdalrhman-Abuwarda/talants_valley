import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/core/data/repository/verification_repository.dart';
import 'package:talants_valley/core/model/userModel.dart';

import '../../routing/navigations.dart';
import '../../routing/router.dart';
import '../../utils/helper.dart';
import '../../utils/validate.dart';
import '../data/local/sharedController.dart';
import 'authProvider.dart';

class VerificationProvider with ChangeNotifier{

  String? validateFunction(String? value) => Validate.validateEmail(value);

  int seconds = 59;
  int minutes = 1;
  Timer? timer;
  int counterMinutes = 0;
  bool timerCansel = false;

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

  resendCode(){
    seconds = 60;
    minutes = 1;
    startTimer();
    notifyListeners();
  }
  disposeTimer(){
    timer?.cancel();
    notifyListeners();
  }


//-----------------------------variablesForIDVerification-----------------------

  File? mainIDFile;
  PlatformFile? idFile;
  double idFileSize = 0;
  bool acceptedIdFile = false;

//-----------------------------variablesForAddressVerification------------------

  File? mainAddressFile;
  PlatformFile? addressFile;
  double? addressFileSize;
  bool acceptedAddressFile = false;

//------------------------------------------------------------------------------

  final List<String> acceptedFileExtensionType = ["png" , "jpg", "gif", "jpeg", "pdf"];


//------------------------------sendCodeEmail-----------------------------------

Future<dynamic> sendCodeEmail() async{
  final dateResponse = VerificationRepository().sendCodeEmailRepository();
  debugPrint(dateResponse.toString());
  // Helpers.showSnackBar(message: "The process done successfully");
  ServiceNavigation.serviceNavi
      .pushNamedAndRemoveUtils(RouteGenerator.verificationEmailPage);
  notifyListeners();
}

//---------------------------resendCodeEmail------------------------------------

  Future<dynamic> resendCodeEmail() async{
    final dateResponse = VerificationRepository().sendCodeEmailRepository();
    debugPrint(dateResponse.toString());
    // Helpers.showSnackBar(message: "The process done successfully");
    final context =ServiceNavigation.serviceNavi.navKey.currentContext;
    Provider.of<AuthProvider>(context!, listen: false).seconds = 60;
    Provider.of<AuthProvider>(context, listen: false).minutes = 1;
    Provider.of<AuthProvider>(context, listen: false).startTimer();
    Helpers.showSnackBar(message: "The process done successfully");

    notifyListeners();
  }

//---------------------------verificationEmail----------------------------------

  Future<dynamic> verificationEmail({required String code}) async{
  final dataResponse = VerificationRepository().verificationEmailRepository(code);
  debugPrint(dataResponse.toString());
  Helpers.showSnackBar(message: "The process done successfully");
  ServiceNavigation.serviceNavi
      .pushNamedAndRemoveUtils(RouteGenerator.successVerificationEmail);
  notifyListeners();
  }


//---------------------------sendMobileCode-------------------------------------

Future<dynamic> sendCodeMobile() async{
  final dateResponse = VerificationRepository().sendCodeMobileRepository();
  debugPrint(dateResponse.toString());
  // Helpers.showSnackBar(message: "The process done successfully");
  ServiceNavigation.serviceNavi
      .pushNamedAndRemoveUtils(RouteGenerator.verificationMobilePage);
  notifyListeners();
}

//--------------------------resendMobileCode------------------------------------

  Future<dynamic> resendCodeMobile() async{
    final dateResponse = VerificationRepository().sendCodeMobileRepository();
    debugPrint(dateResponse.toString());
    // Helpers.showSnackBar(message: "The process done successfully");
    final context =ServiceNavigation.serviceNavi.navKey.currentContext;
    Provider.of<AuthProvider>(context!, listen: false).seconds = 60;
    Provider.of<AuthProvider>(context, listen: false).minutes = 1;
    Provider.of<AuthProvider>(context, listen: false).startTimer();
    Helpers.showSnackBar(message: "The process done successfully");

    notifyListeners();
  }


//--------------------------verificationMobile----------------------------------

  Future<dynamic> verificationMobile({required String code}) async {
  final dataResponse = VerificationRepository().verificationMobileRepository(code);
  debugPrint(dataResponse.toString());
  Helpers.showSnackBar(message: "The process done successfully");
  ServiceNavigation.serviceNavi
      .pushNamedAndRemoveUtils(RouteGenerator.successVerificationMobile);
  notifyListeners();
  }

//------------------------------------------------------------------------------

  Future<dynamic> getUser() async {
  final dataResponse = await VerificationRepository().getUserRepository();
  debugPrint("This is the data of user\n $dataResponse");
  SharedPrefController().saveData(user: dataResponse);
  ServiceNavigation.serviceNavi
      .pushNamedAndRemoveUtils(RouteGenerator.mainVerificationPage);
  notifyListeners();
  }

//------------------------mainVerificationPageOnPressedFunctions----------------
  Function()? mainOnPressedFunction({required String userId}) {
    ServiceNavigation.serviceNavi.pushNamedAndRemoveUtils(RouteGenerator.mainFreelancerPage);
  }
  // userId == "1" ?
  //     ServiceNavigation.serviceNavi.pushNamedAndRemoveUtils(RouteGenerator.mainTeamPage) :


  Function()? idVerifiedPressedFunction() =>
      ServiceNavigation.serviceNavi
          .pushNamedAndRemoveUtils(RouteGenerator.verificationIDPage);

  Function()? addressVerifiedPressedFunction() =>
      ServiceNavigation.serviceNavi
          .pushNamedAndRemoveUtils(RouteGenerator.verificationAddressPage);


//-----------------------------pickFileID---------------------------------------

  Future pickFileID() async {
    final result = await FilePicker.platform.pickFiles();
    final file = result!.files.first;
    if(result != null){
      mainIDFile = File(file.path.toString());
      idFile = file;
      idFileSize = file.size / 1048576;
    }
    checkAcceptedFileId();
    debugPrint("This is the imageIDFile $mainIDFile");
    debugPrint("This is the imageIDFile path ${mainIDFile!.path}");
    debugPrint("This is the file Size ${file.size}");
    debugPrint("This is the file bytes ${file.bytes}");
    debugPrint("This is the file extension ${file.extension}");
    debugPrint("This is the file extension ${file.extension}");
    debugPrint("This is the file path ${file.path}");
    notifyListeners();
  }


//------------------------------pickFileAddress---------------------------------

  Future pickFileAddress() async {
    final result = await FilePicker.platform.pickFiles();
    final file = result!.files.first;
    if(result != null){
      mainAddressFile = File(file.path.toString());
       addressFile = file;
       addressFileSize = file.size / 1048576;
    }
    checkAcceptedFileAddress();
    debugPrint("This is the imageIDFile $mainAddressFile");
    debugPrint("This is the imageIDFile path ${mainAddressFile!.path}");
    debugPrint("This is the file Size ${file.size}");
    debugPrint("This is the file bytes ${file.bytes}");
    debugPrint("This is the file extension ${file.extension}");
    debugPrint("This is the file extension ${file.extension}");
    debugPrint("This is the file path ${file.path}");
    notifyListeners();
  }

//--------------------------deleteMainAddressFile------------------------------

  void deleteAddressFile(){
    mainAddressFile = null;
    acceptedAddressFile = false;
    notifyListeners();
  }

//-------------------------deleteMainIDFile-------------------------------------

void deleteIfFile(){
    mainIDFile = null;
    acceptedIdFile = false;
    notifyListeners();
}

//--------------------------checkAcceptedFileAddress----------------------------

  void checkAcceptedFileAddress(){
    for( String x in acceptedFileExtensionType){
      // debugPrint("This is the acceptedAddressFile out of the if $x");
      if(addressFile!.extension == x && addressFileSize! < 2){
        // debugPrint("${addressFile!.extension == x}");
        acceptedAddressFile = true;
        // debugPrint("This is the acceptedAddressFile from the loop $acceptedAddressFile");
        // notifyListeners();
        break;
      }
      // debugPrint("This is the acceptedAddressFile out the loop $acceptedAddressFile");
      // notifyListeners();
    }
    // notifyListeners();
  }

//----------------------------checkIDFileAddress--------------------------------

  void checkAcceptedFileId(){
    for(String x in acceptedFileExtensionType){
      if(idFile!.extension == x && idFileSize< 2){
        acceptedIdFile = true;
        break;
      }
    }
  }

//-----------------------------verificationID-----------------------------------

Future<dynamic> verificationID({required String idNumber, required String idDocumentType}) async{
  final dataResponse = await VerificationRepository().verificationIDRepository(mainIDFile!, idNumber, idDocumentType);
  debugPrint(dataResponse.toString());
  // Helpers.showSnackBar(message: dataResponse["message"]);
  getUser();
  notifyListeners();
}

//------------------------------------------------------------------------------

Future<dynamic> verificationAdress({String? otherDocumentType, required String address1, required String address2, required String city, required String addressDocumentType, required String country,}) async{
  final dataResponse = await VerificationRepository().verificationAddressRepository(mainAddressFile!, address1, address2, city, addressDocumentType, country, otherDocumentType);
  debugPrint(dataResponse.toString());
  // Helpers.showSnackBar(message: dataResponse["message"]);
  getUser();
  notifyListeners();
}

}