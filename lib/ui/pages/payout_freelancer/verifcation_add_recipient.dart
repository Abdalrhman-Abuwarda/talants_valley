import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/routing/navigations.dart';

import '../../../core/data/local/shared_controller.dart';
import '../../../core/provider/freelancer_provider/payout_freelancer_provider.dart';
import '../../../resources/assets_manager.dart';
import '../../../utils/validate_extension.dart';
import '../../shared/custom_pages/custom_otp_page.dart';

class VerificationAddRecipientPage extends StatefulWidget {
   const VerificationAddRecipientPage({Key? key}) : super(key: key);

  @override
  State<VerificationAddRecipientPage> createState() => _VerificationAddRecipientPageState();
}

class _VerificationAddRecipientPageState extends State<VerificationAddRecipientPage> {
  final TextEditingController _optMobileController = TextEditingController();

  var formKye = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<PayoutFreelancerProvider>(
      builder: (context, balance, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Image.asset(
            ImageAssets.mainImage,
            height: 28.h,
            width: 85.w,
          ),
          backgroundColor: Colors.transparent,
          // leadingWidth: 30.w,
          leading: IconButton(
            onPressed: () {
              balance.disposeTimer();
              ServiceNavigation.serviceNavi.popFunction();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKye,
            child:
            CustomOptPage(
              isLoading: balance.isLoading,
              withImage: true,
              pathImage: ImageAssets.mobileSuccessImage,
              optController: _optMobileController,
              caption:
              'We have sent you a verification code to your mobile number ${SharedPrefController().getUser().mobile!.replaceRange(0, 9, "**********")}',
              buttonText: 'Verify',
              fotterText: "Didn't get the code? ",
              futtarButtonText: 'Resend',
              onPressedButton: () {
                if (formKye.currentState!.validate()) {
                  balance.verificationAddRecipient( name: SharedPrefController().getNameRecipient(),code: _optMobileController.text, mobile: SharedPrefController().getMobileRecipient(), idNumber: SharedPrefController().getIdNumberRecipient());
                }
              },
              onPressedTextButton: () =>
                balance.resendCodeAddRecipient()
              ,
              validator: (value) => Validate.validateCode(value),
              minutes: balance.minutes.toString(),
              seconds: balance.seconds.toString(),
            ),
          ),
        ),
      ),
    );
  }
}
