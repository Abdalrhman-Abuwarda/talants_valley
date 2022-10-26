import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/assetsManager.dart';
import '../../../resources/valuesManager.dart';

class CustomSuccessPage extends StatelessWidget {
  CustomSuccessPage({required this.titel, required this.caption, required this.textButtom, required this.onPressed}) ;

  final String titel;
  final String caption;
  final String textButtom;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p32.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          addVerticalSpace(AppSize.s20.h),
          Center(
            child: Image.asset(ImageAssets.successImage,
              height: AppSize.s55.h, width: AppSize.s55.w,),
          ),
          addVerticalSpace(AppSize.s20.h),
          Text(titel, style: Theme.of(context).textTheme.headline2,),
          addVerticalSpace(AppSize.s28.h),
          Text(caption, textAlign: TextAlign.center,style: Theme.of(context).textTheme.subtitle1,),
          addVerticalSpace(AppSize.s66.h),
          ElevatedButton(onPressed: onPressed, child: Text(textButtom)),
        ],
      ),
    );
  }
}