import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talants_valley/resources/valuesManager.dart';
import 'package:talants_valley/ui/shared/customPages/customSuccessPage.dart';

import '../../../resources/assetsManager.dart';
import '../../../routing/navigations.dart';
import '../../../routing/router.dart';

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
            ServiceNavigations.serviceNavi
                .pushNamedAndRemoveUtils(RouteGenerator.forgetPassword);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: CustomSuccessPage(
        caption: 'You Verified Your Phone Number Successfully',
        textButtom: 'Continue',
        onPressed: () {ServiceNavigations.serviceNavi
            .pushNamedAndRemoveUtils(RouteGenerator.mainVerificationPage);
        },
      ),
    );
  }
}
