import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../resources/assets_manager.dart';
import '../../../../resources/colors_manager.dart';
import '../../../../resources/valuesManager.dart';

class BankAccountCardWidget extends StatelessWidget {
   BankAccountCardWidget({
    required this.accountName,
    required this.accountNumber,
    required this.onPressedIcon,
    required this.onTap,
    this.isSelected = false,
    Key? key,
  }) : super(key: key);

  final String accountName;
  final String accountNumber;
  final void Function()? onPressedIcon;
  bool isSelected ;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        // padding: EdgeInsetsDirectional.only(  start: AppPadding.p27.w, end: AppPadding.p12.w, top: AppPadding.p8.h),
        margin: EdgeInsetsDirectional.only(bottom: AppPadding.p12.h),
        height: AppSize.s110.h,
        width: double.infinity,
        decoration: BoxDecoration(
            color: ColorManager.whiteColor,
            borderRadius: BorderRadius.circular(AppSize.s7.r),
            border: Border.all(color: isSelected == false ? ColorManager.mainBorderColor : ColorManager.blueColor , width: 2)
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(onPressed: onPressedIcon, icon: const Icon(Icons.cancel)),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: AppPadding.p25.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(IconAssets.bankIcon , height: AppSize.s40.h,),
                  addHorizantelSpace(AppSize.s20.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(accountName),
                      addVerticalSpace(AppSize.s10.h),
                      Text(accountNumber),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}