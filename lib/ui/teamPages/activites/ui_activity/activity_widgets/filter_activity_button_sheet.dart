import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talants_valley/resources/colors_manager.dart';

import '../../../../../resources/assets_manager.dart';
import '../../../../../resources/values_manager.dart';

class FilterActivityButtonSheet extends StatelessWidget {
  const FilterActivityButtonSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.headline4!.copyWith(color: ColorManager.blackColor);
    return Container(
      padding: EdgeInsetsDirectional.only(
        top: AppPadding.p16.h,
        start: AppPadding.p22.w,
        end: AppPadding.p22.w,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      height: 250.h,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: AppSize.s48.h,
              child: Row(
                children: [
                  Text(
                    "Filter",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: SvgPicture.asset(
                        IconAssets.closeIcon,
                        height: AppSize.s14.h,
                        width: AppSize.s14.w,
                      )
                  )
                ],
              ),
            ),
            addVerticalSpace(AppSize.s5.h),
            const Divider(thickness: 1.2,),
            addVerticalSpace(AppSize.s5.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Invoice", style: textStyle,),
                addVerticalSpace(AppSize.s20.h),
                Text("Payout", style: textStyle,),
                addVerticalSpace(AppSize.s20.h),
                Text("User", style: textStyle,),

              ],
            )
          ],
        ),
      ),
    );
  }
}
