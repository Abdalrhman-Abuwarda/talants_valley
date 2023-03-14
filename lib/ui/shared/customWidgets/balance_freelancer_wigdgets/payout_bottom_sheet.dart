import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talants_valley/routing/navigations.dart';
import 'package:talants_valley/routing/routes.dart';

import '../../../../resources/assets_manager.dart';
import '../../../../resources/valuesManager.dart';
import '../../../../routing/router.dart';

class PayoutBottomSheet extends StatelessWidget {
  const PayoutBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle? headLine3 = Theme.of(context).textTheme.headline3;
    return Container(
      padding:  EdgeInsetsDirectional.only(
        top: AppPadding.p20.h,
        start: AppPadding.p32.w,
        end: AppPadding.p32.w,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      height: AppSize.s200.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text("Payment Method" , style: Theme.of(context).textTheme.subtitle1,),
          addVerticalSpace(AppSize.s18.h),
          const Divider(),
          addVerticalSpace(AppSize.s18.h),
          InkWell(
            child: Row(
              children: [
                SvgPicture.asset(IconAssets.bankIcon , height: AppSize.s25.h,),
                addHorizantelSpace(AppSize.s33.w),
                Text( "Bank" , style: headLine3, ),
              ],
            ),
            onTap: (){
              ServiceNavigation.serviceNavi
                  .pushNamedAndRemoveUtils(RouteGenerator.addBalanceBankWithdrawPage);
            },
          ),
          addVerticalSpace(AppSize.s30.h),
          InkWell(
            child: Row(
              children: [
                SvgPicture.asset(IconAssets.cashIcon, height: AppSize.s25.h,),
                addHorizantelSpace(AppSize.s33.w),
                Text("Cash" , style: headLine3,),
              ],
            ),

            onTap: (){
              ServiceNavigation.serviceNavi
                  .pushNamedAndRemoveUtils(RouteGenerator.addBalanceCashWithdrawPage);
            },
          )
        ],
      ),
    );
  }
}
