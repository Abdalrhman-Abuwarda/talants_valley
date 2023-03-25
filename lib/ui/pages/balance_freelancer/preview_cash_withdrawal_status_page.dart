import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
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
import '../../shared/customWidgets/balance_freelancer_wigdgets/time_line_widget.dart';
import '../../shared/customWidgets/main_elevated_button.dart';

class PreviewCashWithdrawalStatusPage extends StatefulWidget {
  const PreviewCashWithdrawalStatusPage({Key? key}) : super(key: key);

  @override
  State<PreviewCashWithdrawalStatusPage> createState() => _PreviewCashWithdrawalStatusPageState();
}

class _PreviewCashWithdrawalStatusPageState extends State<PreviewCashWithdrawalStatusPage> {

  String? firstTime;
  @override
  void initState() {
    // TODO: implement initState
    var provider = Provider.of<WithdrawFreelancerProvider>(context, listen: false);
    DateTime dateTime = DateTime.parse(provider.withdrawForPreview!.history!.first.updatedAt);
    firstTime = DateFormat.jm().format(dateTime);
    debugPrint("This is formattedTime =>>> $firstTime");

    super.initState();
  }
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: AppSize.s50.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    firstTime!,
                                    style: textStyle.headline6,
                                  ),
                                  Text(
                                    "Today",
                                    style: textStyle.bodyText1,
                                  ),
                                ],
                              ),
                            ),
                            addHorizontalSpace(AppSize.s14.w),
                            SizedBox(
                              width: AppSize.s10.w,
                              child: Column(
                                children: [
                                  Transform.translate(
                                    offset: Offset(0, AppSize.s5.h),
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
                                ],
                              ),
                            ),
                            addHorizontalSpace(AppSize.s25.w),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Requested",
                                  style: textStyle.headline5,
                                ),
                              ],
                            ),
                          ],
                        ),
                        addVerticalSpace(AppSize.s25.h),
                      ],
                    )),
                DetailsStatusCard(
                  accountName: balance.withdrawForPreview!.office!.name,
                  forBank: false,
                ),
                InstructionsCashWithdrawalWidget(
                  endHour: "",
                  startingHour: "",
                  address: balance.withdrawForPreview!.office!.address, officeFees: balance.withdrawForPreview!.office!.fees.toString(), ),
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
                Visibility(
                  visible: balance.withdrawForPreview!.status == "Ready",
                    child: MainElevatedButton(
                        textColor: ColorManager.blackColor,
                        onPressed:  () {
                          balance.cancelWithdraw(
                              withdrawId: balance.withdrawForPreview!.id) ;
                        } ,
                        isLoading: balance.isLoading,
                        text: "Cancel Withdrawal",
                        isMain: false)),
                addVerticalSpace(AppSize.s40.h)
              ],
            ),
          ),
        ),
      ),
    );
  }
}



