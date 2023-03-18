import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talants_valley/resources/colors_manager.dart';

import '../../../resources/valuesManager.dart';

class MainElevatedButton extends StatelessWidget {
  const MainElevatedButton({
    required this.textColor,
    required this.onPressed,
    required this.isLoading,
    required this.text,
    required this.isMain,
    Key? key}) : super(key: key);

  final Color textColor;
  final bool isLoading;
  final Function()? onPressed;
  final String text;
  final bool isMain;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s45.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s7.r),
      ),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isMain ? ColorManager.blueColor : ColorManager.whiteColor,
          side: isMain ? const BorderSide(width: 0, color: Colors.transparent) :  const BorderSide(color: ColorManager.mainBorderColor ,width:  1)
        ),
        child: isLoading ? const CircularProgressIndicator() :
        Text(
          text,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),

    );
  }
}
