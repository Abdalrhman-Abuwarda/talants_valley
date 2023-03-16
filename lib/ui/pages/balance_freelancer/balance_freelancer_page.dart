import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/resources/valuesManager.dart';

import '../../../core/provider/freelancer_provider/withdraw_freelancer_provider.dart';
import '../../../resources/colors_manager.dart';
import '../../shared/customWidgets/balance_freelancer_wigdgets/header_card_balance.dart';
import '../../shared/customWidgets/balance_freelancer_wigdgets/status_withdrawal_bottom_sheet.dart';
import '../../shared/customWidgets/balance_freelancer_wigdgets/withdraeal_card.dart';
import '../../shared/customWidgets/balance_freelancer_wigdgets/payout_bottom_sheet.dart';

class BalanceFreelancerPage extends StatefulWidget {
  const BalanceFreelancerPage({Key? key}) : super(key: key);

  @override
  State<BalanceFreelancerPage> createState() => _BalanceFreelancerPageState();
}

class _BalanceFreelancerPageState extends State<BalanceFreelancerPage> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<WithdrawFreelancerProvider>(context , listen: false).getWithdrawList();
    super.initState();
  }
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
                sheetPage: (context) =>  PayoutBottomSheet()),

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
                child: Consumer<WithdrawFreelancerProvider>(
                  builder: (context, balance, child) => ListView.builder(
                    itemCount: balance.withdrawals.length,
                    itemBuilder: (context , index) => WithdrawalCard(
                      withdrawalBalance: balance.withdrawals[index].amount.toString(),
                      createdAt: balance.withdrawals[index].createdAt,
                      status: balance.withdrawals[index].status,
                      withdrawalFrom: balance.withdrawals[index].bank == null ?balance.withdrawals[index].office!.name : balance.withdrawals[index].bank!.bankName,
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
