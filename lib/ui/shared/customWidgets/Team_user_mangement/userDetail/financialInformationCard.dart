import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../resources/colors_manager.dart';
import '../../../../../resources/values_manager.dart';

class FinancialInformatioCard extends StatelessWidget {
  FinancialInformatioCard({
    required this.balance,
    required this.profit,
    required this.revenue
}) ;

  final String balance;
  final String revenue;
  final String profit;

  @override
  Widget build(BuildContext context) {
    TextStyle? titleCardStyle = Theme.of(context).textTheme.headline4;
    TextStyle? propertyCardStyle = Theme.of(context).textTheme.headline6;
    TextStyle? valueCardStyle = Theme.of(context).textTheme.headline5;

    return Container(
      padding: EdgeInsets.symmetric(vertical: AppPadding.p18.h, horizontal: AppPadding.p17.w),
      decoration: BoxDecoration(
          color: ColorManager.whiteColor,
          borderRadius: BorderRadius.circular(AppSize.s7.r),
          border: Border.all(
              color: ColorManager.mainBorderColor
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Text("Financial Information" ,style: titleCardStyle,)),
            ],
          ),
          addVerticalSpace(AppSize.s18.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Balance", style: propertyCardStyle),
                  addVerticalSpace(AppSize.s10.h),
                  Text("\$$balance", style: valueCardStyle,),
                  addVerticalSpace(AppSize.s10.h),

                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Revenue", style: propertyCardStyle,),
                  addVerticalSpace(AppSize.s10.h),
                  Text("\$$revenue", style: valueCardStyle,),
                  addVerticalSpace(AppSize.s10.h),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Profit", style: propertyCardStyle,),
                  addVerticalSpace(AppSize.s10.h),
                  Text("\$$profit", style: valueCardStyle,),
                  addVerticalSpace(AppSize.s10.h),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}