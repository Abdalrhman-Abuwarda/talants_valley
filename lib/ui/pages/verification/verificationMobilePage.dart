import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/core/provider/auth_and_verification_provider/verificationProvider.dart';
import 'package:talants_valley/ui/shared/customPages/customOptPage.dart';

import '../../../core/data/local/shared_controller.dart';
import '../../../resources/assets_manager.dart';
import '../../../routing/navigations.dart';
import '../../../routing/router.dart';
import '../../../utils/validate_extension.dart';

class VerificationMobilePage extends StatefulWidget {
  VerificationMobilePage({Key? key}) : super(key: key);

  @override
  State<VerificationMobilePage> createState() => _VerificationMobilePageState();
}

class _VerificationMobilePageState extends State<VerificationMobilePage> {
  final TextEditingController _optMobileController = TextEditingController();

  var formKye = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<VerificationProvider>(context,listen: false).startTimer();
    super.initState();
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
                isLoading: false,
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
                    verification.verificationMobile(code: _optMobileController.text);
                  }
                },
                onPressedTextButton: () => verification.resendCodeMobile(),
                validator: (value) => Validate.validateCode(value), minutes: verification.minutes.toString(), seconds: verification.seconds.toString(),
              ),
        ),
      ),
    );
  }
}
