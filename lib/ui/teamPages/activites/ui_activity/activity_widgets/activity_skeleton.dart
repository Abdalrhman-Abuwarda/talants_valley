import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:talants_valley/resources/colors_manager.dart';
import 'package:talants_valley/resources/values_manager.dart';
import 'package:talants_valley/ui/shared/customWidgets/skeleton_widget.dart';

class ActivitySkeleton extends StatelessWidget {
  const ActivitySkeleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorManager.labelFontColor,
      highlightColor: ColorManager.whiteColor,
      child: Container(
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
      ),
    );

  }
}