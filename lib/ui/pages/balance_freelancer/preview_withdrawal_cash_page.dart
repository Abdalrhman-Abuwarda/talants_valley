import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/resources/assets_manager.dart';
import 'package:talants_valley/ui/shared/customWidgets/main_elevated_button.dart';

import '../../../core/data/local/sharedController.dart';
import '../../../core/provider/freelancer_provider/withdraw_freelancer_provider.dart';
import '../../../resources/colors_manager.dart';
import '../../../resources/valuesManager.dart';
import '../../../routing/navigations.dart';
import '../../../routing/router.dart';
import '../../shared/customWidgets/balance_freelancer_wigdgets/policy_withdrawal_widget.dart';
import '../../shared/customWidgets/balance_freelancer_wigdgets/preview_account_details_card.dart';
import '../../shared/customWidgets/balance_freelancer_wigdgets/transfer_amount_details.dart';

class PreviewWithdrawalCashPage extends StatelessWidget {
  PreviewWithdrawalCashPage({Key? key}) : super(key: key);
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
              ServiceNavigation.serviceNavi.pushNamedReplacement(RouteGenerator.chooseOfficePage);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),

      body: Consumer<WithdrawFreelancerProvider>(
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
                  child: Text(amountToWithdraw,
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700))),
              addVerticalSpace(AppSize.s12.h),
              const Text("Transferred to:",
                  style: TextStyle(color: Colors.grey, fontSize: 16)),
              addVerticalSpace(AppSize.s12.h),
            Container(
              // padding: EdgeInsetsDirectional.only(  start: AppPadding.p27.w, end: AppPadding.p12.w, top: AppPadding.p8.h),
              margin: EdgeInsetsDirectional.only(bottom: AppPadding.p12.h),
              height: AppSize.s110.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: ColorManager.whiteColor,
                  borderRadius: BorderRadius.circular(AppSize.s7.r),
                  border: Border.all(
                      color:  ColorManager.mainBorderColor,
                      width: 2)),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppPadding.p25.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          IconAssets.officeIcon,
                          height: AppSize.s40.h,
                        ),
                        addHorizantelSpace(AppSize.s20.w),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(balance.officeSelected!.name, style: Theme.of(context).textTheme.headline4!.copyWith(color: ColorManager.blackColor),),
                            // addVerticalSpace(AppSize.s10.h),
                            Text(balance.officeSelected!.address , style: Theme.of(context).textTheme.labelMedium!.copyWith(color: ColorManager.grayColor),),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
              // PreviewAccountDetailsCard(accountName: balance.officeSelected!.name, accountNumber: "", bankName: balance.officeSelected!.address, assetIcon: IconAssets.officeIcon,),
              const SizedBox(height: 12),
              TransferAmountDetails(fee: 'free', transferAmount: amountToWithdraw, youWillGet: amountToWithdraw,),
              addVerticalSpace(AppSize.s12.h),
              const PolicyWithdrawalWidget(),
              addVerticalSpace(AppSize.s45.h),
              Center(
                child: MainElevatedButton(textColor: ColorManager.whiteColor, text: "Continue",
                  onPressed: () { balance.requestCashWithdraw(amount: SharedPrefController().getAmountToWithdraw(), officeId: balance.officeSelected!.id, recipientId: balance.recipientSelected!.id ?? ""); },
                isLoading: balance.isLoading,
                isMain: true,),
                // child: SizedBox(
                //   height: 44,
                //   width: 326,
                //   child:
                //   ElevatedButton(
                //     onPressed: () => balance.requestCashWithdraw(amount: SharedPrefController().getAmountToWithdraw(), officeId: balance.officeSelected!.id, recipientId: balance.recipientSelected!.id ?? ""),
                //     child: const Text(
                //       "Continue",
                //     ),
                //   ),
                // ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
