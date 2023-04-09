import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/routing/navigations.dart';

import '../../../core/data/local/shared_controller.dart';
import '../../../core/provider/freelancer_provider/payout_freelancer_provider.dart';
import '../../../resources/assets_manager.dart';
import '../../../utils/validate_extension.dart';
import '../../shared/customPages/customOptPage.dart';

class VerificationEditRecipientPage extends StatefulWidget {
  const VerificationEditRecipientPage({Key? key}) : super(key: key);

  @override
  State<VerificationEditRecipientPage> createState() => _VerificationEditRecipientPageState();
}

class _VerificationEditRecipientPageState extends State<VerificationEditRecipientPage> {
  final TextEditingController _optMobileController = TextEditingController();

  var formKye = GlobalKey<FormState>();
  SharedPrefController sharedPref = SharedPrefController();

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
              ServiceNavigation.serviceNavi.popFunction();
              balance.disposeTimer();
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
                  balance.updateRecipient(code: _optMobileController.text,  mobile: sharedPref.getMobileRecipient(), idNumber: sharedPref.getIdNumberRecipient(), name: sharedPref.getNameRecipient(), id: sharedPref.getIdRecipient());
                }
              },
              onPressedTextButton: () => balance.resendCodeAddRecipient(),
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
