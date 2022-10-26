import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talants_valley/core/data/local/sharedController.dart';
import 'package:talants_valley/resources/colorsManager.dart';
import 'package:talants_valley/resources/valuesManager.dart';

import '../../shared/customWidgets/verificationWidgets/verificationListTile.dart';

class MainVerificationPage extends StatelessWidget {
  const MainVerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
        title: Text('Verification', style: Theme.of(context).textTheme.headline2,),
        leading: IconButton(onPressed: (){}, icon: const Icon(Icons.menu),),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            addVerticalSpace(AppSize.s28.h),
            Text('Hello,${SharedPrefController().getData().user.firstName}', style: Theme.of(context).textTheme.subtitle2,),
            addVerticalSpace(AppSize.s30.h),
            Text('To use our services, We need to verify your account', style: Theme.of(context).textTheme.subtitle1,),
            addVerticalSpace(AppSize.s40.h),
            // ignore: unrelated_type_equality_checks
            VerificationListTile(title: 'Email Address', suptitle: SharedPrefController().getData().user.email,hintSupTitel: SharedPrefController().getData().user.verifiedAddress == true ? "(verified)" : "(not verifieda)" ,onPressed: (){},),
            addVerticalSpace(AppSize.s12.h),
            VerificationListTile(title: 'Phone Number', suptitle: SharedPrefController().getData().user.mobile, hintSupTitel: SharedPrefController().getData().user.verifiedAddress == true ? "(verified)" : "(not verifieda)",onPressed: (){},),
            addVerticalSpace(AppSize.s12.h),
            Text('You can complete the 2 following tasks later', style: Theme.of(context).textTheme.bodyText2,),
            addVerticalSpace(AppSize.s12.h),
            VerificationListTile(title: 'Address Verification', suptitle: 'Identity card - Driver license - Passport', onPressed: (){},),
            addVerticalSpace(AppSize.s12.h),
            VerificationListTile(title: 'Phone Number', suptitle: 'Phone, Electricity, Water Bill - Bank statement', onPressed: (){},),
            addVerticalSpace(AppSize.s66.h),
            ElevatedButton(onPressed: (){}, child: Text('Continue'))
          ],
        ),
      ),
    );
  }
}

