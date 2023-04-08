class Endpoints {
  Endpoints._();

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
  static const String verificationID = 'user/upload/id';
  static const String verificationAddress = 'user/upload/address';
  static const String getUsers = '/team/user/list?limit=20&offset=';
  static const String getUserDetails = '/team/user/details/';
  static const String deleteUser = '/team/user/delete/';
  static const String blockUser = '/team/user/block/';
  static const String editInformationUser = 'team/user/details/';
  static const String changeRole = '/team/user/change-role/';
  static const String sendCodeAddAccount = 'bank/send-code';
  static const String addBankAccount = 'bank/add';
  static const String getBankAccountList = 'bank/listing?offset=0&limit=10';
  static const String deleteBankAccount = 'bank/delete/';
  static const String getWithdrawalRequestList = 'withdraw/list?offset=0';
  static const String requestBankWithdraw = 'withdraw/request-bank';
  static const String getOfficeList = 'withdraw/office-list?office=0&limit=10';
  static const String sendCodeRecipient = 'recipient/send-code';
  static const String addRecipientRecipient = 'recipient/create';
  static const String getRecipients = 'recipient/list?offset=0&limit=10';
  static const String deleteRecipient = 'recipient/delete/';
  static const String updateRecipient = '/recipient/edit/';
  static const String requestWithdrawCash = 'withdraw/request-cash';
  static const String getWithdrawDetails = 'withdraw/details/';
  static const String cancelWithdraw = 'withdraw/cancel/';
  static const String confirmWithdraw = 'withdraw/confirm-payout/';

}
