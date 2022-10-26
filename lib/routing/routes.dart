import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talants_valley/routing/router.dart';

import '../ui/pages/auth/checkEmailPage.dart';
import '../ui/pages/auth/crateNewPassword.dart';
import '../ui/pages/auth/forgetPasswordPage.dart';
import '../ui/pages/auth/signInPage.dart';
import '../ui/pages/auth/signUpPage.dart';
import '../ui/pages/auth/successResetPassword.dart';
import '../ui/pages/home/homePage.dart';
import '../ui/pages/verification/mainVerificationPage.dart';


class RoutsGnerate{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RouteGenerator.splashPage:
        // return MaterialPageRoute(builder: (_) => const SplashPage());
      // case RouteGenerator.messangerPage:
      // return MaterialPageRoute(builder: (_) => const MessengerScreen());
      case RouteGenerator.signInPage:
        return MaterialPageRoute(builder: (_) => SignInPage());
      case RouteGenerator.signUpPage:
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case RouteGenerator.homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case RouteGenerator.forgetPassword:
        return MaterialPageRoute(builder: (_) => ForgetPasswordPage());
      case RouteGenerator.createNewPassword:
        return MaterialPageRoute(builder: (_) =>  CreateNewPasswordPage());
      case RouteGenerator.successResetPage:
        return MaterialPageRoute(builder: (_) =>  SuccessResetPassword());
      case RouteGenerator.mainVerificationPage:
        return MaterialPageRoute(builder: (_) =>  MainVerificationPage());
      case RouteGenerator.checkEmailPage:
        return MaterialPageRoute(builder: (_) =>  CheckEmailPage());
      case RouteGenerator.settingPage:
        // return MaterialPageRoute(builder: (_) =>  const SettingPage());
      default:
        throw const FormatException("Route not found");
    }
  }
}