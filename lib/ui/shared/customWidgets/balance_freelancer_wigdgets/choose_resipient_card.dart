import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../resources/colors_manager.dart';
import '../../../../resources/valuesManager.dart';

class ChooseRecipientCard extends StatelessWidget {
  const ChooseRecipientCard({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p16.w, vertical: AppPadding.p12.h),
        height: AppSize.s80.h,
        decoration: BoxDecoration(
            color: ColorManager.whiteColor,
            borderRadius: BorderRadius.circular(AppSize.s5.r),
            border: Border.all(color: ColorManager.mainBorderColor)),
        child: Row(
          children: [
            Text("Select a recipient" , style: Theme.of(context).textTheme.labelMedium!.copyWith(color: ColorManager.anotherFontColor),),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios , size: 18, color: ColorManager.disableIconColor),
          ],
        ),
      ),
    );
  }
}