import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/core/provider/authProvider.dart';
import 'package:talants_valley/core/provider/verificationProvider.dart';
import 'package:talants_valley/resources/assets_manager.dart';

import '../../../resources/colors_manager.dart';
import '../../../resources/valuesManager.dart';
import '../../../utils/validate.dart';
import '../customWidgets/authWigdgets/authFooterPage.dart';

class CustomOptPage extends StatefulWidget {
  const CustomOptPage({
    super.key,
    required this.optController,
    this.title,
    required this.caption,
    required this.buttonText,
    required this.fotterText,
    required this.futtarButtonText,
    required this.onPressedButton,
    required this.onPressedTextButton,
    required this.validator,
    this.withImage = false,
    this.pathImage,
    required this.minutes,
    required this.seconds,
  });

  final TextEditingController optController;
  final String? title;
  final String caption;
  final String fotterText;
  final String buttonText;
  final String futtarButtonText;
  final void Function()? onPressedButton;
  final Function() onPressedTextButton;
  final String? Function(String?)? validator;
  final bool withImage;

  final String? pathImage;
  final String seconds;
  final String minutes;

  @override
  State<CustomOptPage> createState() => _CustomOptPageState();
}

class _CustomOptPageState extends State<CustomOptPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p32.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          addVerticalSpace(AppSize.s30.h),
          widget.withImage == true
              ? Image.asset(
                  widget.pathImage ?? "",
                  height: 68.h,
                  width: 68.w,
                )
              : Center(
                  child: Text(widget.title ?? "",
                      style: Theme.of(context).textTheme.headline2)),
          addVerticalSpace(AppSize.s18.h),
          Text(widget.caption, style: Theme.of(context).textTheme.subtitle1),
          addVerticalSpace(AppSize.s30),
          Pinput(
            validator: widget.validator,
            controller: widget.optController,
            obscureText: false,
            length: 6,
            focusedPinTheme: PinTheme(
                margin: EdgeInsetsDirectional.only(end: AppMargin.m12.w),
                width: AppSize.s40.w,
                height: AppSize.s40.h,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: ColorManager.foucasBorderColor, width: 2),
                  color: ColorManager.whiteColor,
                  borderRadius: BorderRadius.circular(5.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 0,
                      offset: const Offset(
                        0.5,
                        1.5,
                      ), // changes position of shadow
                    ),
                  ],
                )),
            separatorPositions: const [3],
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
                      offset: const Offset(
                        0.5,
                        1.5,
                      ), // changes position of shadow
                    ),
                  ],
                )),
          ),
          addVerticalSpace(AppSize.s66.h),
          Text(
              "${widget.minutes.padLeft(2, '0')} : ${widget.seconds.padLeft(2, '0')}"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.fotterText),
              TextButton(
                  onPressed:
                      widget.seconds != "0" ? null : widget.onPressedTextButton,
                  child: Text(widget.futtarButtonText)),
            ],
          ),
          addVerticalSpace(AppSize.s60.h),
          ElevatedButton(
              onPressed: widget.onPressedButton,
              child: Text(
                widget.buttonText,
              )),
          addVerticalSpace(AppPadding.p44),
        ],
      ),
    );
  }
}
