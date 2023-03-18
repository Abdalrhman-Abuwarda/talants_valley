import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../resources/colors_manager.dart';
import '../../../../resources/valuesManager.dart';
import '../custom_contaner_widget.dart';

class TimeLineCardWidget extends StatelessWidget {
  const TimeLineCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme  textStyle = Theme.of(context).textTheme;
    return CustomContainer(
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "7:30 am",
                      style: textStyle.headline6,
                    ),
                    Text(
                      "Today",
                      style: textStyle.bodyText1,
                    ),
                  ],
                ),
                Transform.translate(
                  offset: Offset(0, 5.h),
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
                addHorizantelSpace(AppSize.s55.w),
                Text(
                  "Requested",
                  style: textStyle.headline5,
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "7:30 am",
                      style: textStyle.headline6,
                    ),
                    Text(
                      "Today",
                      style: textStyle.bodyText1,
                    ),
                  ],
                ),
                Transform.translate(
                  offset: Offset(0, 5.h),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 4.r,
                        backgroundColor: ColorManager.blueColor,
                      ),
                      const VerticalDivider(
                        thickness: 1,
                        color: ColorManager.blueColor,
                      )
                    ],
                  ),
                ),
                addHorizantelSpace(AppSize.s55.w),
                Text(
                  "Requested",
                  style: textStyle.headline5,
                ),
              ],
            ),
          ],
        ));
  }
}
