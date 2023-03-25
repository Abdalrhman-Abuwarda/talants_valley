import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../resources/colors_manager.dart';
import '../../../../resources/valuesManager.dart';
import '../custom_contaner_widget.dart';

class InstructionsCashWithdrawalWidget extends StatelessWidget {
  const InstructionsCashWithdrawalWidget({
    required this.startingHour,
    required this.endHour,
    required this.address,
    required this.officeFees,
    Key? key,
  }) : super(key: key);

  final String address;
  final String officeFees;
  final String startingHour;
  final String endHour;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Instructions",
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: ColorManager.blackColor),
            ),
            addVerticalSpace(AppSize.s12.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.translate(
                  offset: Offset(0, 6.h),
                  child: CircleAvatar(
                    radius: 5.r,
                    backgroundColor: ColorManager.blackColor,
                  ),
                ),
                addHorizontalSpace(AppSize.s8.w),
                Text(
                  "Address: $address",
                  style: Theme.of(context).textTheme.headline5,
                )
              ],
            ),
            addVerticalSpace(AppSize.s15.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.translate(
                  offset: Offset(0, 6.h),
                  child: CircleAvatar(
                    radius: 5.r,
                    backgroundColor: ColorManager.blackColor,
                  ),
                ),
                addHorizontalSpace(AppSize.s8.w),
                Text(
                  "Working hours from  to ",
                  style: Theme.of(context).textTheme.headline5,
                )
              ],
            ),
            addVerticalSpace(AppSize.s15.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.translate(
                  offset: Offset(0, 6.h),
                  child: CircleAvatar(
                    radius: 5.r,
                    backgroundColor: ColorManager.blackColor,
                  ),
                ),
                addHorizontalSpace(AppSize.s8.w),
                Text(
                  "Bring your ID for identification",
                  style: Theme.of(context).textTheme.headline5,
                )
              ],
            ),
            addVerticalSpace(AppSize.s15.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.translate(
                  offset: Offset(0, 6.h),
                  child: CircleAvatar(
                    radius: 5.r,
                    backgroundColor: ColorManager.blackColor,
                  ),
                ),
                addHorizontalSpace(AppSize.s8.w),
                Text(
                  "Confirm receiving your payment",
                  style: Theme.of(context).textTheme.headline5,
                )
              ],
            ),
            addVerticalSpace(AppSize.s15.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.translate(
                  offset: Offset(0, 6.h),
                  child: CircleAvatar(
                    radius: 5.r,
                    backgroundColor: ColorManager.blackColor,
                  ),
                ),
                addHorizontalSpace(AppSize.s8.w),
                Text(
                  "Office fees $officeFees %",
                  style: Theme.of(context).textTheme.headline5,
                )
              ],
            ),
          ],
        ));
  }
}