import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/resources/colors_manager.dart';
import 'package:talants_valley/resources/valuesManager.dart';

import '../../../core/model/freelancer/bank_account_model.dart';
import '../../../core/model/freelancer/withdrawal_model.dart';
import '../../../core/provider/freelancer_provider/withdraw_freelancer_provider.dart';
import '../../../utils/validate.dart';
import '../../shared/customWidgets/balance_freelancer_wigdgets/branch_bottom_sheet.dart';
import '../../shared/customWidgets/balance_freelancer_wigdgets/disable_card_widget.dart';
import '../../shared/customWidgets/balance_freelancer_wigdgets/ledger_botton_sheet.dart';
import '../../shared/customWidgets/balance_freelancer_wigdgets/pressed_card_widget.dart';
import '../../shared/customWidgets/mainTextFormField.dart';
import '../../shared/second_custom_buttom.dart';

class AddBankAccountPage extends StatefulWidget {
   const AddBankAccountPage({Key? key}) : super(key: key);

  @override
  State<AddBankAccountPage> createState() => _AddBankAccountPageState();
}

class _AddBankAccountPageState extends State<AddBankAccountPage> {
  final TextEditingController _fullNameController  = TextEditingController();

  final TextEditingController _accountNumberController  = TextEditingController();
  var formKey = GlobalKey<FormState>();


  @override
  void dispose() {
    // TODO: implement dispose
    _fullNameController.dispose();
    _accountNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Bank Account"),
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: () { Navigator.pop(context);},
          icon: const Icon(Icons.arrow_back_ios_new_outlined),),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p32.w),
            child: Consumer<WithdrawFreelancerProvider>(
              builder: (context , balance , child) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  const Text("Bank"),
              addVerticalSpace(AppSize.s5.h),
              const DisableCardWidget(title: "Bank of Palestine",),
              addVerticalSpace(AppSize.s16.h),
                    const Text("Account Owner Full Name"),
                    addVerticalSpace(AppSize.s5.h),
                    MainTextFormField(
                      controller: _fullNameController,
                      hintText: "",
                      inputType: TextInputType.text,
                      validator:  (value) => Validate.validateUserName(value),
                    ),
                    addVerticalSpace(AppSize.s16.h),
                    const Text("Branch"),
                    addVerticalSpace(AppSize.s5.h),
                    PressedCardWidget(title: balance.branchSelected, sheetPage: (context) => const BranchBottomSheet()),
                    addVerticalSpace(AppSize.s8.h),
                    Visibility(
                        visible: balance.isVisibleBranchError,
                        child: Text("     Please choose a branch", style: TextStyle(color: ColorManager.redColor, fontSize: 12.sp),)),
                    addVerticalSpace(AppSize.s16.h),
                    const Text("Account Number"),
                    addVerticalSpace(AppSize.s5.h),
                    MainTextFormField(
                      controller: _accountNumberController,
                      hintText: "",
                      inputType: TextInputType.number,
                      validator:  (value) => value!.validateAccountNumber(),
                    ),
                    addVerticalSpace(AppSize.s16.h),
                    const Text("Currency"),
                    addVerticalSpace(AppSize.s5.h),
                    const DisableCardWidget(title: "Currency",),
                    addVerticalSpace(AppSize.s16.h),
                    const Text("Ledger"),
                    addVerticalSpace(AppSize.s5.h),
                    PressedCardWidget(sheetPage: (context) => const LedgerBottomSheet(), title: balance.ledgerSelected,),
                    addVerticalSpace(AppSize.s8.h),
                    Visibility(
                      visible: balance.isVisibleLedgerError,
                        child: Text("     Please choose a ledger", style: TextStyle(color: ColorManager.redColor, fontSize: 12.sp),)),
                    addVerticalSpace(AppSize.s40.h),
                    ElevatedButton(onPressed: (){
                      if(formKey.currentState!.validate()){
                        balance.sendCodeAddBankAccount(
                             accountName: _fullNameController.text, accountNumber: _accountNumberController.text, bankBranch: balance.branchSelected, ledger: balance.ledgerSelected
                        );
                      }
                    },
                        child: const Text("Confirm")),
                    addVerticalSpace(AppSize.s16.h),
                    SecondCustomButton(text: "Back", onPressed: () {Navigator.pop(context);},)
              ],
          ),
            ),
      ),
        ),
    ),);
  }
}


