import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../model/responseDataModel.dart';
import '../../model/userModel.dart';

// enum PrefKeys {id, full_name, email, gender, token, refresh_token ,isLoggedIn}
class SharedPrefController {
  // final String user = "USER";
  SharedPrefController._();

  static final SharedPrefController _instance = SharedPrefController._();
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

  Future<bool> saveData({required UserModel user}) async {
    debugPrint("This is inside sade data =>>> ${user.toString()}");

    String userJson = jsonEncode(user.toJson());
    await _sharedPreferences.setBool("isLoggedIn", true);
    return await _sharedPreferences.setString("user", userJson);
  }

  Future<bool> saveAccessToken({required String token}) async {
    return await _sharedPreferences.setString("accessToken", token);
  }

  Future<bool> saveRefreshToken({required String token}) async {
    return await _sharedPreferences.setString("refToken", token);
  }

  // Future<bool> saveUser({required UserModel user}) async{
  //   String userJson = jsonEncode(user.toJson());
  //   return await _sharedPreferences.setString("user", userJson);
  // }

  // UserModel getUser() {
  //   final user = jsonDecode(_sharedPreferences.getString("user")!);
  //   return UserModel.fromJson(user);
  // }


  getUser()  {
    final dynamic user = jsonDecode(_sharedPreferences.getString("user") ?? jsonEncode(UserModel.fakeData()));
    return UserModel.fromJson(user);
  }


  bool get verifiedMobile =>
      _sharedPreferences.getBool("verifiedMobile") ?? false;

  bool get verifiedEmail =>
      _sharedPreferences.getBool("verifiedEmail") ?? false;

  String get accessToken => _sharedPreferences.getString("accessToken") ?? '';


  Future<bool> saveForgetEmail({required String email}) async {
    return await _sharedPreferences.setString("forgetEmail", email);
  }

  getForgetEmail() {
    return _sharedPreferences.getString("forgetEmail");
  }

  Future<bool> saveId({required String id}) async {
    return await _sharedPreferences.setString("id", id);
  }

  Future<bool> saveRecoverToken({required String recoverToken}) async {
    return await _sharedPreferences.setString("recoverToken", recoverToken);
  }

  getRecoverToken() {
    return _sharedPreferences.getString("recoverToken");
  }

  getId() {
    return _sharedPreferences.getString("id");
  }

  Future<bool> savaBankAccountToVerify({required String accountName, required String accountNumber, required String bankBranch, required String ledger, required String bankName}) async{
    await _sharedPreferences.setString("accountName", accountName);
    await _sharedPreferences.setString("accountNumber", accountNumber);
    await _sharedPreferences.setString("bankBranch", bankBranch);
    await _sharedPreferences.setString("bankName", bankName);
    return await _sharedPreferences.setString("ledger", ledger);

  }

  getBankAccountName() {
    return _sharedPreferences.getString("accountName");
  }

  getBankAccountNumber() {
    return _sharedPreferences.getString("accountNumber");
  }

  getBankAccountBranch() {
    return _sharedPreferences.getString("bankBranch");
  }

  getBankAccountLeger() {
    return _sharedPreferences.getString("ledger");
  }


  Future<bool> logout() {
    return _sharedPreferences.clear();
  }

  Future<bool> saveAmountToWithdraw({required String amountToWithdraw}) async {
    return _sharedPreferences.setString("amountToWithdraw", amountToWithdraw);
  }

  getAmountToWithdraw() {
    return _sharedPreferences.getString("amountToWithdraw");
  }

  Future<bool> saveRecipientData({required String mobile, required String idNumber, required String name}) async {
    await _sharedPreferences.setString("mobileRecipient", mobile);
    await _sharedPreferences.setString("idNumberRecipient", idNumber);
    return _sharedPreferences.setString("nameRecipient", name);
  }

  Future<bool> saveIdRecipient({required String id}) async {
    return await _sharedPreferences.setString("idRecipient", id);
  }

  getIdRecipient() {
    return _sharedPreferences.getString("idRecipient");
  }

  getNameRecipient() {
    return _sharedPreferences.getString("nameRecipient");
  }
  getIdNumberRecipient (){
    return _sharedPreferences.getString("idNumberRecipient");
  }

  getMobileRecipient(){
    return _sharedPreferences.getString("mobileRecipient");
  }

}
