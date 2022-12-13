import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/core/provider/verificationProvider.dart';
import 'package:talants_valley/ui/shared/customPages/customSuccessPage.dart';

import '../../../resources/assetsManager.dart';
import '../../../routing/navigations.dart';
import '../../../routing/router.dart';

class SuccessVerifiedEmailPage extends StatelessWidget {
  const SuccessVerifiedEmailPage({Key? key}) : super(key: key);

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
          onPressed: () {
            ServiceNavigations.serviceNavi
                .pushNamedAndRemoveUtils(RouteGenerator.forgetPassword);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Consumer<VerificationProvider>(
        builder: (context, verification, child) => CustomSuccessPage(
          caption: 'You Verified Your Email Successfully',
          textButtom: 'Continue',
          onPressed: () {
            verification.getUser();
          },
        ),
      ),
    );
  }
}
