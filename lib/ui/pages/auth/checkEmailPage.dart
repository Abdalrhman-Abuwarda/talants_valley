import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:talants_valley/resources/colorsManager.dart';

import '../../../resources/assetsManager.dart';
import '../../../resources/valuesManager.dart';
import '../../../utils/validate.dart';
import '../../shared/customPages/customOptPage.dart';
import '../../shared/customWidgets/authWigdgets/authFooterPage.dart';
import '../../shared/customWidgets/mainTextFormField.dart';

class CheckEmailPage extends StatelessWidget {
  var formKye = GlobalKey<FormState>();
  final TextEditingController _optController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          ImageAssets.mainImage,
          height: 28.h,
          width: 85.w,
        ),
        backgroundColor: Colors.transparent,
        // leadingWidth: 30.w,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
        body: Form(
          key: formKye,
          child: CustomOptPage(optController: _optController,
          title: "Check Your Email",
          caption: "We have sent you an email that contains a code to reset your password",
          buttomText: 'Continue',
          fotterText: "Didn't get the code?",
          futterButtomText: 'Resend',),
        )
    );
  }
}


