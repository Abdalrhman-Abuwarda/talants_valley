import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../resources/assets_manager.dart';
import '../../../../resources/colors_manager.dart';
import '../../../../resources/valuesManager.dart';
import '../custom_contaner_widget.dart';

class HeaderStatusBankWidget extends StatelessWidget {
  const HeaderStatusBankWidget({
    required this.amount,
    required this.accountNumber,
    required this.bankName,
    required this.accountName,
    required this.status,
    Key? key,
  }) : super(key: key);

  final String amount;
  final String status;
  final String bankName;
  final String accountNumber;
  final String accountName;

  @override
  Widget build(BuildContext context) {
    final TextStyle? labelStyle = Theme.of(context).textTheme.labelMedium;

    return CustomContainer(
        child: Column(
          children: [
            Row(
              children: [
                Text("\$ $amount", style: Theme.of(context).textTheme.headline4!.copyWith(color: ColorManager.blackColor)),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(accountName, style: labelStyle!.copyWith(color: ColorManager.blackColor),),
                        addHorizantelSpace(AppSize.s10.w),
                        Text("[$bankName]" , style: labelStyle,)
                      ],
                    ),
                    Text(accountNumber , style: Theme.of(context).textTheme.headline6,),
                  ],
                ),
                const Spacer(),
                SvgPicture.asset(IconAssets.bankIcon)
              ],
            ),
          ],
        ));
  }
}
