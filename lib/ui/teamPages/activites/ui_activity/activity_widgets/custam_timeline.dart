import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../../resources/assets_manager.dart';
import '../../../../../../../../resources/colors_manager.dart';
import '../../../../../../../../resources/values_manager.dart';


class CustomTimeLine extends StatelessWidget {
  const CustomTimeLine({
    required this.title,
    required this.time,
    Key? key
  }) : super(key: key);

  final String time;
  final String title;

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
            Text(time ,style: Theme.of(context).textTheme.bodyText1,)
          ],
        ),
        Row(
          children: [
            addHorizontalSpace(AppSize.s33.w),
            Container(
              padding: const EdgeInsets.all(AppPadding.p5),
              height: AppSize.s25.h,
              width: AppSize.s25.w,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorManager.grayColor),
              child: Container(
                padding:  const EdgeInsets.all(AppPadding.p5),
                height: AppSize.s16.h,
                width: AppSize.s16.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                    color: ColorManager.unselectedAppBarColor),
                child: SvgPicture.asset(IconAssets.checkIcon),
              ),
            ),
            addHorizontalSpace(AppSize.s18.w),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(title ,style: Theme.of(context).textTheme.headline5, overflow: TextOverflow.ellipsis,),
            )
          ],
        ),

      ],
    );
  }
}
