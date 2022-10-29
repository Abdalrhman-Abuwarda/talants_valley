import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talants_valley/core/data/local/sharedController.dart';
import 'package:talants_valley/resources/assetsManager.dart';

import '../../../../resources/colorsManager.dart';
import '../../../../resources/valuesManager.dart';

class VerificationListTile extends StatelessWidget {
  VerificationListTile(
      {required this.title, required this.suptitle, required this.onPressed, this.hintSupTitel, this.isSuccess = false, this.hintColor});

  final String title;
  final String suptitle;
  void Function()? onPressed;
  final String? hintSupTitel;
  final bool isSuccess;
   final Color? hintColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s66.h,
      decoration: BoxDecoration(
          color: ColorManager.whiteColor,
          borderRadius: BorderRadius.circular(7.r)
      ),
      child: ListTile(
        style: ListTileStyle.list,
        title: Text(title),
        subtitle: Row(children: [
          Text(suptitle, style: Theme.of(context).textTheme.bodyText1,),
          Text(hintSupTitel ?? "", style: Theme.of(context).textTheme.bodyText1!.copyWith(
            color: hintColor,
          ),),
        ]),
        trailing:
            isSuccess != true ?
        Container(
          height: AppSize.s30.h,
          width: AppSize.s90.w,
          child: ElevatedButton(onPressed: onPressed, child: Text('Verify'),),
        )
        :
                Image.asset(ImageAssets.successImage,
                height: AppSize.s35.h,
                width: AppSize.s35.w,
                )
      ),
    );
  }
}
