import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../resources/colors_manager.dart';
import '../../../../resources/valuesManager.dart';
import '../custom_contaner_widget.dart';

class InstructionsBankWithdrawal extends StatelessWidget {
  const InstructionsBankWithdrawal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Instructions" , style: Theme.of(context).textTheme.headline4!.copyWith(color: ColorManager.blackColor),),
        addVerticalSpace(AppSize.s12.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Transform.translate(
              offset: Offset(0 , 6.h),
              child: CircleAvatar(
                radius: 5.r,
                backgroundColor: ColorManager.blackColor,
              ),
            ),
            addHorizantelSpace(AppSize.s8.w),
            Text("Open your bank account app to ensure \n payment delivery", style: Theme.of(context).textTheme.headline5,)
          ],
        ),
        addVerticalSpace(AppSize.s15.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Transform.translate(
              offset: Offset(0 , 6.h),
              child: CircleAvatar(
                radius: 5.r,
                backgroundColor: ColorManager.blackColor,
              ),
            ),
            addHorizantelSpace(AppSize.s8.w),
            Text("Open your bank account app to ensure \n payment delivery", style: Theme.of(context).textTheme.headline5,)
          ],
        ),
        addVerticalSpace(AppSize.s15.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Transform.translate(
              offset: Offset(0 , 6.h),
              child: CircleAvatar(
                radius: 5.r,
                backgroundColor: ColorManager.blackColor,
              ),
            ),
            addHorizantelSpace(AppSize.s8.w),
            Text("Open your bank account app to ensure \n payment delivery", style: Theme.of(context).textTheme.headline5,)
          ],
        ),
      ],
    ));
  }
}
