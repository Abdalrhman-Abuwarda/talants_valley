import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/resources/colors_manager.dart';
import 'package:talants_valley/resources/values_manager.dart';
import 'package:talants_valley/routing/navigations.dart';
import 'package:talants_valley/routing/router.dart';

import '../../../core/provider/freelancer_provider/payout_freelancer_provider.dart';
import '../../shared/customWidgets/balance_freelancer_wigdgets/add_bank_widget.dart';
import '../../shared/customWidgets/balance_freelancer_wigdgets/bank_account_card.dart';
import '../../shared/customWidgets/balance_freelancer_wigdgets/choose_bank_skeleton.dart';
import '../../shared/second_custom_buttom.dart';

class ChooseBankAccountPage extends StatefulWidget {
  const ChooseBankAccountPage({Key? key}) : super(key: key);

  @override
  State<ChooseBankAccountPage> createState() => _ChooseBankAccountPageState();
}
class _ChooseBankAccountPageState extends State<ChooseBankAccountPage> {

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<PayoutFreelancerProvider>(context , listen: false).getBankAccountList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<PayoutFreelancerProvider>(
      builder: (context, balance, child) => Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
         Padding(
           padding: EdgeInsets.symmetric(horizontal: AppPadding.p32.w),
           child: Column(
             mainAxisSize: MainAxisSize.min,
            children: [
              Visibility(
                  visible: balance.isVisibleHomeError,
                  child: Text(
                    "❗ Please select a bank account.",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: ColorManager.redColor),
                  )),
              addVerticalSpace(AppSize.s10.h),
              ElevatedButton(
                  onPressed: () => balance.continueWithdraw(),
                  child: const Text("Continue")),
              addVerticalSpace(AppSize.s16.h),
              SecondCustomButton(
                isLoading: false,
                text: "Add Account",
                onPressed: () {
                  ServiceNavigation.serviceNavi
                      .pushNamedWidget(RouteGenerator.addBankAccountPage);
                },
              ),
            ],
        ),
         ),

      appBar: AppBar(
        title: const Text("Bank Withdraw"),
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {ServiceNavigation.serviceNavi.pushNamedAndRemoveUtils(RouteGenerator.addBalanceBankWithdrawPage);},
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
      ),
      body:  SingleChildScrollView(

        child: balance.isLoading ? ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
            height: AppSize.s16.h,
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
            itemBuilder: (context , index) => const ChooseBankCardSkeleton()) :
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              addVerticalSpace(AppSize.s35.h),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: balance.bankAccounts.length,
                itemBuilder: (context, index) {
                  final bankAccount = balance.bankAccounts[index];
                  return
                      BankAccountCardWidget(
                        accountName: bankAccount.accountName,
                        accountNumber: bankAccount
                            .accountNumber,
                        onPressedIcon: () =>
                            balance.deleteBankAccount(
                              bankId: bankAccount.id,),
                        onTap: () {
                          balance.selectBankAccount(
                              accountNumber:
                              bankAccount.accountNumber);
                        },
                        isSelected: bankAccount.isSelected,
                      )
                  ;
                }
              ),
              addVerticalSpace(AppSize.s14.h),
              Visibility(
                visible: balance.withdrawals.isEmpty,
                child: AddBankWidgets(
                  onTap: () {
                    ServiceNavigation.serviceNavi
                        .pushNamedWidget(RouteGenerator.addBankAccountPage);
                  },
                ),
              ),



              addVerticalSpace(AppSize.s120.h),
            ],
          ),
        ),
      ),
      ),
    );
  }
}
