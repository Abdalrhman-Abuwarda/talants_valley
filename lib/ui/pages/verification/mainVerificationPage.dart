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
  final dataUser = SharedPrefController().getUser();


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
                    'Hello, ${dataUser.firstName}',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  addVerticalSpace(AppSize.s30.h),
                  Text(
                    'To use our services, We need to verify your account',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  addVerticalSpace(AppSize.s40.h),
                  // ignore: unrelated_type_equality_checks
                  //verification Email ListTile
                  VerificationListTile(
                    textButton: "Verify",
                    title: 'Email Address',
                    supTitel: dataUser.email,
                    hintSupTitel:
                    dataUser.verifiedEmail == true
                        ? "(verified)"
                        : "(not verified)",
                    hintColor: dataUser.verifiedEmail == true ? ColorManager.greenColor : ColorManager.redColor,
                    onPressed: () {
                      verification.sendCodeEmail();
                    },
                    isSuccess: dataUser.verifiedEmail == true ? true : false,
                  ),
                  addVerticalSpace(AppSize.s12.h),

                  //Verification phone number ListTile
                  VerificationListTile(
                    textButton: "Verify",
                    title: 'Phone Number',
                supTitel: dataUser.mobile
                    .replaceRange(4, 10, "******"),
                hintSupTitel:
                dataUser.verifiedMobile == true
                        ? "(verified)"
                        : "(not verified)",
                    hintColor: dataUser.verifiedMobile == true ? ColorManager.greenColor : ColorManager.redColor,
                    onPressed: () {
                      verification.sendCodeMobile();
                    },
                    isSuccess: dataUser.verifiedMobile == true ? true : false,
                  ),
                  addVerticalSpace(AppSize.s12.h),
                  Text(
                    'You can complete the 2 following tasks later',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  addVerticalSpace(AppSize.s12.h),

                  //verification ID ListTile
                  VerificationListTile(
                    isSuccess: dataUser.verifiedId.status == "approved" ? true : false,
                    title: 'ID Verification',
                    supTitel: 'Identity card - Driver license - Passport',
                    rejectedHint: dataUser.verifiedId.status == "rejected" ? "Rejected" : "",
                    onPressed: dataUser.verifiedId.status == "not_uploaded" ? verification.idVerifiedPressedFunction : dataUser.verifiedId.status == "pending" ? null : verification.idVerifiedPressedFunction,
                    textButton: dataUser.verifiedId.status == "not_uploaded" ? "Verify" : dataUser.verifiedId.status == "pending" ? "Pending" : "Try Again",
                  ),
                  addVerticalSpace(AppSize.s12.h),

                  //verification address listTile
                  VerificationListTile(
                    isSuccess: dataUser.verifiedAddress.status == "approved" ? true : false,
                    title: 'Address Verification',
                    supTitel: 'Phone, Electricity, Water Bill - Bank statement',
                    rejectedHint: dataUser.verifiedAddress.status == "rejected" ? "Rejected" : "",
                    onPressed: dataUser.verifiedAddress.status == "not_uploaded" ? verification.addressVerifiedPressedFunction : dataUser.verifiedAddress.status == "pending" ? null : verification.addressVerifiedPressedFunction,
                    textButton: dataUser.verifiedAddress.status == "not_uploaded" ? "Verify" : dataUser.verifiedAddress.status == "pending" ? "Pending" : "Try Again",
                  ),
                  addVerticalSpace(AppSize.s66.h),
                  ElevatedButton(
                    onPressed:
                    dataUser.verifiedMobile && dataUser.verifiedEmail == true ? verification.mainOnPressedFunction : null,
                      child: Text('Continue'))
                ],
              ),
        ),
      ),
    );
  }
}
