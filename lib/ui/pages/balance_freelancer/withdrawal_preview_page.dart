import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/resources/valuesManager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/provider/freelancer_provider/balance_freelancer_provider.dart';
import '../../../resources/colors_manager.dart';
import '../../shared/customWidgets/balance_freelancer_wigdgets/plicy_withdrawal_widget.dart';
import '../../shared/customWidgets/balance_freelancer_wigdgets/preview_account_details_card.dart';
import '../../shared/customWidgets/balance_freelancer_wigdgets/transfer_amount_details.dart';


class WithdrawalPreviewPage extends StatelessWidget {
  const WithdrawalPreviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Withdrawal Preview",
        ),
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),

      body: Consumer<BalanceFreelancerProvider>(
        builder: (context ,balance, child) => Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addVerticalSpace(AppSize.s20.h),
               Align(
                  alignment: Alignment.center,
                  child: Text("Amount:",
                      style: Theme.of(context).textTheme.subtitle1)),
              addVerticalSpace(AppSize.s5.h),
              Align(
                  alignment: Alignment.center,
                  child: Text("300.00 USD",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700))),
              const SizedBox(height: 13),
              const Text("Transferred to:",
                  style: TextStyle(color: Colors.grey, fontSize: 16)),
              addVerticalSpace(AppSize.s12.h),
              PreviewAccountDetailsCard(accountName: 'Abdalrhman', accountNumber: '0452-1064559-001-3100-000', ),
              const SizedBox(height: 12),
              const TransferAmountDetails(fee: 'free', transferAmount: "400", youWillGet: '390',),
              addVerticalSpace(AppSize.s12.h),
              const PolicyWithdrawalWidget(),
              addVerticalSpace(AppSize.s45.h),
              Center(
                child: SizedBox(
                  height: 44,
                  width: 326,
                  child: ElevatedButton(
                    onPressed: () => balance.approvedWithdrawal(),
                    child: const Text(
                      "Continue",
                    ),
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


