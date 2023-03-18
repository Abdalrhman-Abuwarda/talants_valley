import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/core/model/freelancer/withdrawal_model.dart';
import 'package:talants_valley/core/provider/freelancer_provider/withdraw_freelancer_provider.dart';
import 'package:talants_valley/resources/assets_manager.dart';
import 'package:talants_valley/resources/colors_manager.dart';
import 'package:talants_valley/resources/valuesManager.dart';
import 'package:talants_valley/routing/navigations.dart';
import 'package:talants_valley/ui/shared/customWidgets/custom_contaner_widget.dart';
import 'package:talants_valley/ui/shared/customWidgets/main_elevated_button.dart';

import '../../shared/customWidgets/balance_freelancer_wigdgets/details_status_card.dart';
import '../../shared/customWidgets/balance_freelancer_wigdgets/header_status_bank_widget.dart';
import '../../shared/customWidgets/balance_freelancer_wigdgets/instruction_bank_withdrawal.dart';

class PreviewBankWithdrawalStatusPage extends StatelessWidget {
  const PreviewBankWithdrawalStatusPage({Key? key}) : super(key: key);

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
                HeaderStatusBankWidget(
                  amount: balance.withdrawForPreview!.amount,
                  accountNumber:
                      balance.withdrawForPreview!.bank!.accountNumber,
                  bankName: balance.withdrawForPreview!.bank!.bankName,
                  accountName: balance.withdrawForPreview!.bank!.accountName,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "7:30 am",
                              style: textStyle.headline6,
                            ),
                            Text(
                              "Today",
                              style: textStyle.bodyText1,
                            ),
                          ],
                        ),
                        Transform.translate(
                          offset: Offset(0, 5.h),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 4.r,
                                backgroundColor: ColorManager.blueColor,
                              ),
                              SizedBox(
                                height: AppSize.s40.h,
                                child: const VerticalDivider(
                                  thickness: 1,
                                  color: ColorManager.blueColor,
                                ),
                              )
                            ],
                          ),
                        ),
                        addHorizantelSpace(AppSize.s55.w),
                        Text(
                          "Requested",
                          style: textStyle.headline5,
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "7:30 am",
                              style: textStyle.headline6,
                            ),
                            Text(
                              "Today",
                              style: textStyle.bodyText1,
                            ),
                          ],
                        ),
                        Transform.translate(
                          offset: Offset(0, 5.h),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 4.r,
                                backgroundColor: ColorManager.blueColor,
                              ),
                              const VerticalDivider(
                                thickness: 1,
                                color: ColorManager.blueColor,
                              )
                            ],
                          ),
                        ),
                        addHorizantelSpace(AppSize.s55.w),
                        Text(
                          "Requested",
                          style: textStyle.headline5,
                        ),
                      ],
                    ),
                  ],
                )),
                DetailsStatusCard(
                  accountName: balance.withdrawForPreview!.bank!.accountName,
                ),
                if (balance.withdrawForPreview!.confirmDocument != null)
                  CustomContainer(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Transfer Screenshot",
                          style: textStyle.headline4!
                              .copyWith(color: ColorManager.blackColor)),
                      addVerticalSpace(AppSize.s12.h),
                      Row(
                        children: [
                          Text("Sent by", style: textStyle.headline6),
                          addHorizantelSpace(AppSize.s12.w),
                          const Text("Omar Ziara"),
                        ],
                      ),
                      SizedBox(
                        height: AppSize.s110.h,
                        child: Image.network(
                            balance.withdrawForPreview!.confirmDocument!),
                      )
                    ],
                  )),
                const InstructionsBankWithdrawal(),
                addVerticalSpace(AppSize.s20.h),
                MainElevatedButton(
                    textColor: ColorManager.blackColor,
                    onPressed: balance.withdrawForPreview!.status == "Requested" ? () {
                      balance.cancelWithdraw(
                          withdrawId: balance.withdrawForPreview!.id) ;
                    } : (){
                      balance.confirmWithdraw(id:  balance.withdrawForPreview!.id);
                    },
                    isLoading: balance.isLoading,
                    text: balance.withdrawForPreview!.status == "Requested" ?
                    "Cancel Withdrawal" : "Confirm Recipient",
                    isMain: false),

                addVerticalSpace(AppSize.s30.h)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
