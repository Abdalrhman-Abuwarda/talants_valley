import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/core/data/local/sharedController.dart';
import 'package:talants_valley/core/provider/verificationProvider.dart';
import 'package:talants_valley/ui/shared/customPages/customOptPage.dart';

import '../../../resources/assetsManager.dart';
import '../../../routing/navigations.dart';
import '../../../routing/router.dart';
import '../../../utils/validate.dart';

class VerificationEmailPage extends StatefulWidget {
   VerificationEmailPage({Key? key}) : super(key: key);

  @override
  State<VerificationEmailPage> createState() => _VerificationEmailPageState();
}

class _VerificationEmailPageState extends State<VerificationEmailPage> {
   var formKye = GlobalKey<FormState>();

   final TextEditingController _optController = TextEditingController();

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
                optController: _optController,
                caption: "We have sent you a verification code to your email ${SharedPrefController().getUser().email.replaceRange(0, 3, "****")}",
                withImage: true,
                pathImage: ImageAssets.emailImage,
                onPressedButtom: () {
                  if (formKye.currentState!.validate()) {
                    verification.verificationEmail(code: _optController.text);
                  }
                },
                buttomText: 'Verify',
                fotterText: "Didn't get the code?",
                futterButtomText: 'Resend',
                onPressedTextButtom: () => verification.resendCodeEmail(),
                valedate: (value) => Validate.validateCode(value),
              ),
        ),
      ),
    );
  }
}
