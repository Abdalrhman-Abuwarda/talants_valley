import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/resources/colors_manager.dart';
import 'package:talants_valley/resources/valuesManager.dart';
import 'package:talants_valley/routing/navigations.dart';
import 'package:talants_valley/routing/router.dart';

import '../../../core/provider/freelancer_provider/balance_freelancer_provider.dart';
import '../../../resources/assets_manager.dart';
import '../../shared/customWidgets/balance_freelancer_wigdgets/add_bank_widget.dart';
import '../../shared/second_custom_buttom.dart';

class ChooseAccountPage extends StatelessWidget {
  const ChooseAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bank Withdraw"),
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
      ),
      body: SingleChildScrollView(
        child: Consumer<BalanceFreelancerProvider>(
          builder: (context , balance , child) => Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                addVerticalSpace(AppSize.s35.h),
                AddBankWidgets(
                  onTap: () {
                    ServiceNavigation.serviceNavi.pushNamedWidget(RouteGenerator.addBankAccountPage);
                  },
                ),
                addVerticalSpace(400.h),
                Visibility(
                    visible: balance.isVisible,
                    child: Text(
                      "❗ Please select a bank account.",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(color: ColorManager.redColor),
                    )),
                addVerticalSpace(AppSize.s10.h),

                ElevatedButton(onPressed: () => balance.continueWithdraw(),
                    child: const Text("Continue")),
                addVerticalSpace(AppSize.s16.h),
                SecondCustomButton(text: "Add Account", onPressed: () {ServiceNavigation.serviceNavi.pushNamedWidget(RouteGenerator.addBankAccountPage);},)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

