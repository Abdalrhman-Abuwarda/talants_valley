class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "https://talents-valley.herokuapp.com/api/";

  static const String userLogin = 'user/login';
  static const String userSignup = 'user/signup';
  static const String userForgetPassword = 'user/password/forgot';
  static const String userVerifyPassword = 'user/password/verify-code';
  static const String crateNewPassword = 'user/password/recover';
  static const String sendCodeEmail = 'user/send-code-email';
  static const String sendCodeMobile = 'user/send-code-mobile';
  static const String verificationEmail = 'user/verify/email';
  static const String verificationMobile = 'user/verify/mobile';

}
