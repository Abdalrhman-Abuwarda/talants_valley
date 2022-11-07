import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talants_valley/routing/router.dart';
import 'package:talants_valley/ui/pages/verification/successVerifiedEmail.dart';
import 'package:talants_valley/ui/pages/verification/verificationEmailPage.dart';

import '../ui/pages/auth/checkEmailPage.dart';
import '../ui/pages/auth/crateNewPassword.dart';
import '../ui/pages/auth/forgetPasswordPage.dart';
import '../ui/pages/auth/signInPage.dart';
import '../ui/pages/auth/signUpPage.dart';
import '../ui/pages/auth/successResetPassword.dart';
import '../ui/pages/home/homePage.dart';
import '../ui/pages/verification/mainVerificationPage.dart';
import '../ui/pages/verification/successVerifiedMopile.dart';
import '../ui/pages/verification/verificationAdressPage.dart';
import '../ui/pages/verification/verificationIDPage.dart';
import '../ui/pages/verification/verificationMobilePage.dart';


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
        return MaterialPageRoute(builder: (_) =>  HomePage());
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
      case RouteGenerator.verificationEmailPage:
        return MaterialPageRoute(builder: (_) =>  VerificationEmailPage());
      case RouteGenerator.successVerificationEmail:
        return MaterialPageRoute(builder: (_) =>  SuccessVerifiedEmailPage());
      case RouteGenerator.successVerificationMobile:
        return MaterialPageRoute(builder: (_) =>  SuccessVerifiedMobilePage());
      case RouteGenerator.verificationMobilePage:
        return MaterialPageRoute(builder: (_) => VerificationMobilePage());
      case RouteGenerator.verificationIDPage:
        return MaterialPageRoute(builder: (_) => VerificationIDPage());
      case RouteGenerator.verificationAdressPage:
        return MaterialPageRoute(builder: (_) => VerificationAdressPage());
        default:
        throw const FormatException("Route not found");
    }
  }
}