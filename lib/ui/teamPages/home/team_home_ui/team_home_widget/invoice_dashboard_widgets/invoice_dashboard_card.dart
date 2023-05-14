import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talants_valley/resources/colors_manager.dart';
import 'package:talants_valley/resources/values_manager.dart';

class InvoiceDashboardCard extends StatelessWidget {
  const InvoiceDashboardCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: const ShapeBorderClipper(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topRight: Radius.circular(AppSize.s7), bottomRight: Radius.circular(AppSize.s7)))),
      child: Container(
        margin: EdgeInsets.only(bottom: AppSize.s6.h),
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p25.w, vertical: AppPadding.p14),
        height: AppSize.s75.h,
        decoration: const BoxDecoration(
          color: ColorManager.whiteColor,
          border: Border(
            left: BorderSide(color: ColorManager.blueColor, width: 3),
          ),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: AppPadding.p8.w, vertical: AppPadding.p2.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.s7.r),
                      border:Border.all(color: ColorManager.mainBorderColor , width: 1)
                  ),
                  child: const Text("Invoice"),
                ),
                const Text("12:30 AM")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Omar Ziara Asks for Approval"),
                Text("1000 SAR")
              ],
            )
          ],
        ),
      ),
    );
  }
}
