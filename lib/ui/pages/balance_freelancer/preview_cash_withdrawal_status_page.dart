import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/core/provider/freelancer_provider/withdraw_freelancer_provider.dart';
import 'package:talants_valley/resources/assets_manager.dart';
import 'package:talants_valley/resources/colors_manager.dart';
import 'package:talants_valley/resources/valuesManager.dart';
import 'package:talants_valley/routing/navigations.dart';
import 'package:talants_valley/ui/shared/customWidgets/custom_contaner_widget.dart';

import '../../shared/customWidgets/balance_freelancer_wigdgets/details_status_card.dart';
import '../../shared/customWidgets/balance_freelancer_wigdgets/header_cash_status_widget.dart';
import '../../shared/customWidgets/balance_freelancer_wigdgets/header_status_bank_widget.dart';
import '../../shared/customWidgets/balance_freelancer_wigdgets/instruction_bank_withdrawal.dart';
import '../../shared/customWidgets/balance_freelancer_wigdgets/instruction_cash_withdrawal.dart';

class PreviewCashWithdrawalStatusPage extends StatelessWidget {
  const PreviewCashWithdrawalStatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textStyle = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Withdrawal"),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            ServiceNavigation.serviceNavi.popFunction();
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p20.w),
          child: Consumer<WithdrawFreelancerProvider>(
            builder: (context, balance, child) => Column(
              children: [
                HeaderCashStatusWidget(
                  amount: balance.withdrawForPreview!.amount,
                  officeName: balance.withdrawForPreview!.office!.name,
                  status: balance.withdrawForPreview!.status,
                ),
                CustomContainer(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Timeline",
                      style: textStyle.headline4!
                          .copyWith(color: ColorManager.blackColor),
                    ),
                    addVerticalSpace(AppSize.s12.h),
                    Row(
                      children: [
                        Text(
                          "7:30 am",
                          style: textStyle.headline6,
                        ),
                        addHorizantelSpace(AppSize.s55.w),
                        Text(
                          "Requested",
                          style: textStyle.headline5,
                        ),
                      ],
                    ),
                    Text(
                      "Today",
                      style: textStyle.bodyText1,
                    ),
                  ],
                )),
                DetailsStatusCard(
                  accountName: balance.withdrawForPreview!.office!.name,
                  forBank: false,
                ),
                InstructionsCashWithdrawalWidget(address: balance.withdrawForPreview!.office!.address, officeFees: balance.withdrawForPreview!.office!.fees.toString(), ),
                addVerticalSpace(AppSize.s20.h),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.whiteColor,
                    ),
                    onPressed: () {},
                    child: Text(
                      "Cancel Withdrawal",
                      style: TextStyle(
                          fontSize: 16.sp, color: ColorManager.blackColor),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}


