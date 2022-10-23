import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier{
bool isPassword = true;
void suffixPressed(){
  isPassword = !isPassword;
  notifyListeners();
}
}