import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/core/data/repository/auth_and_verification_repo/verification_repo.dart';

import '../../../routing/navigations.dart';
import '../../../routing/router.dart';
import '../../../utils/helper.dart';
import '../../../utils/validate_extension.dart';
import '../../data/local/shared_controller.dart';
import 'authProvider.dart';

class VerificationProvider with ChangeNotifier {
  String? validateFunction(String? value) => Validate.validateEmail(value);

  int seconds = 59;
  int minutes = 1;
  Timer? timer;
  int counterMinutes = 0;
  bool timerCansel = false;

  twoDigits(int n) => n.toString().padLeft(2, "0");

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (seconds != 0) {
        seconds--;
        notifyListeners();
      } else if (seconds == 0 && minutes != 0) {
        if (minutes != 0) {
          minutes--;
          seconds += 60;
        }
      } else {
        timer?.cancel();
        notifyListeners();
      }
    });
  }

  resendCode() {
    seconds = 60;
    minutes = 1;
    startTimer();
    notifyListeners();
  }

  disposeTimer() {
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

  final List<String> acceptedFileExtensionType = [
    "png",
    "jpg",
    "gif",
    "jpeg",
    "pdf"
  ];

//------------------------------sendCodeEmail-----------------------------------

  sendCodeEmail() async {
    final dateResponse = VerificationRepo().sendCodeEmailRepository();
    ServiceNavigation.serviceNavi
        .pushNamedAndRemoveUtils(RouteGenerator.verificationEmailPage);
    notifyListeners();
  }

//---------------------------resendCodeEmail------------------------------------

  resendCodeEmail() async {
    final dateResponse = VerificationRepo().sendCodeEmailRepository();
    final context = ServiceNavigation.serviceNavi.navKey.currentContext;
    Provider.of<AuthProvider>(context!, listen: false).seconds = 60;
    Provider.of<AuthProvider>(context, listen: false).minutes = 1;
    Provider.of<AuthProvider>(context, listen: false).startTimer();
    Helpers.showSnackBar(message: "The process done successfully");
    notifyListeners();
  }

//---------------------------verificationEmail----------------------------------

  verificationEmail({required String code}) async {
    final dataResponse =
        VerificationRepo().verificationEmailRepository(code);
    debugPrint(dataResponse.toString());
    Helpers.showSnackBar(message: "The process done successfully");
    ServiceNavigation.serviceNavi
        .pushNamedAndRemoveUtils(RouteGenerator.successVerificationEmail);
    getUser();
    notifyListeners();
  }

//---------------------------sendMobileCode-------------------------------------

  sendCodeMobile() async {
    final dateResponse = VerificationRepo().sendCodeMobileRepository();
    ServiceNavigation.serviceNavi
        .pushNamedAndRemoveUtils(RouteGenerator.verificationMobilePage);
    notifyListeners();
  }

//--------------------------resendMobileCode------------------------------------

  resendCodeMobile() async {
    final dateResponse = VerificationRepo().sendCodeMobileRepository();
    debugPrint(dateResponse.toString());
    final context = ServiceNavigation.serviceNavi.navKey.currentContext;
    Provider.of<AuthProvider>(context!, listen: false).seconds = 60;
    Provider.of<AuthProvider>(context, listen: false).minutes = 1;
    Provider.of<AuthProvider>(context, listen: false).startTimer();
    Helpers.showSnackBar(message: "The process done successfully");

    notifyListeners();
  }

//--------------------------verificationMobile----------------------------------

  verificationMobile({required String code}) async {
    final dataResponse =
        VerificationRepo().verificationMobileRepository(code);
    debugPrint(dataResponse.toString());
    Helpers.showSnackBar(message: "The process done successfully");
    ServiceNavigation.serviceNavi
        .pushNamedAndRemoveUtils(RouteGenerator.successVerificationMobile);
    getUser();
    notifyListeners();
  }

//------------------------------------------------------------------------------

  getUser() async {
    final dataResponse = await VerificationRepo().getUserRepository();
    debugPrint("This is the data of user\n $dataResponse");
    SharedPrefController().saveData(user: dataResponse);
    ServiceNavigation.serviceNavi
        .pushNamedAndRemoveUtils(RouteGenerator.mainVerificationPage);
    notifyListeners();
  }

//------------------------mainVerificationPageOnPressedFunctions----------------

  mainOnPressedFunction({required String userId}) {
    ServiceNavigation.serviceNavi
        .pushNamedAndRemoveUtils(RouteGenerator.mainFreelancerPage);
  }

  idVerifiedPressedFunction() => ServiceNavigation.serviceNavi
      .pushNamedAndRemoveUtils(RouteGenerator.verificationIDPage);

  addressVerifiedPressedFunction() => ServiceNavigation.serviceNavi
      .pushNamedAndRemoveUtils(RouteGenerator.verificationAddressPage);

//-----------------------------pickFileID---------------------------------------

  Future pickFileID() async {
    final result = await FilePicker.platform.pickFiles();
    final file = result!.files.first;
    if (result != null) {
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
    debugPrint("This is the file path ${file.path}");
    notifyListeners();
  }

//------------------------------pickFileAddress---------------------------------

  Future pickFileAddress() async {
    final result = await FilePicker.platform.pickFiles();
    final file = result!.files.first;
    if (result != null) {
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
    debugPrint("This is the file path ${file.path}");
    notifyListeners();
  }

//--------------------------deleteMainAddressFile------------------------------

  deleteAddressFile() {
    mainAddressFile = null;
    acceptedAddressFile = false;
    notifyListeners();
  }

//-------------------------deleteMainIDFile-------------------------------------
  deleteIfFile() {
    mainIDFile = null;
    acceptedIdFile = false;
    notifyListeners();
  }

//--------------------------checkAcceptedFileAddress----------------------------

  checkAcceptedFileAddress() {
    for (String x in acceptedFileExtensionType) {
      if (addressFile!.extension == x && addressFileSize! < 2) {
        acceptedAddressFile = true;
        break;
      }
    }
  }

//----------------------------checkIDFileAddress--------------------------------

  checkAcceptedFileId() {
    for (String x in acceptedFileExtensionType) {
      if (idFile!.extension == x && idFileSize < 2) {
        acceptedIdFile = true;
        break;
      }
    }
  }

//-----------------------------verificationID-----------------------------------

  verificationID(
      {required String idNumber, required String idDocumentType}) async {
    final dataResponse = await VerificationRepo()
        .verificationIDRepository(mainIDFile!, idNumber, idDocumentType);
    debugPrint(dataResponse.toString());
    getUser();
    notifyListeners();
  }

//------------------------------------------------------------------------------

  verificationAddress({
    String? otherDocumentType,
    required String address1,
    required String address2,
    required String city,
    required String addressDocumentType,
    required String country,
  }) async {
    final dataResponse = await VerificationRepo()
        .verificationAddressRepository(mainAddressFile!, address1, address2,
            city, addressDocumentType, country, otherDocumentType);
    debugPrint(dataResponse.toString());
    getUser();
    notifyListeners();
  }
}
