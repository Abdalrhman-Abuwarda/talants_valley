import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/resources/valuesManager.dart';

import '../../../core/provider/freelancer_provider/balance_freelancer_provider.dart';
import '../../../resources/colors_manager.dart';
import '../../shared/customWidgets/balance_freelancer_wigdgets/header_card_balance.dart';
import '../../shared/customWidgets/balance_freelancer_wigdgets/status_withdrawal_bottom_sheet.dart';
import '../../shared/customWidgets/balance_freelancer_wigdgets/withdraeal_card.dart';
import '../../shared/customWidgets/balance_freelancer_wigdgets/payout_bottom_sheet.dart';

class HomeBalanceFreelancerPage extends StatelessWidget {
  const HomeBalanceFreelancerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Balance"),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderCardBalance(
                balance: '100',
                sheetPage: (context) => const PayoutBottomSheet()),

              addVerticalSpace(AppSize.s16.h),
              Text("Withdrawals",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(fontWeight: FontWeight.w600)),
              addVerticalSpace(AppSize.s10.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.p18.w),
                decoration: BoxDecoration(
                    color: ColorManager.whiteColor,
                    borderRadius: BorderRadius.circular(AppSize.s7.r),
                    border: Border.all(color: ColorManager.mainBorderColor)),
                child: Consumer<BalanceFreelancerProvider>(
                  builder: (context, balance, child) => ListView.builder(
                    itemCount: balance.withdrawals.length,
                    itemBuilder: (context , index) => WithdrawalCard(
                      withdrawalBalance: balance.withdrawals[index].balance,
                      createdAt: balance.withdrawals[index].createdAt,
                      status: balance.withdrawals[index].status,
                      withdrawalFrom: balance.withdrawals[index].withdrawalFrom,
                      sheetPage: (context) => StatusWithdrawalBottomSheet(withdrawal: balance.withdrawals[index],),
                    ) ,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
