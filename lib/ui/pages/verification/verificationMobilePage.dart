import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/core/provider/verificationProvider.dart';
import 'package:talants_valley/ui/shared/customPages/customOptPage.dart';

import '../../../core/data/local/sharedController.dart';
import '../../../resources/assets_manager.dart';
import '../../../routing/navigations.dart';
import '../../../routing/router.dart';
import '../../../utils/validate.dart';

class VerificationMobilePage extends StatelessWidget {
  VerificationMobilePage({Key? key}) : super(key: key);
  final TextEditingController _optMobileController = TextEditingController();

  var formKye = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ServiceNavigations.serviceNavi
                .pushNamedAndRemoveUtils(RouteGenerator.mainVerificationPage);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Form(
        key: formKye,
        child: Consumer<VerificationProvider>(
          builder: (context, verification, child) =>
              CustomOptPage(
                withImage: true,
                pathImage: ImageAssets.mobileSuccessImage,
                optController: _optMobileController,
                caption:
                'We have sent you a verification code to your mobile number ${SharedPrefController().getUser().mobile!.replaceRange(0, 9, "**********")}',
                buttomText: 'Verify',
                fotterText: "Didn't get the code? ",
                futterButtomText: 'Resend',
                onPressedButtom: () {
                  if (formKye.currentState!.validate()) {
                    verification.verificationMobile(code: _optMobileController.text);
                  }
                },
                onPressedTextButtom: () => verification.resendCodeMobile(),
                valedate: (value) => Validate.validateCode(value),
              ),
        ),
      ),
    );
  }
}
