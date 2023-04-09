import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/core/data/local/shared_controller.dart';
import 'package:talants_valley/resources/valuesManager.dart';

import '../../../core/provider/freelancer_provider/payout_freelancer_provider.dart';
import '../../../resources/colors_manager.dart';
import '../../shared/customWidgets/balance_freelancer_wigdgets/header_card_balance.dart';
import '../../shared/customWidgets/balance_freelancer_wigdgets/status_withdrawal_bottom_sheet.dart';
import '../../shared/customWidgets/balance_freelancer_wigdgets/withdraeal_card.dart';
import '../../shared/customWidgets/balance_freelancer_wigdgets/payout_bottom_sheet.dart';
import '../../shared/customWidgets/balance_freelancer_wigdgets/withdraw_skeleton_widget.dart';

class BalanceFreelancerPage extends StatefulWidget {
  const BalanceFreelancerPage({Key? key}) : super(key: key);

  @override
  State<BalanceFreelancerPage> createState() => _BalanceFreelancerPageState();
}

class _BalanceFreelancerPageState extends State<BalanceFreelancerPage> {
  @override
  void initState() {
    // TODO: implement initState

    Provider.of<PayoutFreelancerProvider>(context, listen: false)
        .getWithdrawList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                  balance: SharedPrefController().getUser().balance,
                  sheetPage: (context) => const PayoutBottomSheet()),
              addVerticalSpace(AppSize.s16.h),
              Text("Withdrawals",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(fontWeight: FontWeight.w600)),
              addVerticalSpace(AppSize.s10.h),
              Consumer<PayoutFreelancerProvider>(
                builder: (context, balance, child) => balance.isLoading
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (context, index) =>
                            const WithdrawSkeleton())
                    : Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: AppPadding.p18.w),
                        decoration: BoxDecoration(
                            color: ColorManager.whiteColor,
                            borderRadius: BorderRadius.circular(AppSize.s7.r),
                            border: Border.all(
                                color: ColorManager.mainBorderColor)),
                        child: ListView.builder(
                          itemCount: balance.withdrawals.length,
                          itemBuilder: (context, index) {
                            final withdraw = balance.withdrawals[index];
                            return
                                WithdrawalCard(
                                  withdrawalBalance:
                                  withdraw.amount.toString(),
                                  createdAt: withdraw.createdAt,
                                  status: withdraw.status,
                                  withdrawalFrom:
                                  withdraw.bank == null
                                      ? withdraw.office!.name
                                      : withdraw.bank!
                                      .bankName,
                                  name: withdraw.bank == null
                                      ? withdraw.recipient!
                                      .name
                                      : withdraw.bank!
                                      .accountName,
                                  sheetPage: (context) =>
                                      StatusWithdrawalBottomSheet(
                                        withdrawal: balance.withdrawals[index],
                                      ),
                                )
                            ;
                          },
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
