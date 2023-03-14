import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talants_valley/resources/valuesManager.dart';

import '../../../resources/colors_manager.dart';
import '../../shared/customWidgets/balance_freelancer_wigdgets/header_card_balance.dart';
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
                onTap: () => showModalBottomSheet(
                    isScrollControlled: false,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(23.r),
                          topRight: Radius.circular(23.r)),
                    ),
                    context: context,
                    builder: (context) => const PayoutBottomSheet()),
              ),
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
                child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      WithdrawalCard(
                        withdrawalBalance: '200',
                        createdAt: "19 Aug, 12:30 AM",
                        status: 'Pending',
                        withdrawalFrom: 'Bank of Palestine',
                        onTap: () {},
                      ),
                      WithdrawalCard(
                        withdrawalBalance: '200',
                        createdAt: "19 Aug, 12:30 AM",
                        status: 'Sent',
                        withdrawalFrom: 'Bank of Palestine',
                        onTap: () {},
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
