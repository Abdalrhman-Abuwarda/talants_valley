import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../resources/colors_manager.dart';
import '../../../../resources/valuesManager.dart';
class DisableCardWidget extends StatelessWidget {
  const DisableCardWidget({
    required this.title,
    Key? key,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p16.w, vertical: AppPadding.p12.h),
      width: double.infinity,
      height: AppSize.s50.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s5.r),
          border: Border.all(color: ColorManager.mainBorderColor)
      ),
      child: Row(
        children:  [
          Text(title),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios, size: 15,
            color: ColorManager.disableIconColor,)
        ],
      ),
    );
  }
}
