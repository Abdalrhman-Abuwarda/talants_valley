import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../resources/assets_manager.dart';
import '../../../../resources/colors_manager.dart';
import '../../../../resources/valuesManager.dart';

class HeaderCardBalance extends StatelessWidget {
  const HeaderCardBalance({
    required this.balance,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final String balance;
  final void Function()? onTap;


  @override
  Widget build(BuildContext context) {
    final TextStyle? labelMedium = Theme.of(context).textTheme.labelMedium;
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: AppPadding.p22.h, horizontal: AppPadding.p18.w),
      decoration: BoxDecoration(
          color: ColorManager.whiteColor,
          borderRadius: BorderRadius.circular(AppSize.s7.r),
          border: Border.all(color: ColorManager.mainBorderColor)),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text("Current Balance", style: labelMedium,),
              Text("\$ $balance" , style: Theme.of(context).textTheme.subtitle1!.copyWith(fontWeight: FontWeight.w600),)
            ],
          ),
          const Spacer(),
          InkWell(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: AppPadding.p27.w),
              width: AppSize.s140.w,
              height: AppSize.s35.h,
              decoration: BoxDecoration(
                  color: ColorManager.whiteColor,
                  borderRadius: BorderRadius.circular(AppSize.s7.r),
                  border: Border.all(color: ColorManager.mainBorderColor)),
              child: Row(
                children: [
                  SvgPicture.asset(IconAssets.withdrawIcon),
                  addHorizantelSpace(AppSize.s8.w),
                  Text("Withdraw", style: labelMedium!.copyWith(color: ColorManager.blueColor),)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
