import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../model/responseDataModel.dart';

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
      {required DataModel data}) async {
    String dataJson = jsonEncode(data.toJson());
    await _sharedPreferences.setBool("isLoggedIn", true);
    return await _sharedPreferences.setString("data", dataJson);
  }

  DataModel getData() {
    final data = jsonDecode(_sharedPreferences.getString("data")!);

    return DataModel.fromJson(data) ;
  }

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

  // String get email{
  //   return _sharedPreferences.getString("email")??'';
  // }
  // String get token => _sharedPreferences.getString(PrefKeys.token.name) ?? '';
  // String get token => _sharedPreferences.getString(getUser().token) ?? '';
}
