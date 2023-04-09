import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/core/provider/freelancer_provider/payout_freelancer_provider.dart';
import 'package:talants_valley/resources/colors_manager.dart';
import 'package:talants_valley/utils/time_extension.dart';
import '../../../../core/model/freelancer/payout/withdrawal_model.dart';
import '../../../../resources/assets_manager.dart';
import '../../../../resources/valuesManager.dart';
import '../../../../routing/navigations.dart';
import '../../second_custom_buttom.dart';

class StatusWithdrawalBottomSheet extends StatelessWidget {
  const StatusWithdrawalBottomSheet({
    Key? key,
    required this.withdrawal,
  }) : super(key: key);

  final WithdrawModel withdrawal;

  @override
  Widget build(BuildContext context) {
    return Consumer<PayoutFreelancerProvider>(
      builder: (context , balance , child) => Container(
        padding: EdgeInsetsDirectional.only(
          top: AppPadding.p5.h,
          start: AppPadding.p32.w,
          end: AppPadding.p32.w,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        height: AppSize.s250.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Divider(
                color: ColorManager.mainBorderColor,
                thickness: 4,
                indent: MediaQuery.of(context).size.width * 0.30,
                endIndent: MediaQuery.of(context).size.width * 0.30,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  IconAssets.pendingIcon,
                  height: AppSize.s40.h,
                ),
                addHorizontalSpace(AppSize.s10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      withdrawal.status,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Text(
                      "Estimate.: 24 Hours",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                ),
                const Spacer(),
                Text(withdrawal.createdAt.convertToFullDate()!, ),
              ],
            ),
            addVerticalSpace(AppSize.s20.h),
            addVerticalSpace(AppSize.s10.h),
            Row(
              children: [
                Text(withdrawal.bank == null ? withdrawal.recipient!.name : withdrawal.bank!.accountName ,style: Theme.of(context).textTheme.headline4!.copyWith(color: ColorManager.blackColor),),
                addHorizontalSpace(AppSize.s10.w),
                Expanded(child: Text(withdrawal.bank == null ? withdrawal.office!.name : withdrawal.bank!.bankName, overflow: TextOverflow.ellipsis , style: Theme.of(context).textTheme.headline4)),
                const Spacer(),
                Text("\$ ${withdrawal.amount}" , style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, fontFamily: "Segoe UI", color: ColorManager.blackColor),),
              ],
            ),
            addVerticalSpace(AppSize.s8.h),
            Row(
              children: [
                Text(withdrawal.bank == null ? withdrawal.office!.address : withdrawal.bank!.accountNumber, style: Theme.of(context).textTheme.headline6, ),
                const Spacer(),
                Text(withdrawal.bank == null ? "3.3" : "no fees",  style: Theme.of(context).textTheme.headline6)
              ],
            ),
            addVerticalSpace(AppSize.s25.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: 160.w,
                    height: AppSize.s40.h,
                    child: SecondCustomButton(
                      isLoading: false,
                      text: "Done",
                      onPressed: () {
                        ServiceNavigation.serviceNavi.popFunction();
                      },
                    )),
                SizedBox(
            width: 160.w,
                    height: AppSize.s40.h,
                    child: SecondCustomButton(
                      isLoading: balance.secondLoading,
                  text: "Show more",
                  onPressed: () {
                        balance.getWithdrawDetails(withdrawId: withdrawal.id);
                  },
                )),

              ],
            )
          ],
        ),
      ),
    );
  }
}
