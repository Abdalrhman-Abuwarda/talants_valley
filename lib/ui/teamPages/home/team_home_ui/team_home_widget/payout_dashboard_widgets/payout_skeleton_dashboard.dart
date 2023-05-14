import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:talants_valley/resources/colors_manager.dart';
import 'package:talants_valley/resources/values_manager.dart';
import 'package:talants_valley/ui/shared/customWidgets/skeleton_widget.dart';

class PayoutSkeletonDashboard extends StatelessWidget {
  const PayoutSkeletonDashboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade400,
        highlightColor: ColorManager.whiteColor,
        child: ClipPath(
          clipper: const ShapeBorderClipper(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(AppSize.s7),
                      bottomRight: Radius.circular(AppSize.s7)))),
          child: Container(
            margin: EdgeInsets.only(bottom: AppSize.s6.h),
            padding: EdgeInsets.symmetric(
                horizontal: AppPadding.p25.w, vertical: AppPadding.p14),
            height: AppSize.s75.h,
            decoration: const BoxDecoration(
              // color: ColorManager.whiteColor,
              border: Border(
                left: BorderSide(color: ColorManager.blueColor, width: 3),
              ),
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    Skeleton(width: AppSize.s90.w),
                    Container(
                      height: AppSize.s20,
                      width: AppSize.s20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSize.s6),
                      ),
                      child: const Skeleton(),
                    )

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    Skeleton(width: AppSize.s60.w),
                    Skeleton(width: AppSize.s30.w),
                    Skeleton(width: AppSize.s45.w)
                  ],
                )
              ],
            ),
          ),
        )
    );

  }
}