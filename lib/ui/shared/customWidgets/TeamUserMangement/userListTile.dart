import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../resources/colors_manager.dart';
import '../../../../resources/valuesManager.dart';
class ListTileUser extends StatelessWidget {
  const ListTileUser({
    required this.fullName,
    required this.email,
    required this.balance,
    required this.leadingLatter,
    required this.onTap,
    required this.onPressedIcon,
    required this.isBlocked,
  });

  final String balance;
  final String fullName;
  final String email;
  final String leadingLatter;
  final void Function()? onTap;
  final void Function()? onPressedIcon;
  final bool isBlocked;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: AppSize.s7.h),
        // height: AppSize.s57.h,
        decoration: BoxDecoration(
            color: ColorManager.whiteColor,
            border: Border.all(
                color: ColorManager.mainBorderColor
            ),
            borderRadius: BorderRadius.all(Radius.circular(7.r)
            )
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.s10.w, vertical: AppSize.s12.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: isBlocked == false ? ColorManager.grayColor : ColorManager.mainBorderColor,
                radius: AppSize.s20.r,
                child: Text(leadingLatter, style: const TextStyle(color: ColorManager.whiteColor),),
              ),
              addHorizantelSpace(AppSize.s15.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(fullName, style: Theme.of(context).textTheme.bodyText2!.copyWith(fontWeight: FontWeight.bold,
                      color: isBlocked == false ? ColorManager.secondaryFontColor : ColorManager.mainBorderColor),),
                  Text(email, style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: isBlocked == false ? ColorManager.secondaryFontColor : ColorManager.mainBorderColor
                  ),),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  Text(r"$"+balance, style: Theme.of(context).textTheme.bodyText2!.copyWith(fontWeight: FontWeight.bold,
                  color:  isBlocked == false ? ColorManager.secondaryFontColor : ColorManager.mainBorderColor)),
                  Text("Not Verified", style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color:  isBlocked == false ? ColorManager.secondaryFontColor : ColorManager.mainBorderColor
                  ), ),
                ],
              ),

              IconButton(onPressed: onPressedIcon, icon: const Icon(Icons.more_vert, size: AppSize.s20,))
            ],
          ),
        ),
      ),
    );
  }
}
