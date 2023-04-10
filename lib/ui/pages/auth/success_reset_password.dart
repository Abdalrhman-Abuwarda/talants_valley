import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../resources/assets_manager.dart';
import '../../../routing/navigations.dart';
import '../../../routing/router.dart';
import '../../shared/custom_pages/custom_success_page.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({Key? key}) : super(key: key);

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
      body: CustomSuccessPage(
        withTitle: true,
        title: 'Password Reset',
        caption:
            "Your Password has been Successfully Reset Click below to Login",
        textButton: 'Login',
        onPressed: () {
          ServiceNavigation.serviceNavi
              .pushNamedWidget(RouteGenerator.signInPage);
        },
      ),
    );
  }
}
