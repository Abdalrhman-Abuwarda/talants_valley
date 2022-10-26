import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../resources/colorsManager.dart';
import '../../../../resources/valuesManager.dart';

class VerificationListTile extends StatelessWidget {
  VerificationListTile(
      {required this.title, required this.suptitle, required this.onPressed, this.hintSupTitel});

  final String title;
  final String suptitle;
  void Function()? onPressed;
  final String? hintSupTitel;

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
          Text(hintSupTitel ?? "", style: Theme.of(context).textTheme.bodyText1,),
        ]),
        trailing: Container(
          height: AppSize.s30.h,
          width: AppSize.s90.w,
          child: ElevatedButton(onPressed: onPressed, child: Text('Verify'),),
        ),
      ),
    );
  }
}
