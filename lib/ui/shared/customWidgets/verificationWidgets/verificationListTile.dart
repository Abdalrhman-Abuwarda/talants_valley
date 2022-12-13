import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talants_valley/core/data/local/sharedController.dart';
import 'package:talants_valley/resources/assetsManager.dart';

import '../../../../resources/colorsManager.dart';
import '../../../../resources/valuesManager.dart';

class VerificationListTile extends StatelessWidget {
  VerificationListTile(
      {super.key, required this.title, required this.supTitel, required this.onPressed, this.hintSupTitel, this.isSuccess = false, this.hintColor, required this.textButton, this.rejectedHint});

  final String title;
  final String supTitel;
  void Function()? onPressed;
  final String? hintSupTitel;
  final bool isSuccess;
   final Color? hintColor;
   final String textButton;
   final String? rejectedHint;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: AppSize.s66.h,
      decoration: BoxDecoration(
          color: ColorManager.whiteColor,
          borderRadius: BorderRadius.circular(7.r)
      ),
      child: ListTile(
        style: ListTileStyle.list,
        title: Row(children: [Text(title), addHorizantelSpace(AppSize.s25.h), Text(rejectedHint ?? "", style: Theme.of(context).textTheme.bodyText2!.copyWith(
          color: ColorManager.redColor
        ),)]),
        subtitle: Row(children: [
          Text(supTitel, style: Theme.of(context).textTheme.bodyText1,),
          Text(hintSupTitel ?? "", style: Theme.of(context).textTheme.bodyText1!.copyWith(
            color: hintColor,
          ),),
        ]),
        trailing:
            isSuccess != true ?
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: AppSize.s30.h,
              width: AppSize.s90.w,
              child: ElevatedButton(onPressed: onPressed, child: Text(textButton, style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: ColorManager.whiteColor,
                fontSize: 13.sp
              ),),),
            ),
            addVerticalSpace(AppSize.s8.h),
          ],
        )
        :
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(ImageAssets.successImage,
                    height: AppSize.s35.h,
                    width: AppSize.s35.w,
                    ),
                    addVerticalSpace(AppSize.s8.h),
                  ],
                )
      ),
    );
  }
}
