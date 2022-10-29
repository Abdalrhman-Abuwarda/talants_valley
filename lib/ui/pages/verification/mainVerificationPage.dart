import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/core/data/local/sharedController.dart';
import 'package:talants_valley/core/provider/verificationProvider.dart';
import 'package:talants_valley/resources/colorsManager.dart';
import 'package:talants_valley/resources/valuesManager.dart';

import '../../../routing/navigations.dart';
import '../../../routing/router.dart';
import '../../shared/customWidgets/verificationWidgets/verificationListTile.dart';

class MainVerificationPage extends StatelessWidget {
  MainVerificationPage({Key? key}) : super(key: key);
  var formKye = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Verification',
          style: Theme.of(context).textTheme.headline2,
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p20.w),
        child: Consumer<VerificationProvider>(
          builder: (context, verification, child) =>
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addVerticalSpace(AppSize.s28.h),
                  Text(
                    'Hello, ${SharedPrefController().getData().user.firstName}',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  addVerticalSpace(AppSize.s30.h),
                  Text(
                    'To use our services, We need to verify your account',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  addVerticalSpace(AppSize.s40.h),
                  // ignore: unrelated_type_equality_checks
                  VerificationListTile(
                    title: 'Email Address',
                    suptitle: SharedPrefController().getData().user.email,
                    hintSupTitel:
                    SharedPrefController().getData().user.verifiedEmail == true
                        ? "(verified)"
                        : "(not verifieda)",
                    hintColor: SharedPrefController().getData().user.verifiedEmail == true ? ColorManager.greenColor : ColorManager.redColor,
                    onPressed: () {
                      verification.sendCodeEmail();
                    },
                    isSuccess: SharedPrefController().getData().user.verifiedEmail == true ? true : false,
                  ),
                  addVerticalSpace(AppSize.s12.h),
                  VerificationListTile(
                    title: 'Phone Number',
                    suptitle: SharedPrefController().getData().user.mobile,
                    hintSupTitel:
                    // ignore: unrelated_type_equality_checks
                    SharedPrefController().getData().user.verifiedMobile == true
                        ? "(verified)"
                        : "(not verifieda)",
                    hintColor: SharedPrefController().getData().user.verifiedMobile == true ? ColorManager.greenColor : ColorManager.redColor,
                    onPressed: () {
                      ServiceNavigations.serviceNavi.pushNamedAndRemoveUtils(
                          RouteGenerator.verificationMobilePage);
                    },
                    isSuccess: SharedPrefController().getData().user.verifiedMobile == true ? true : false,
                  ),
                  addVerticalSpace(AppSize.s12.h),
                  Text(
                    'You can complete the 2 following tasks later',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  addVerticalSpace(AppSize.s12.h),
                  VerificationListTile(
                    title: 'ID Verification',
                    suptitle: 'Identity card - Driver license - Passport',
                    onPressed: () {
                      ServiceNavigations.serviceNavi
                          .pushNamedAndRemoveUtils(RouteGenerator.verificationIDPage);
                    },
                  ),
                  addVerticalSpace(AppSize.s12.h),
                  VerificationListTile(
                    title: 'Address Verification',
                    suptitle: 'Phone, Electricity, Water Bill - Bank statement',
                    onPressed: () {
                      ServiceNavigations.serviceNavi.pushNamedAndRemoveUtils(
                          RouteGenerator.verificationAdressPage);
                    },
                  ),
                  addVerticalSpace(AppSize.s66.h),
                  ElevatedButton(
                    onPressed: verification.buttonVerificationFunction(formKye),
                      child: Text('Continue'))
                ],
              ),
        ),
      ),
    );
  }
}
