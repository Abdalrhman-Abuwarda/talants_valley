import 'package:flutter/cupertino.dart';

class FormProvider with ChangeNotifier{
  String? selectedValueId = null;
  String? selectedValueAddress = null;
  // void onChange(String value){
  //   selectedValue = value;
  // }
  //
   void onChangeId(Object? value){
    selectedValueId = value as String;
}

   void onChangeAddress(Object? value){
    selectedValueAddress = value as String;
}
}