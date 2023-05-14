import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talants_valley/resources/colors_manager.dart';
import 'package:talants_valley/resources/values_manager.dart';

class UserDashboardCard extends StatelessWidget {
  const UserDashboardCard({
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
                const Text("ID Approval - Ahmed Hassan"),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: AppSize.s33.w, vertical: AppSize.s4.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.s7.r),
                      border:Border.all(color: ColorManager.mainBorderColor , width: 1)
                  ),
                  child: InkWell(
                      onTap: (){},
                      child: const Text("View" ,)),
                ),
              ],
            ),
            const Align(
                alignment: Alignment.centerRight,
                child: Text("1000 SAR"))
          ],
        ),
      ),
    );
  }
}