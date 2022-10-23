import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talants_valley/routing/router.dart';


class RoutsGnerate{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RouteGenerator.splashPage:
        // return MaterialPageRoute(builder: (_) => const SplashPage());
      // case RouteGenerator.messangerPage:
      // return MaterialPageRoute(builder: (_) => const MessengerScreen());
      case RouteGenerator.loginPage:
        // return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RouteGenerator.signupPage:
        // return MaterialPageRoute(builder: (_) => const SignUp());
      case RouteGenerator.homePage:
        // return MaterialPageRoute(builder: (_) => const HomePage());
      case RouteGenerator.forgetPassword:
        // return MaterialPageRoute(builder: (_) => const ForgetPassword());
      case RouteGenerator.resetPassword:
        // return MaterialPageRoute(builder: (_) =>  ResetPassword());
      case RouteGenerator.settingPage:
        // return MaterialPageRoute(builder: (_) =>  const SettingPage());
      default:
        throw const FormatException("Route not found");
    }
  }
}