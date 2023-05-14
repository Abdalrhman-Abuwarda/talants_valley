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
      baseColor: Colors.grey.shade400,
      highlightColor: ColorManager.whiteColor,
      child: Container(
        margin: const EdgeInsets.only(top: AppPadding.p5),
        height: AppSize.s60.h,
        padding: const EdgeInsets.all(AppPadding.p10),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s6.r),
            border: Border.all(color: ColorManager.mainBorderColor),
            color: Colors.transparent),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(AppPadding.p8),
              height: AppSize.s40.h,
              width: AppSize.s40.w,
              decoration: const BoxDecoration(
                  color: ColorManager.mainColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: ColorManager.unselectedAppBarColor,
                        offset: Offset(0, 2),
                        blurRadius: 6)
                  ]),
              child: const Skeleton(),
            ),
            addHorizontalSpace(AppSize.s10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Skeleton(width: AppSize.s90.w),
                Skeleton(width: MediaQuery.of(context).size.width * 0.5,),
              ],
            )
          ],
        ),
      )
    );

  }
}