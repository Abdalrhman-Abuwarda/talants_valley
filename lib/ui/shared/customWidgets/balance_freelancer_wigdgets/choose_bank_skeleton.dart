import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../resources/valuesManager.dart';
import '../skeleton_widget.dart';

class ChooseBankCardSkeleton extends StatelessWidget {
   const ChooseBankCardSkeleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p22.w, vertical: AppPadding.p12.w ),
      height: AppSize.s110.h,
      child: Row(
        children: [
           Skeleton(height: AppSize.s80.h, width: AppSize.s80.h),
          addHorizontalSpace(AppSize.s60.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addVerticalSpace(AppSize.s10.h),
                Skeleton(width: AppSize.s80.w),
                SizedBox(height: AppSize.s8.w),
                Skeleton(width: AppSize.s200.w,),
                SizedBox(height: 8.h),
              ],
            ),
          )
        ],
      ),
    );
  }
}