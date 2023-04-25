import 'package:flutter/material.dart';
import 'package:talants_valley/routing/router.dart';
import 'package:talants_valley/ui/pages/verification/success_verified_email.dart';
import 'package:talants_valley/ui/pages/verification/verification_email_page.dart';

import '../ui/pages/auth/check_email_page.dart';
import '../ui/pages/auth/crate_new_password.dart';
import '../ui/pages/auth/forget_password_page.dart';
import '../ui/pages/auth/signIn_page.dart';
import '../ui/pages/auth/sign_up_page.dart';
import '../ui/pages/auth/success_reset_password.dart';
import '../ui/pages/main_page_freelancer.dart';
import '../ui/pages/payout_freelancer/add_balance_bank_page.dart';
import '../ui/pages/payout_freelancer/add_balane_cash_page.dart';
import '../ui/pages/payout_freelancer/add_bank_account_page.dart';
import '../ui/pages/payout_freelancer/add_recipient_page.dart';
import '../ui/pages/payout_freelancer/choose_bank_account_page.dart';
import '../ui/pages/payout_freelancer/choose_office_page.dart';
import '../ui/pages/payout_freelancer/choose_recipient_page.dart';
import '../ui/pages/payout_freelancer/edit_recipient_page.dart';
import '../ui/pages/payout_freelancer/payout_freelancer_page.dart';
import '../ui/pages/payout_freelancer/preview_bank_withdrawal_status_page.dart';
import '../ui/pages/payout_freelancer/preview_cash_withdrawal_status_page.dart';
import '../ui/pages/payout_freelancer/preview_withdrawal_bank_page.dart';
import '../ui/pages/payout_freelancer/preview_withdrawal_cash_page.dart';
import '../ui/pages/payout_freelancer/verifcation_add_recipient.dart';
import '../ui/pages/payout_freelancer/verification_edit_recipient_page.dart';
import '../ui/pages/payout_freelancer/verification_add_bank_page.dart';
import '../ui/pages/verification/main_verification_page.dart';
import '../ui/pages/verification/success_verified_mopile.dart';
import '../ui/pages/verification/verification_adress_page.dart';
import '../ui/pages/verification/verification_id_page.dart';
import '../ui/pages/verification/verification_mobile_page.dart';
import '../ui/teamPages/home_team_dashboard/main_team_page.dart';
import '../ui/teamPages/home_team_dashboard/user_management_pages/edit_user_information_page.dart';
import '../ui/teamPages/home_team_dashboard/user_management_pages/main_user_management_page.dart';
import '../ui/teamPages/home_team_dashboard/user_management_pages/user_details_page.dart';
import '../ui/teamPages/notification_team/ui_notification_team/notification_screen/notification_details_page.dart';


class RoutsGenerate{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RouteGenerator.splashPage:
      case RouteGenerator.signInPage:
        return MaterialPageRoute(builder: (_) => const SignInPage());
      case RouteGenerator.signUpPage:
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case RouteGenerator.mainFreelancerPage:
        return MaterialPageRoute(builder: (_) =>  const MainPageFreelancer());
      case RouteGenerator.forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordPage());
      case RouteGenerator.createNewPassword:
        return MaterialPageRoute(builder: (_) =>  const CreateNewPasswordPage());
      case RouteGenerator.successResetPage:
        return MaterialPageRoute(builder: (_) =>  const SuccessResetPassword());
      case RouteGenerator.mainVerificationPage:
        return MaterialPageRoute(builder: (_) =>  const MainVerificationPage());
      case RouteGenerator.checkEmailPage:
        return MaterialPageRoute(builder: (_) =>  const CheckEmailPage());
      case RouteGenerator.verificationEmailPage:
        return MaterialPageRoute(builder: (_) =>  const VerificationEmailPage());
      case RouteGenerator.successVerificationEmail:
        return MaterialPageRoute(builder: (_) =>  const SuccessVerifiedEmailPage());
      case RouteGenerator.successVerificationMobile:
        return MaterialPageRoute(builder: (_) =>  const SuccessVerifiedMobilePage());
      case RouteGenerator.verificationMobilePage:
        return MaterialPageRoute(builder: (_) => const VerificationMobilePage());
      case RouteGenerator.verificationIDPage:
        return MaterialPageRoute(builder: (_) => const VerificationIDPage());
      case RouteGenerator.verificationAddressPage:
        return MaterialPageRoute(builder: (_) => const VerificationAddressPage());
      case RouteGenerator.getUserDetails:
        return MaterialPageRoute(builder: (_) => const UserDetailsPage());
      case RouteGenerator.mainTeamPage:
        return MaterialPageRoute(builder: (_) => const MainTeamPage());
      case RouteGenerator.mainUserManagementPage:
        return MaterialPageRoute(builder: (_) => const MainUserManagementPage());
      case RouteGenerator.editUserInformationPage:
        return MaterialPageRoute(builder: (_) => const EditUserInformation());
      case RouteGenerator.addBankAccountPage:
        return MaterialPageRoute(builder: (_) => const AddBankAccountPage());
      case RouteGenerator.chooseBankAccountPage:
        return MaterialPageRoute(builder: (_) => const ChooseBankAccountPage());
      case RouteGenerator.verificationAddBnkPage:
        return MaterialPageRoute(builder: (_) => const VerificationAddBnkPage());
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
        return MaterialPageRoute(builder: (_) => const VerificationAddRecipientPage());
      case RouteGenerator.verificationEditRecipient:
        return MaterialPageRoute(builder: (_) => const VerificationEditRecipientPage());
      case RouteGenerator.previewCashWithdrawalRecipient:
        return MaterialPageRoute(builder: (_) => PreviewWithdrawalCashPage());
      case RouteGenerator.previewBankWithdrawalStatus:
        return MaterialPageRoute(builder: (_) => const PreviewBankWithdrawalStatusPage());
      case RouteGenerator.previewCashWithdrawalStatus:
        return MaterialPageRoute(builder: (_) => const PreviewCashWithdrawalStatusPage());
      case RouteGenerator.notificationDetailsPage:
        return MaterialPageRoute(builder: (_) =>  const NotificationDetailsPage());
        default:
        throw const FormatException("Route not found");
    }
  }
}