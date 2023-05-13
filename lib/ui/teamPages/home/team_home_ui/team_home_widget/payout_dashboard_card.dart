import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talants_valley/resources/colors_manager.dart';
import 'package:talants_valley/resources/values_manager.dart';

class PayoutDashboardCard extends StatelessWidget {
  const PayoutDashboardCard({
    required this.officeName,
    required this.freeLancerName,
    Key? key,
  }) : super(key: key);

  final String officeName;
  final String freeLancerName;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
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
              children:  [
                Text(officeName),
               const Icon(Icons.copy , size: 17,)

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Text(freeLancerName),
                Text("\$500"),
                Text("10 Aug, 22")
              ],
            )
          ],
        ),
      ),
    );
  }
}