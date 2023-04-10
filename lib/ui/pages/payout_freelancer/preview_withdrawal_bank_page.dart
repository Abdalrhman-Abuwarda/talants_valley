import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/core/data/local/shared_controller.dart';
import 'package:talants_valley/resources/assets_manager.dart';
import 'package:talants_valley/resources/values_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talants_valley/routing/navigations.dart';
import 'package:talants_valley/routing/router.dart';
import 'package:talants_valley/ui/shared/customWidgets/main_elevated_button.dart';

import '../../../core/provider/freelancer_provider/payout_freelancer_provider.dart';
import '../../../resources/colors_manager.dart';
import '../../shared/customWidgets/balance_freelancer_wigdgets/policy_withdrawal_widget.dart';
import '../../shared/customWidgets/balance_freelancer_wigdgets/preview_account_details_card.dart';
import '../../shared/customWidgets/balance_freelancer_wigdgets/transfer_amount_details.dart';

class PreviewWithdrawalBankPage extends StatelessWidget {
  PreviewWithdrawalBankPage({Key? key}) : super(key: key);

  final String amountToWithdraw = SharedPrefController().getAmountToWithdraw();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Withdrawal Preview",
        ),
        leading: IconButton(
            onPressed: () {
              ServiceNavigation.serviceNavi
                  .pushNamedReplacement(RouteGenerator.chooseBankAccountPage);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: Consumer<PayoutFreelancerProvider>(
        builder: (context, balance, child) => Padding(
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
                  child: Text(amountToWithdraw,
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700))),
              addVerticalSpace(AppSize.s12.h),
              const Text("Transferred to:",
                  style: TextStyle(color: Colors.grey, fontSize: 16)),
              addVerticalSpace(AppSize.s12.h),
              PreviewAccountDetailsCard(
                accountName: balance.bankAccountSelected!.accountName,
                accountNumber: balance.bankAccountSelected!.accountNumber,
                bankName: balance.bankAccountSelected!.bankName,
                assetIcon: IconAssets.bankIcon,
              ),
              const SizedBox(height: 12),
              TransferAmountDetails(
                fee: 'free',
                transferAmount: amountToWithdraw,
                youWillGet: amountToWithdraw,
              ),
              addVerticalSpace(AppSize.s12.h),
              const PolicyWithdrawalWidget(),
              addVerticalSpace(AppSize.s45.h),
              Center(
                child: SizedBox(
                    height: 44,
                    width: 326,
                    child: MainElevatedButton(
                      textColor: ColorManager.whiteColor,
                      onPressed: () => balance.requestBankWithdraw(
                        amount: int.parse(amountToWithdraw),
                        bankId: balance.bankAccountSelected!.id,
                      ),
                      isLoading: balance.isLoading,
                      text: 'Confirm',
                      isMain: true,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
