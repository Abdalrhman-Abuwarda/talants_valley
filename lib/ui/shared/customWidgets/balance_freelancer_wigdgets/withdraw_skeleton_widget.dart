import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../resources/values_manager.dart';
import '../skeleton_widget.dart';

class WithdrawSkeleton extends StatelessWidget {
  const WithdrawSkeleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: AppPadding.p32.h),
      decoration: const BoxDecoration(

      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Skeleton(width: AppSize.s80.w),
              addVerticalSpace(AppSize.s8.h),
              Skeleton(width: AppSize.s120.w,),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Skeleton(width: AppSize.s60.w),
              addVerticalSpace(AppSize.s8.h),
              Skeleton(width: AppSize.s60.w,),
            ],
          ),
        ],
      ),
    );

  }
}