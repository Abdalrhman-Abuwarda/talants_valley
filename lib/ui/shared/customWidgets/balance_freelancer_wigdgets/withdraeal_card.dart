import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../resources/colors_manager.dart';
import '../../../../resources/valuesManager.dart';

class WithdrawalCard extends StatelessWidget {
  const WithdrawalCard({
    required this.withdrawalBalance,
    required this.createdAt,
    required this.status,
    required this.withdrawalFrom,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final String withdrawalBalance;
  final String createdAt;
  final String status;
  final String withdrawalFrom;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final TextStyle? bodyText = Theme.of(context).textTheme.bodyText2 ;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: AppPadding.p20.h),
        decoration: const BoxDecoration(

        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(withdrawalFrom , style: bodyText,),
                addVerticalSpace(AppSize.s10.h),
                Text(createdAt , style: Theme.of(context).textTheme.bodyText1,),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children:  [
                Text("\$ $withdrawalBalance", style: Theme.of(context).textTheme.headline3,),
                Text(status , style: bodyText!.copyWith(
                  color: status == "Pending" ? ColorManager.yellowColor : status == "Sent" ? ColorManager.blueColor : ColorManager.blackColor
                ) ,),
              ],
            )
          ],
        ),
      ),
    );
  }
}
