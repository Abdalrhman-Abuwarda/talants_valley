import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/core/data/local/sharedController.dart';
import 'package:talants_valley/core/provider/authProvider.dart';
import 'package:talants_valley/core/provider/verificationProvider.dart';
import 'package:talants_valley/resources/colors_manager.dart';

import '../../../resources/assets_manager.dart';
import '../../../resources/valuesManager.dart';
import '../../../routing/navigations.dart';
import '../../../routing/router.dart';
import '../../../utils/validate.dart';
import '../../shared/customPages/customOptPage.dart';
import '../../shared/customWidgets/authWigdgets/authFooterPage.dart';
import '../../shared/customWidgets/mainTextFormField.dart';

class CheckEmailPage extends StatefulWidget {
  @override
  State<CheckEmailPage> createState() => _CheckEmailPageState();
}

class _CheckEmailPageState extends State<CheckEmailPage> {
  var formKye = GlobalKey<FormState>();

  final TextEditingController _optController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _optController.dispose();
    // Provider.of<AuthProvider>(context, listen: false).timer!.cancel();
  }
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
              ServiceNavigation.serviceNavi
                  .pushNamedAndRemoveUtils(RouteGenerator.forgetPassword);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Form(
          key: formKye,
          child: Consumer<AuthProvider>(
            builder: (context, auth, child) => CustomOptPage(
              optController: _optController,
              title: "Check Your Email",
              caption:
                  "We have sent you an email that contains a code to reset your password",
              buttonText: 'Continue',
              fotterText: "Didn't get the code?",
              futtarButtonText: 'Resend',
              onPressedButton: () {
                if (formKye.currentState!.validate()) {
                  auth.checkEmailPassword(
                      verificationCode: _optController.text);
                  // ServiceNavigations.serviceNavi.pushNamedAndRemoveUtils(RouteGenerator.createNewPassword);
                }
              },
              onPressedTextButton: () {
                auth.resendCode(
                    email: SharedPrefController().getForgetEmail());
                // auth.seconds = 120;
                // print("This is before");
                // auth.startTimer();
                // print("This is after");
              },
              validator: (value) => Validate.validateCode(value),
            ),
          ),
        ));
  }
}
