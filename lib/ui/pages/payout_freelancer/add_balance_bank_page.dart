import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/core/data/local/shared_controller.dart';
import 'package:talants_valley/resources/colors_manager.dart';
import 'package:talants_valley/resources/valuesManager.dart';
import 'package:talants_valley/routing/navigations.dart';
import 'package:talants_valley/utils/validate_extension.dart';

import '../../../core/provider/freelancer_provider/payout_freelancer_provider.dart';
import '../../../routing/router.dart';

class AddBalanceBankPage extends StatefulWidget {
  const AddBalanceBankPage({Key? key}) : super(key: key);

  @override
  State<AddBalanceBankPage> createState() => _AddBalanceBankPageState();
}

class _AddBalanceBankPageState extends State<AddBalanceBankPage> {
  final _formKey = GlobalKey<FormState>();
  bool visible = false;
  String availableMoney = SharedPrefController().getUser().balance.toString();
  final TextEditingController _amountController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Bank Withdrow",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              ServiceNavigation.serviceNavi
                  .pushNamedReplacement(RouteGenerator.mainFreelancerPage);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: ColorManager.blackColor,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              addVerticalSpace(AppSize.s200.h),
              const Text(
                "Amount",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: ColorManager.grayColor),
              ),
              addVerticalSpace(AppSize.s8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "\$ ",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 115,
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        controller: _amountController,
                        autocorrect: true,
                        validator: (value) => value!.validateBankAmount(),
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(
                          hintText: "000.00",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              addVerticalSpace(AppSize.s8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Available",
                    style: TextStyle(
                        fontSize: 16, color: Color.fromRGBO(140, 140, 140, 1)),
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          _amountController.text = availableMoney;
                        });
                      },
                      child: Text("\$$availableMoney"))
                ],
              ),
              addVerticalSpace(AppSize.s20.h),
              Consumer<PayoutFreelancerProvider>(
                builder: (context, balance, child) => SizedBox(
                  height: 44,
                  width: 326,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        balance.addAmountBankToWithdraw(
                            amount: _amountController.text);
                      }
                    },
                    style: ElevatedButton.styleFrom(),
                    child: const Text(
                      "Continue",
                      style: TextStyle(fontSize: 20),
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
