class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "https://talents-valley-backend.herokuapp.com/api/";

  static const String userLogin = 'user/login';
  static const String userSignup = 'user/signup';
  static const String userForgetPassword = 'user/password/forgot';
  static const String userVerifyPassword = 'user/password/verify-code';
  static const String crateNewPassword = 'user/password/recover';
  static const String sendCodeEmail = 'user/send-code-email';
  static const String sendCodeMobile = 'user/send-code-mobile';
  static const String verificationEmail = 'user/verify/email';
  static const String verificationMobile = 'user/verify/mobile';
  static const String getUserData = 'settings/profile';
  static const String verificationID = 'user/verify/id';
  static const String verificationAddress = 'user/verify/address';
  static const String getUsers = '/team/user/list?limit=20';
  static const String getUserDetails = '/team/user/details/';
  static const String deleteUser = '/team/user/delete/';
  static const String blockUser = '/team/user/block/';
  static const String editInformationUser = 'team/user/details/';
  static const String changeRole = '/team/user/change-role/';

}
