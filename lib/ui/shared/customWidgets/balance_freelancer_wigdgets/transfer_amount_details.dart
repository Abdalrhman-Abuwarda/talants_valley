import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../resources/colors_manager.dart';
import '../../../../resources/values_manager.dart';

class TransferAmountDetails extends StatelessWidget {
  const TransferAmountDetails({
    required this.fee,
    required this.transferAmount,
    required this.youWillGet,
    Key? key,
  }) : super(key: key);

  final String transferAmount;
  final String fee;
  final String youWillGet;

  @override
  Widget build(BuildContext context) {
    final TextStyle? subTitle = Theme.of(context).textTheme.subtitle1;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 29, vertical: 18),
      // height: 95,
      width: 350,
      decoration: BoxDecoration(
          color: ColorManager.whiteColor,
          borderRadius: BorderRadius.circular(AppSize.s7.r),
          border: Border.all(
              color:  ColorManager.mainBorderColor,
              width: 2.w)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Text("Transfer amount" , style: subTitle,),
              Text("\$ $transferAmount" , style: subTitle,),
            ],
          ),
          addVerticalSpace(AppSize.s12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Text("Fee" , style: subTitle),
              Text(fee , style: subTitle),
            ],
          ),
          addVerticalSpace(AppSize.s8.h),
          const Divider(
            color: ColorManager.mainBorderColor,
            thickness: 1,
          ),
          addVerticalSpace(AppSize.s8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Text("You'll get" , style: subTitle),
              Text(
                "\$ $youWillGet",
                style: Theme.of(context).textTheme.headline4!.copyWith(color: ColorManager.blackColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
