import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/core/data/local/sharedController.dart';
import 'package:talants_valley/core/provider/authProvider.dart';
import 'package:talants_valley/core/provider/verificationProvider.dart';
import 'package:talants_valley/resources/colorsManager.dart';
import 'package:talants_valley/resources/valuesManager.dart';

import '../../../routing/navigations.dart';
import '../../../routing/router.dart';
import '../../shared/customWidgets/verificationWidgets/verificationListTile.dart';

class MainVerificationPage extends StatefulWidget {
  MainVerificationPage({Key? key}) : super(key: key);

  @override
  State<MainVerificationPage> createState() => _MainVerificationPageState();
}


class _MainVerificationPageState extends State<MainVerificationPage> {
  var formKye = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final String verifiedID = SharedPrefController().getUser().verifiedId.status;
  final String verifiedAddress = SharedPrefController().getUser().verifiedAddress.status;
  final bool verifiedEmail = SharedPrefController().getUser().verifiedEmail;
  final bool verifiedMobile = SharedPrefController().getUser().verifiedMobile;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      key: _key ,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Verification',
          style: Theme.of(context).textTheme.headline2,
        ),
        leading: IconButton(
          onPressed: () {_key.currentState!.openDrawer();},
          icon: const Icon(Icons.menu),
        ),
      ),
      drawer: Drawer(
        child: Consumer<AuthProvider>(
          builder: (context, auth, child) =>
              ListView(
                children: [
                  ListTile(
                      onTap: (){
                        auth.logout();
                      },
                      title: Text("Logout"),
                      trailing: Icon(Icons.logout)
                  )
                ],
              ),
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
                    'Hello, ${SharedPrefController().getUser().firstName}',
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
                    textButton: "Verify",
                    title: 'Email Address',
                    supTitel: SharedPrefController().getUser().email,
                    hintSupTitel:
                    verifiedEmail == true
                        ? "(verified)"
                        : "(not verifieda)",
                    hintColor: verifiedEmail == true ? ColorManager.greenColor : ColorManager.redColor,
                    onPressed: () {
                      verification.sendCodeEmail();
                    },
                    isSuccess: verifiedEmail == true ? true : false,
                  ),
                  addVerticalSpace(AppSize.s12.h),
                  VerificationListTile(
                    textButton: "Verify",
                    title: 'Phone Number',
                supTitel: SharedPrefController()
                    .getUser()
                    .mobile
                    .replaceRange(4, 10, "******"),
                hintSupTitel:
                verifiedMobile == true
                        ? "(verified)"
                        : "(not verified)",
                    hintColor: verifiedMobile == true ? ColorManager.greenColor : ColorManager.redColor,
                    onPressed: () {
                      verification.sendCodeMobile();
                    },
                    isSuccess: verifiedMobile == true ? true : false,
                  ),
                  addVerticalSpace(AppSize.s12.h),
                  Text(
                    'You can complete the 2 following tasks later',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  addVerticalSpace(AppSize.s12.h),
                  VerificationListTile(
                    isSuccess: verifiedID == "approved" ? true : false,
                    title: 'ID Verification',
                    supTitel: 'Identity card - Driver license - Passport',
                    onPressed: verifiedID == "not_uploaded" ? verification.idVerifiedPressedFunction : verifiedID == "pending" ? null : verification.idVerifiedPressedFunction,
                    textButton: verifiedID == "not_uploaded" ? "Verify" : verifiedID == "pending" ? "Pending" : "Try Again",
                  ),
                  addVerticalSpace(AppSize.s12.h),
                  VerificationListTile(
                    isSuccess: verifiedAddress == "approved" ? true : false,
                    title: 'Address Verification',
                    supTitel: 'Phone, Electricity, Water Bill - Bank statement',
                    onPressed: verifiedAddress == "not_uploaded" ? verification.addressVerifiedPressedFunction : verifiedAddress == "pending" ? null : verification.addressVerifiedPressedFunction,
                    textButton: verifiedAddress == "not_uploaded" ? "Verify" : verifiedAddress == "pending" ? "Pending" : "Try Again",
                  ),
                  addVerticalSpace(AppSize.s66.h),
                  ElevatedButton(
                    onPressed:
                    verifiedMobile && verifiedEmail == true ? verification.mainOnPressedFunction : null,
                      child: Text('Continue'))
                ],
              ),
        ),
      ),
    );
  }
}
