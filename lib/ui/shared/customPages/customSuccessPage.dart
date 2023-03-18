import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../resources/assets_manager.dart';
import '../../../resources/valuesManager.dart';

class CustomSuccessPage extends StatelessWidget {
  CustomSuccessPage({super.key,  this.title, required this.caption, required this.textButton, required this.onPressed, this.withTitle = false}) ;

  final String? title;
  final String caption;
  final String textButton;
  final bool withTitle;
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
            child: SvgPicture.asset(IconAssets.checkMarkIcon,
              height: AppSize.s55.h, width: AppSize.s55.w,),
          ),
          addVerticalSpace(AppSize.s20.h),
          if(withTitle == true)
          Text(title ?? "", style: Theme.of(context).textTheme.headline2,),
          addVerticalSpace(AppSize.s28.h),
          Text(caption, textAlign: TextAlign.center,style: Theme.of(context).textTheme.subtitle1,),
          addVerticalSpace(AppSize.s66.h),
          ElevatedButton(onPressed: onPressed, child: Text(textButton)),
        ],
      ),
    );
  }
}