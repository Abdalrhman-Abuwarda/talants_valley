import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/core/provider/auth_and_verification_provider/verification_provider.dart';
import 'package:talants_valley/resources/values_manager.dart';

import '../../../resources/assets_manager.dart';
import '../../../routing/navigations.dart';
import '../../../routing/router.dart';
import '../../shared/custom_pages/custom_success_page.dart';

class SuccessVerifiedMobilePage extends StatelessWidget {
  const SuccessVerifiedMobilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          ImageAssets.mainImage,
          height: AppSize.s28.h,
          width: AppSize.s85.w,
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
      body: Consumer<VerificationProvider>(
        builder: (context, verification, child) =>
            CustomSuccessPage(
              caption: 'You Verified Your Phone Number Successfully',
              textButton: 'Continue',
              onPressed: () {
                verification.getUser();
                ServiceNavigation.serviceNavi.pushNamedReplacement(RouteGenerator.mainVerificationPage);
              },
            ),
      ),
    );
  }
}
