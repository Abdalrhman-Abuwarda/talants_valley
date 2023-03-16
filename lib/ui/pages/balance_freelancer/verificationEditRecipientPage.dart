import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/data/local/sharedController.dart';
import '../../../core/provider/freelancer_provider/withdraw_freelancer_provider.dart';
import '../../../resources/assets_manager.dart';
import '../../../utils/validate.dart';
import '../../shared/customPages/customOptPage.dart';

class VerificationEditRecipientPage extends StatefulWidget {
  VerificationEditRecipientPage({Key? key}) : super(key: key);

  @override
  State<VerificationEditRecipientPage> createState() => _VerificationEditRecipientPageState();
}

class _VerificationEditRecipientPageState extends State<VerificationEditRecipientPage> {
  final TextEditingController _optMobileController = TextEditingController();

  var formKye = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<WithdrawFreelancerProvider>(
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
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKye,
            child:
            CustomOptPage(
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
                  balance.updateRecipient(code: _optMobileController.text, id: "", mobile: "SharedPrefController().getMobileRecipient()", idNumber: "SharedPrefController().getIdNumberRecipient()", name: "SharedPrefController().getNameRecipient()");
                }
              },
              onPressedTextButton: () => balance.resendCode(),
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
