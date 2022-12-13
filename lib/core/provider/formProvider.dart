import 'package:flutter/cupertino.dart';

class FormProvider with ChangeNotifier{
  String? selectedVerificationIdType;
  String? selectedVerificationAddressType;
  String? selectedCountryAddress;
  String? selectedCountrySignUp;
  // void onChange(String value){
  //   selectedValue = value;
  // }
  //
   void onChangeIdType(Object? value){
    selectedVerificationIdType = value as String;
    notifyListeners();
}

   void onChangeAddressType(Object? value){
    selectedVerificationAddressType = value as String;
    notifyListeners();
}

//    void onChangeAddressType(Object? value){
//     selectedVerificationAddressType = value as String;
//     notifyListeners();
// }

  void onChangeCountryAddress(Object? value){
    selectedCountryAddress = value as String;
    notifyListeners();
  }


  void onChangeCountrySignUp(Object? value){
    selectedCountrySignUp = value as String;
    notifyListeners();
  }




}