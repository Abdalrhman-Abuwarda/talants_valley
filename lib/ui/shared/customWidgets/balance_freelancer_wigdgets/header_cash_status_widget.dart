import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../resources/assets_manager.dart';
import '../../../../resources/colors_manager.dart';
import '../../../../resources/values_manager.dart';
import '../custom_contaner_widget.dart';

class HeaderCashStatusWidget extends StatelessWidget {
  const HeaderCashStatusWidget({
    required this.amount,
    required this.officeName,
    required this.status,
    Key? key,
  }) : super(key: key);

  final String amount;
  final String officeName;
  final String status;



  @override
  Widget build(BuildContext context) {
    final TextTheme textStyle = Theme.of(context).textTheme;
    return CustomContainer(
        child: Column(
          children: [
            Row(
              children: [
                Text("\$ $amount",
                    style: textStyle.headline4!
                        .copyWith(color: ColorManager.blackColor)),
                const Spacer(),
                Container(
                  width: AppSize.s75.h,
                  height: AppSize.s22.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF9F0),
                    borderRadius: BorderRadius.circular(AppSize.s30.r),
                    border: Border.all(color: const Color(0xFFF3F3F3)),
                  ),
                  child: Center(
                      child: Text(
                        status,
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontFamily: "Segoe UI",
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFDAA545)),
                      )),
                )
              ],
            ),
            addVerticalSpace(AppSize.s15.h),
            const Divider(),
            Row(
              children: [
                Text(
                  officeName,
                  style: textStyle.headline4!
                      .copyWith(color: ColorManager.blackColor),
                ),
                const Spacer(),
                SvgPicture.asset(IconAssets.cashIcon)
              ],
            ),
          ],
        ));
  }
}
