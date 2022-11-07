import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../model/responseDataModel.dart';
import '../../model/userModel.dart';

// enum PrefKeys {id, full_name, email, gender, token, refresh_token ,isLoggedIn}
class SharedPrefController {
  // final String user = "USER";
  SharedPrefController._();

  static final SharedPrefController _instance=SharedPrefController._();
  late SharedPreferences _sharedPreferences;

  factory SharedPrefController() {
    return _instance;
  }

  Future initSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }


  bool isLoggedIn() {
    return _sharedPreferences.getBool("isLoggedIn") ?? false;
  }

  Future<bool> saveData(
      {required UserModel user}) async {
    String userJson = jsonEncode(user.toJson());
    await _sharedPreferences.setBool("isLoggedIn", true);
    return await _sharedPreferences.setString("user", userJson);
  }
  
  Future<bool> saveAccessToken({required String tocken}) async {
    return await _sharedPreferences.setString("accessToken", tocken);
  }

  // Future<bool> saveUser({required UserModel user}) async{
  //   String userJson = jsonEncode(user.toJson());
  //   return await _sharedPreferences.setString("user", userJson);
  // }

  // UserModel getUser() {
  //   final user = jsonDecode(_sharedPreferences.getString("user")!);
  //   return UserModel.fromJson(user);
  // }

  UserModel getUser() {
    final user = jsonDecode(_sharedPreferences.getString("user")!);
    return UserModel.fromJson(user) ;
  }
  
  bool get verifiedMobile => _sharedPreferences.getBool("verifiedMobile") ?? false;
  bool get verifiedEmail => _sharedPreferences.getBool("verifiedEmail") ?? false;
  String get accessToken => _sharedPreferences.getString("accessToken") ?? '';

  // String get verifiedMobile => _sharedPreferences.getString(getData().user.verifiedEmail.toString()) ?? '';
  // String get verifiedEmail => _sharedPreferences.getString(getData().user.verifiedMobile.toString()) ?? '';
  // Future<bool> updateVerifiedEmail() async{
  //   return await _sharedPreferences.setBool("verifiedEmail", true);
  // }

  // Future<bool> updateVerifiedMobile() async{
  //   return await _sharedPreferences.setBool("verifiedMobile", true);
  // }

  Future<bool> saveId({required String id}) async {
    return await _sharedPreferences.setString("id", id);
  }

  Future<bool> saveRecoverToken({required String recoverToken}) async {
    return await _sharedPreferences.setString("recoverToken", recoverToken);
  }

  getRecoverToken(){
    return _sharedPreferences.getString("recoverToken");
  }

  getId(){
    return _sharedPreferences.getString("id");
  }

  Future<bool> logout()  {
    return _sharedPreferences.clear();
  }

}
