import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talants_valley/resources/assets_manager.dart';
import 'package:talants_valley/resources/colors_manager.dart';
import 'package:talants_valley/resources/values_manager.dart';

class NotificationDetailsPage extends StatelessWidget {
  const NotificationDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p32.w),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        addVerticalSpace(AppSize.s55.h),
        Text(
          "Talent's Valley",
          style: textTheme.headline4!.copyWith(
            color: ColorManager.primaryFontColor,
          ),
        ),
        addVerticalSpace(AppSize.s22.h),
        Text("Welcome, Complete Verification Process",
            style: textTheme.subtitle1!
                .copyWith(color: ColorManager.primaryFontColor)),
        addVerticalSpace(AppSize.s50.h),
        SizedBox(
            height: AppSize.s24.h,
            width: AppSize.s70.h,
            child: Image.asset(ImageAssets.mainImage)),
        addVerticalSpace(AppSize.s25.h),
        const Divider(),
        addVerticalSpace(AppSize.s25.h),
        Text(
          "Hello Hadeel, \nWelcome to Talents Valley! You have successfully created an account",
          style: textTheme.headline5,
        ),
        addVerticalSpace(AppSize.s24.h),
        Text(
          "Complete your verification process and start creating your invoices.",
          style: textTheme.headline5,
        ),
        addVerticalSpace(AppSize.s14.h),
        Text(
          "If you have any questions reach out to us at talentsvalley@org",
          style: textTheme.headline5,
        ),
        addVerticalSpace(AppSize.s50.h),
        Text("From", style: textTheme.headline5!.copyWith(color: ColorManager.grayColor),),
        Text(
          "Team Talent's Valley",
          style: textTheme.headline5,
        ),
      ]),
    ));
  }
}
