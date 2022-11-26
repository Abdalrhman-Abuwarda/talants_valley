import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:talants_valley/resources/assetsManager.dart';

import '../../../resources/colorsManager.dart';
import '../../../resources/valuesManager.dart';
import '../../../utils/validate.dart';
import '../customWidgets/authWigdgets/authFooterPage.dart';

class CustomOptPage extends StatelessWidget {
  const CustomOptPage({
    required  this.optController,
    this.title,
    required this.caption,
    required this.buttomText,
    required this.fotterText,
    required this.futterButtomText,
    required this.onPressedButtom,
    required this.onPressedTextButtom,
    required this.valedate,
    this.withImage = false,
    this.pathImage,
  });

  final TextEditingController optController;
  final String? title;
  final String caption;
  final String fotterText;
  final String buttomText;
  final String futterButtomText;
  final void Function()? onPressedButtom;
 final dynamic Function() onPressedTextButtom;
 final String? Function(String?)? valedate;
 final bool withImage ;
 final String? pathImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p32.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          addVerticalSpace(AppSize.s30.h),
          withImage == true ?
          Image.asset(pathImage ?? "", height: 68.h, width: 68.w,)
         : Center(
              child: Text(title ?? "",
                  style: Theme.of(context).textTheme.headline2)),
          addVerticalSpace(AppSize.s18.h),
          Text(caption,
              style: Theme.of(context).textTheme.subtitle1),
          addVerticalSpace(AppSize.s30),
          Pinput(
            validator: valedate,
            controller: optController,
            obscureText: false,
            length: 6,
            separatorPositions: [3],
            separator: addHorizantelSpace(AppSize.s30.w),
            // obscuringCharacter: '*',
            defaultPinTheme: PinTheme(
                margin: EdgeInsetsDirectional.only(end: AppMargin.m12.w),
                width: AppSize.s40.w,
                height: AppSize.s40.h,
                textStyle: Theme.of(context).textTheme.headline2,
                // margin: EdgeInsets.symmetric(horizontal: 5.w),
                decoration: BoxDecoration(
                  color: ColorManager.whiteColor,
                  borderRadius: BorderRadius.circular(5.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 0,
                      offset: const Offset(0.5, 1.5,), // changes position of shadow
                    ),
                  ],
                )
            ),
          ),
          addVerticalSpace(AppSize.s66.h),
          FooterAuth(text: fotterText, textButtom: futterButtomText, onPressed: onPressedTextButtom,),
          addVerticalSpace(AppSize.s60.h),
          ElevatedButton(onPressed: onPressedButtom, child: Text(buttomText,)),
          addVerticalSpace(AppPadding.p44),

        ],
      ),
    );
  }
}