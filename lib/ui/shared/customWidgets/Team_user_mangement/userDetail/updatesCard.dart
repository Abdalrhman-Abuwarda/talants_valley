import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../resources/colors_manager.dart';
import '../../../../../resources/values_manager.dart';

class UpdatesCard extends StatelessWidget {
  UpdatesCard({
    required this.created,
    required this.lastLogin
});

  final String created;
  final String lastLogin;

  @override
  Widget build(BuildContext context) {
    TextStyle? titleCardStyle = Theme.of(context).textTheme.headline4;
    TextStyle? propertyCardStyle = Theme.of(context).textTheme.headline6;
    TextStyle? valueCardStyle = Theme.of(context).textTheme.headline5;

    return Container(
      padding: EdgeInsets.symmetric(vertical: AppPadding.p18.h, horizontal: AppPadding.p17.w),
      decoration: BoxDecoration(
          color: ColorManager.whiteColor,
          borderRadius: BorderRadius.circular(AppSize.s7.r),
          border: Border.all(
              color: ColorManager.mainBorderColor
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Text("Updates" ,style: titleCardStyle,)),
            ],
          ),
          addVerticalSpace(AppSize.s18.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Created", style: propertyCardStyle),
                  addVerticalSpace(AppSize.s10.h),
                  Text("Last Login", style: propertyCardStyle,),
                  addVerticalSpace(AppSize.s10.h),
                  Text("IP", style: propertyCardStyle,),
                  addVerticalSpace(AppSize.s10.h),
                  Text("Transfers", style: propertyCardStyle,),
                  addVerticalSpace(AppSize.s10.h),

                  addVerticalSpace(AppSize.s10.h),
                  addVerticalSpace(AppSize.s10.h),
                ],
              ),
              addHorizontalSpace(AppSize.s40.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(created, style: valueCardStyle,),
                  addVerticalSpace(AppSize.s10.h),
                  Text(lastLogin, style: valueCardStyle,),
                  addVerticalSpace(AppSize.s10.h),
                  Text("192.168.1.1", style: valueCardStyle,),
                  addVerticalSpace(AppSize.s10.h),
                  Row(
                    children: [
                      Text("Bank", style: valueCardStyle,),
                      addHorizontalSpace(AppSize.s18.w),
                      Text("0452 1044664 001 3000 000", style: propertyCardStyle,),
                    ],
                  ),
                  addVerticalSpace(AppSize.s10.h),
                  Row(
                    children: [
                      Text("Cash", style: valueCardStyle,),
                      addHorizontalSpace(AppSize.s18.w),
                      Text("Aldana Office - Gaza", style: propertyCardStyle ,),
                    ],
                  ),
                  addVerticalSpace(AppSize.s10.h),
                  addVerticalSpace(AppSize.s10.h),
                ],
              ),
              Spacer()
            ],
          )
        ],
      ),
    );
  }
}