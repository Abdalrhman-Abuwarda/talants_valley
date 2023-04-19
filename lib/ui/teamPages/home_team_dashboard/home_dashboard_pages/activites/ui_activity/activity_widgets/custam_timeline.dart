import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../../resources/assets_manager.dart';
import '../../../../../../../../resources/colors_manager.dart';
import '../../../../../../../../resources/values_manager.dart';


class CustomTimeLine extends StatelessWidget {
  const CustomTimeLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          children: [
            addHorizontalSpace(AppSize.s45.w),
            Container(
              height: AppSize.s25.h,
              width: 1,
              color: ColorManager.mainBorderColor,
            ),
            addHorizontalSpace(AppSize.s30.w),
            Text("15 Aug, 22 3:19 pm" ,style: Theme.of(context).textTheme.bodyText1,)
          ],
        ),
        Row(
          children: [
            addHorizontalSpace(AppSize.s33.w),
            Container(
              padding: const EdgeInsets.all(AppPadding.p5),
              height: AppSize.s25.h,
              width: AppSize.s25.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s50.r),
                  color: ColorManager.grayColor),
              child: Container(
                padding:  const EdgeInsets.all(AppPadding.p5),
                height: AppSize.s16.h,
                width: AppSize.s16.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.s50.r),
                    color: ColorManager.unselectedAppBarColor),
                child: SvgPicture.asset(IconAssets.checkIcon),
              ),
            ),
            addHorizontalSpace(AppSize.s18.w),
            Text("Dalia sent \$400 bank withdrawal" ,style: Theme.of(context).textTheme.headline5
              ,)
          ],
        ),

      ],
    );
  }
}
