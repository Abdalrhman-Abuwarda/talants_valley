import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talants_valley/resources/assets_manager.dart';
import 'package:talants_valley/resources/colors_manager.dart';
import 'package:talants_valley/resources/valuesManager.dart';
import 'package:talants_valley/routing/navigations.dart';
import 'package:talants_valley/ui/shared/customWidgets/CustomContanerWidget.dart';

import '../../shared/customWidgets/balance_freelancer_wigdgets/details_status_card.dart';

class WithdrawalPreviewStatusPage extends StatelessWidget {
  const WithdrawalPreviewStatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Withdrawal Preview"),
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
          child: Column(
            children: [
              CustomContainer(
                  child: Column(
                children: [
                  Row(
                    children: [
                      const Text("300"),
                      const Spacer(),
                      Container(
                        width: AppSize.s75.h,
                        height: AppSize.s22.h,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF9F0),
                          borderRadius: BorderRadius.circular(AppSize.s30.r),
                          border: Border.all(color: const Color(0xFFF3F3F3)),
                        ),
                        child: Center(
                            child: Text(
                          "Pending",
                          style: TextStyle(
                              fontSize: 13.sp,
                              fontFamily: "Segoe UI",
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFFDAA545)),
                        )),
                      )
                    ],
                  ),
                  addVerticalSpace(AppSize.s15.h),
                  Divider(),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Safa Mousa"),
                              addHorizantelSpace(AppSize.s10.w),
                              Text("[Bank of Palestine]")
                            ],
                          ),
                          Text("0454 649667 001 3100"),
                        ],
                      ),
                      Spacer(),
                      SvgPicture.asset(IconAssets.bankIcon)
                    ],
                  ),
                ],
              )),
              CustomContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Timeline"),
                  addVerticalSpace(AppSize.s12.h),
                  Row(
                    children: [
                      Text("7:30 am"),
                      addHorizantelSpace(AppSize.s55.w),
                      Text("Requested"),
                    ],
                  ),
                  Text("Today"),
                ],
              )),
              DetailsStatusCard(),
              const InstructionsBankWithdrawal(),
              addVerticalSpace(AppSize.s20.h),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.whiteColor,
                ),
                  onPressed: (){}, child: Text("Cancel Withdrawal" , style: TextStyle(fontSize:  16.sp, color: ColorManager.blackColor),))
            ],
          ),
        ),
      ),
    );
  }
}




class InstructionsBankWithdrawal extends StatelessWidget {
  const InstructionsBankWithdrawal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Instructions" , style: Theme.of(context).textTheme.headline4!.copyWith(color: ColorManager.blackColor),),
        addVerticalSpace(AppSize.s12.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Transform.translate(
              offset: Offset(0 , 6.h),
              child: CircleAvatar(
                radius: 5.r,
                backgroundColor: ColorManager.blackColor,
              ),
            ),
            addHorizantelSpace(AppSize.s8.w),
            Text("Open your bank account app to ensure \n payment delivery", style: Theme.of(context).textTheme.headline5,)
          ],
        ),
        addVerticalSpace(AppSize.s15.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Transform.translate(
              offset: Offset(0 , 6.h),
              child: CircleAvatar(
                radius: 5.r,
                backgroundColor: ColorManager.blackColor,
              ),
            ),
            addHorizantelSpace(AppSize.s8.w),
            Text("Open your bank account app to ensure \n payment delivery", style: Theme.of(context).textTheme.headline5,)
          ],
        ),
        addVerticalSpace(AppSize.s15.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Transform.translate(
              offset: Offset(0 , 6.h),
              child: CircleAvatar(
                radius: 5.r,
                backgroundColor: ColorManager.blackColor,
              ),
            ),
            addHorizantelSpace(AppSize.s8.w),
            Text("Open your bank account app to ensure \n payment delivery", style: Theme.of(context).textTheme.headline5,)
          ],
        ),
      ],
    ));
  }
}
