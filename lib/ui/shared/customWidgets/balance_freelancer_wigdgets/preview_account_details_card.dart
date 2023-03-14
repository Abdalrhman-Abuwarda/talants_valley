import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../resources/assets_manager.dart';
import '../../../../resources/colors_manager.dart';
import '../../../../resources/valuesManager.dart';

class PreviewAccountDetailsCard extends StatelessWidget {
  PreviewAccountDetailsCard({
    required this.accountName,
    required this.accountNumber,
    Key? key,
  }) : super(key: key);

  final String accountName;
  final String accountNumber;


  @override
  Widget build(BuildContext context) {
    final TextStyle? subTitle = Theme.of(context).textTheme.subtitle1;
    return Container(
      // padding: EdgeInsetsDirectional.only(  start: AppPadding.p27.w, end: AppPadding.p12.w, top: AppPadding.p8.h),
      margin: EdgeInsetsDirectional.only(bottom: AppPadding.p12.h),
      height: AppSize.s110.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: ColorManager.whiteColor,
          borderRadius: BorderRadius.circular(AppSize.s7.r),
          border: Border.all(
              color:  ColorManager.mainBorderColor,
              width: 2)),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p25.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  IconAssets.bankIcon,
                  height: AppSize.s40.h,
                ),
                addHorizantelSpace(AppSize.s20.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Text(accountName, style: Theme.of(context).textTheme.headline4!.copyWith(color: ColorManager.blackColor),),
                      addHorizantelSpace(AppSize.s8.w),
                      Text("[Bank of Palestine]" , style: subTitle!.copyWith(color: ColorManager.grayColor),)
                    ]),
                    addVerticalSpace(AppSize.s10.h),
                    Text(accountNumber , style: Theme.of(context).textTheme.labelMedium!.copyWith(color: ColorManager.grayColor),),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
