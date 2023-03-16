import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talants_valley/routing/router.dart';
import 'package:talants_valley/ui/pages/balance_freelancer/add_balance_bank_page.dart';
import 'package:talants_valley/ui/pages/balance_freelancer/add_recipient_page.dart';
import 'package:talants_valley/ui/pages/balance_freelancer/editRecipientPage.dart';
import 'package:talants_valley/ui/pages/balance_freelancer/preview_withdrawal_cash_page.dart';
import 'package:talants_valley/ui/pages/balance_freelancer/verificationEditRecipientPage.dart';
import 'package:talants_valley/ui/pages/balance_freelancer/verification_add_bank_page.dart';
import 'package:talants_valley/ui/pages/verification/successVerifiedEmail.dart';
import 'package:talants_valley/ui/pages/verification/verificationEmailPage.dart';

import '../ui/pages/auth/checkEmailPage.dart';
import '../ui/pages/auth/crateNewPassword.dart';
import '../ui/pages/auth/forgetPasswordPage.dart';
import '../ui/pages/auth/signInPage.dart';
import '../ui/pages/auth/signUpPage.dart';
import '../ui/pages/auth/successResetPassword.dart';
import '../ui/pages/balance_freelancer/add_balane_cash_page.dart';
import '../ui/pages/balance_freelancer/add_bank_account_page.dart';
import '../ui/pages/balance_freelancer/choose_office_page.dart';
import '../ui/pages/balance_freelancer/choose_bank_account_page.dart';
import '../ui/pages/balance_freelancer/balance_freelancer_page.dart';
import '../ui/pages/balance_freelancer/choose_recipient_page.dart';
import '../ui/pages/balance_freelancer/verifcation_add_recipient.dart';
import '../ui/pages/balance_freelancer/preview_withdrawal_bank_page.dart';
import '../ui/pages/home_freelancer/home_freelancer_page.dart';
import '../ui/pages/main_page_freelancer.dart';
import '../ui/pages/verification/mainVerificationPage.dart';
import '../ui/pages/verification/successVerifiedMopile.dart';
import '../ui/pages/verification/verificationAdressPage.dart';
import '../ui/pages/verification/verificationIDPage.dart';
import '../ui/pages/verification/verificationMobilePage.dart';
import '../ui/teamPages/homeTeamDashboard/mainTeamPage.dart';
import '../ui/teamPages/homeTeamDashboard/userManagementPages/editUserInformationPage.dart';
import '../ui/teamPages/homeTeamDashboard/userManagementPages/mainUserManagementPage.dart';
import '../ui/teamPages/homeTeamDashboard/userManagementPages/userDetailsPage.dart';


class RoutsGenerate{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RouteGenerator.splashPage:
      case RouteGenerator.signInPage:
        return MaterialPageRoute(builder: (_) => SignInPage());
      case RouteGenerator.signUpPage:
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case RouteGenerator.mainFreelancerPage:
        return MaterialPageRoute(builder: (_) =>  const MainPageFreelancer());
      case RouteGenerator.forgetPassword:
        return MaterialPageRoute(builder: (_) => ForgetPasswordPage());
      case RouteGenerator.createNewPassword:
        return MaterialPageRoute(builder: (_) =>  CreateNewPasswordPage());
      case RouteGenerator.successResetPage:
        return MaterialPageRoute(builder: (_) =>  const SuccessResetPassword());
      case RouteGenerator.mainVerificationPage:
        return MaterialPageRoute(builder: (_) =>  const MainVerificationPage());
      case RouteGenerator.checkEmailPage:
        return MaterialPageRoute(builder: (_) =>  CheckEmailPage());
      case RouteGenerator.verificationEmailPage:
        return MaterialPageRoute(builder: (_) =>  VerificationEmailPage());
      case RouteGenerator.successVerificationEmail:
        return MaterialPageRoute(builder: (_) =>  const SuccessVerifiedEmailPage());
      case RouteGenerator.successVerificationMobile:
        return MaterialPageRoute(builder: (_) =>  const SuccessVerifiedMobilePage());
      case RouteGenerator.verificationMobilePage:
        return MaterialPageRoute(builder: (_) => VerificationMobilePage());
      case RouteGenerator.verificationIDPage:
        return MaterialPageRoute(builder: (_) => VerificationIDPage());
      case RouteGenerator.verificationAddressPage:
        return MaterialPageRoute(builder: (_) => VerificationAdressPage());
      case RouteGenerator.getUserDetails:
        return MaterialPageRoute(builder: (_) => UserDetailsPage());
      case RouteGenerator.mainTeamPage:
        return MaterialPageRoute(builder: (_) => const MainTeamPage());
      case RouteGenerator.mainUserManagementPage:
        return MaterialPageRoute(builder: (_) => MainUserManagementPage());
      case RouteGenerator.editUserInformationPage:
        return MaterialPageRoute(builder: (_) => EditUserInformation());
      case RouteGenerator.addBankAccountPage:
        return MaterialPageRoute(builder: (_) => const AddBankAccountPage());
      case RouteGenerator.chooseBankAccountPage:
        return MaterialPageRoute(builder: (_) => const ChooseBankAccountPage());
      case RouteGenerator.verificationAddBnkPage:
        return MaterialPageRoute(builder: (_) => VerificationAddBnkPage());
      case RouteGenerator.addBalanceBankWithdrawPage:
        return MaterialPageRoute(builder: (_) => const AddBalanceBankPage());
      case RouteGenerator.addBalanceCashWithdrawPage:
        return MaterialPageRoute(builder: (_) => AddBalanceCashPage());
      case RouteGenerator.withdrawalPreviewPage:
        return MaterialPageRoute(builder: (_) =>  PreviewWithdrawalBankPage());
      case RouteGenerator.balanceFreelancerPage:
        return MaterialPageRoute(builder: (_) => const BalanceFreelancerPage());
      case RouteGenerator.chooseOfficePage:
        return MaterialPageRoute(builder: (_) => const ChooseOfficePage());
      case RouteGenerator.addRecipientPage:
        return MaterialPageRoute(builder: (_) => AddRecipientPage());
      case RouteGenerator.chooseRecipientFreelancerPage:
        return MaterialPageRoute(builder: (_) =>  const ChooseRecipientPage());
      case RouteGenerator.editRecipientPage:
        return MaterialPageRoute(builder: (_) =>   EditRecipientPage());
      case RouteGenerator.verificationAddRecipientPage:
        return MaterialPageRoute(builder: (_) => VerificationAddRecipientPage());
      case RouteGenerator.verificationEditRecipient:
        return MaterialPageRoute(builder: (_) => VerificationEditRecipientPage());
      case RouteGenerator.previewCashWithdrawalRecipient:
        return MaterialPageRoute(builder: (_) => PreviewWithdrawalCashPage());
        default:
        throw const FormatException("Route not found");
    }
  }
}