import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../resources/assets_manager.dart';
import '../../../../resources/valuesManager.dart';

class WithdrawalBottomSheet extends StatelessWidget {
  const WithdrawalBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(
        top: AppSize.s33.h,
        start: AppSize.s33.w,
        end: AppSize.s33.w,
        bottom: AppSize.s33.h,
      ),
      child: Wrap(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // CheckboxListTile(value: true, onChanged: (value){}),
          ListTile(
            title: Row(
              children: [
                Text( "Bank" ),
                addHorizantelSpace(AppSize.s33.w),
                SvgPicture.asset(IconAssets.bankIcon , height: AppSize.s25.h,)
              ],
            ),
            onTap: (){},
          ),
          ListTile(
            title: Row(
              children: [
                const Text("Cash"),
                addHorizantelSpace(AppSize.s33.w),
                SvgPicture.asset(IconAssets.cashIcon, height: AppSize.s25.h,)
              ],
            ),

            onTap: (){},
          )
        ],
      ),
    );;
  }
}
