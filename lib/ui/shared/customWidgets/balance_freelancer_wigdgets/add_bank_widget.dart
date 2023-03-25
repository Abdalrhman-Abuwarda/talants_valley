import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../resources/assets_manager.dart';
import '../../../../resources/colors_manager.dart';
import '../../../../resources/valuesManager.dart';

class AddBankWidgets extends StatelessWidget {
  const AddBankWidgets({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: DottedBorder(
          borderType: BorderType.RRect,
          strokeWidth: 2,
          color: ColorManager.mainBorderColor,
          radius: Radius.circular(AppSize.s7.r),
          dashPattern: const [
            4,
            4,
          ],
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppSize.s7.r),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: AppPadding.p27.h , horizontal: AppPadding.p27.w),
              width: double.infinity,
              height: AppSize.s100,
              child: Row(
                children: [
                  SvgPicture.asset(IconAssets.bankIcon , height: AppSize.s40.h,),
                  addHorizontalSpace(AppSize.s25.w),
                  Text("Add Bank Account" , style: Theme.of(context).textTheme.headline2!.copyWith(
                      color: ColorManager.blueColor,
                      fontWeight: FontWeight.normal
                  ),),
                ],
              ),
            ),

          )),
    );
  }
}