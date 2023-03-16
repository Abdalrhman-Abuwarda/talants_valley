import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/core/provider/freelancer_provider/withdraw_freelancer_provider.dart';
import 'package:talants_valley/resources/colors_manager.dart';
import 'package:talants_valley/resources/valuesManager.dart';
import 'package:talants_valley/routing/navigations.dart';
import 'package:talants_valley/routing/router.dart';

import '../../shared/customWidgets/balance_freelancer_wigdgets/chooseOfficeCard.dart';
import '../../shared/customWidgets/balance_freelancer_wigdgets/choose_office_button_sheet.dart';
import '../../shared/customWidgets/balance_freelancer_wigdgets/choose_resipient_card.dart';

class ChooseOfficePage extends StatefulWidget {
  const ChooseOfficePage({Key? key}) : super(key: key);

  @override
  State<ChooseOfficePage> createState() => _ChooseOfficePageState();
}

class _ChooseOfficePageState extends State<ChooseOfficePage> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<WithdrawFreelancerProvider>(context, listen: false)
        .getOfficeList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle? labelMedium = Theme.of(context).textTheme.labelMedium;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cash"),
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {ServiceNavigation.serviceNavi.pushNamedReplacement(RouteGenerator.addBalanceCashWithdrawPage);},
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p32.w),
        child: Consumer<WithdrawFreelancerProvider>(
          builder: (context, balance, child) => balance.officeList.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    addVerticalSpace(AppSize.s10.h),
                    Text(
                      "Office",
                      style: labelMedium,
                    ),
                    addVerticalSpace(AppSize.s5.h),
                    ChooseOfficeCard(
                      sheetPage: (context) => const ChooseOfficeButtonSheet(),
                      address: balance.officeSelected!.address,
                      fees: balance.officeSelected!.fees.toString(),
                      officeName: balance.officeSelected!.name,
                      workHours:
                          " ساعات العمل:${balance.officeSelected!.endingHour} مساءاً${balance.officeSelected!.startingHour}  صباحاً- ",
                    ),
                    addVerticalSpace(AppSize.s30.h),
                    Row(
                      children: [
                        Text(
                          "Recipient",
                          style: labelMedium,
                        ),
                        TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(0),
                            ),
                            onPressed: () {
                              ServiceNavigation.serviceNavi.pushNamedWidget(RouteGenerator.editRecipientPage);
                            },
                            child: Text(
                              "Edit",
                              style: TextStyle(fontSize: 12.sp),
                            ))
                      ],
                    ),
                    ChooseRecipientCard(
                      onTap: () {ServiceNavigation.serviceNavi.pushNamedReplacement(RouteGenerator.chooseRecipientFreelancerPage);}, recipient: balance.recipientSelected,
                    ),
                    // addVerticalSpace(AppSize.s8.h),
                    Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {ServiceNavigation.serviceNavi.pushNamedWidget(RouteGenerator.editRecipientPage);},
                            child: const Text("+ Add recipient"))),
                    addVerticalSpace(AppSize.s70.h),
                    ElevatedButton(
                        onPressed: () {ServiceNavigation.serviceNavi.pushNamedWidget(RouteGenerator.previewCashWithdrawalRecipient);},
                        child: const Text("Continue"))
                  ],
                ),
        ),
      ),
    );
  }
}
