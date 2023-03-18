import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/resources/colors_manager.dart';
import 'package:talants_valley/resources/valuesManager.dart';
import 'package:talants_valley/routing/navigations.dart';
import 'package:talants_valley/routing/router.dart';

import '../../../core/provider/freelancer_provider/withdraw_freelancer_provider.dart';
import '../../shared/customWidgets/balance_freelancer_wigdgets/add_bank_widget.dart';
import '../../shared/customWidgets/balance_freelancer_wigdgets/bank_account_card.dart';
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
    Provider.of<WithdrawFreelancerProvider>(context , listen: false).getBankAccountList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bank Withdraw"),
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {ServiceNavigation.serviceNavi.pushNamedAndRemoveUtils(RouteGenerator.addBalanceBankWithdrawPage);},
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
      ),
      body: Consumer<WithdrawFreelancerProvider>(
        builder: (context, balance, child) => Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                addVerticalSpace(AppSize.s35.h),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: ListView.builder(
                    shrinkWrap: true,
                    // physics: const NeverScrollableScrollPhysics(),
                    itemCount: balance.bankAccounts.length,
                    itemBuilder: (context, index) => BankAccountCardWidget(
                      accountName: balance.bankAccounts[index].accountName,
                      accountNumber: balance.bankAccounts[index].accountNumber,
                      onPressedIcon: () => balance.deleteBankAccount(
                          bankId: balance.bankAccounts[index].id,),
                      onTap: () {
                        balance.selectBankAccount(
                            accountNumber:
                                balance.bankAccounts[index].accountNumber);
                      },
                      isSelected: balance.bankAccounts[index].isSelected,
                    ),
                  ),
                ),
                addVerticalSpace(AppSize.s14.h),
                AddBankWidgets(
                  onTap: () {
                    ServiceNavigation.serviceNavi
                        .pushNamedWidget(RouteGenerator.addBankAccountPage);
                  },
                ),
                // balance.bankAccounts.length < 4
                //     ? addVerticalSpace(40)
                //     : balance.bankAccounts.length == 4
                //         ? addVerticalSpace(AppSize.s20.h)
                //         : addVerticalSpace(AppSize.s10.h),
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
                addVerticalSpace(AppSize.s10.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
