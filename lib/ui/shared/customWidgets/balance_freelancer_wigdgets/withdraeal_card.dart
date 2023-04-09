import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talants_valley/utils/time_extension.dart';
import 'package:talants_valley/utils/validate_extension.dart';

import '../../../../resources/colors_manager.dart';
import '../../../../resources/valuesManager.dart';

class WithdrawalCard extends StatelessWidget {
  WithdrawalCard({
    required this.name,
    required this.withdrawalBalance,
    required this.createdAt,
    required this.status,
    required this.withdrawalFrom,
    required this.sheetPage,
    Key? key,
  }) : super(key: key);

  final String withdrawalBalance;
  final String createdAt;
  final String status;
  final String withdrawalFrom;
  final String name;
  Widget Function(BuildContext) sheetPage;
  @override
  Widget build(BuildContext context) {
    final TextStyle? bodyText = Theme.of(context).textTheme.bodyText2 ;
    final TextTheme textStyle = Theme.of(context).textTheme;
    return InkWell(
      onTap: ()=> showModalBottomSheet(
      isScrollControlled: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(23.r),
            topRight: Radius.circular(23.r)),
      ),
      context: context,
      builder: sheetPage,),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: AppPadding.p20.h),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: ColorManager.mainBorderColor))
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name , style: textStyle.labelMedium!.copyWith(color: ColorManager.blackColor),),
                addVerticalSpace(AppSize.s10.h),
                Row(
                  children: [
                    Text(withdrawalFrom , style: textStyle.headline5,),
                    addHorizontalSpace(AppSize.s16.w),
                    Text("${createdAt.convertToDate()}, ${createdAt.convertToTime()}" , style: Theme.of(context).textTheme.bodyText1,),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children:  [
                Text("\$ $withdrawalBalance", style: textStyle.headline3,),
                status != "canceled" ?
                Text(status , style: bodyText!.copyWith(
                  color: status == "pending" ? ColorManager.yellowColor : status == "sent" ? ColorManager.blueColor : ColorManager.blackColor
                ) ,) : Text(status , style: TextStyle(decoration: TextDecoration.lineThrough, fontSize: 13.sp, color: ColorManager.thirdFontColor , fontWeight: FontWeight.normal, fontFamily: "Segoe UI") ,),
              ],
            )
          ],
        ),
      ),
    );
  }
}
