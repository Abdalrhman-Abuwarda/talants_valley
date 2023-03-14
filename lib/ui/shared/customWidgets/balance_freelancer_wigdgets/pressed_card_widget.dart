import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../resources/colors_manager.dart';
import '../../../../resources/valuesManager.dart';

class PressedCardWidget extends StatelessWidget {
   PressedCardWidget({
    required this.title,
    required this.sheetPage,
    Key? key,
  }) : super(key: key);
  final String title;
  Widget Function(BuildContext) sheetPage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showModalBottomSheet(
      isScrollControlled: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(23.r),
            topRight: Radius.circular(23.r)),
      ),
      context: context,
      builder: sheetPage,),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p16.w, vertical: AppPadding.p12.h),
        width: double.infinity,
        height: AppSize.s50.h,
        decoration: BoxDecoration(
            color: ColorManager.whiteColor,
            borderRadius: BorderRadius.circular(AppSize.s5.r),
            border: Border.all(color: ColorManager.mainBorderColor)
        ),
        child: Row(
          children: [
            Text(title),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, size: 15,
              color: ColorManager.disableIconColor,)
          ],
        ),
      ),
    );
  }
}
