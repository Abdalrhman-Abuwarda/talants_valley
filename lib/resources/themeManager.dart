import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talants_valley/resources/valuesManager.dart';

import '../routing/navigations.dart';
import 'colors_manager.dart';

class ThemeManager {
  // final currentContext = ServiceNavigations.serviceNavi.navKey.currentContext!;
  static ThemeData get lightTheme { //1
    return ThemeData( //2
        primaryColor: ColorManager.mainColor,

        scaffoldBackgroundColor: ColorManager.mainColor,
        fontFamily: 'Segoe UI', //3
        buttonTheme: ButtonThemeData( // 4
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: ColorManager.blueColor,
        ),
        appBarTheme:  AppBarTheme(
          toolbarHeight: AppSize.s100.h,
            elevation: 0,
            iconTheme: const IconThemeData(
              size: AppSize.s25,
              color: ColorManager.primaryFontColor,
            ),
            centerTitle: true,
            // titleSpacing: 30,
            actionsIconTheme: const IconThemeData(
              size: AppSize.s25,
              color: Color(0xFF151617),
            ),
            backgroundColor: null,
            titleTextStyle: TextStyle(fontSize: 20.0.sp,fontFamily: 'Segoe UI', fontWeight: FontWeight.w600, color: ColorManager.primaryFontColor)
        ),
      textTheme:   TextTheme(
        headline1: TextStyle(fontSize: 30.sp, fontFamily: 'Segoe UI',fontWeight: FontWeight.w600, color: ColorManager.primaryFontColor),
        headline2: TextStyle(fontSize: 20.0.sp,fontFamily: 'Segoe UI', fontWeight: FontWeight.w600, color: ColorManager.primaryFontColor),
        headline3: TextStyle(fontSize: 15.0.sp,fontFamily: 'Segoe UI', fontWeight: FontWeight.w600, color: ColorManager.primaryFontColor),
        headline4: TextStyle(fontSize: 16.0.sp,fontFamily: 'Segoe UI', fontWeight: FontWeight.w600, color: ColorManager.thirdFontColor),
        headline5: TextStyle(fontSize: 13.0.sp,fontFamily: 'Segoe UI', fontWeight: FontWeight.normal, color: ColorManager.blackColor ),
        headline6: TextStyle(fontSize: 13.0.sp,fontFamily: 'Segoe UI', fontWeight: FontWeight.normal, color: ColorManager.thirdFontColor),
        subtitle1: TextStyle(fontSize: 16.sp,fontFamily: 'Segoe UI', fontWeight: FontWeight.normal, color: ColorManager.secondaryFontColor),
        subtitle2: TextStyle(fontSize: 20.sp,fontFamily: 'Segoe UI', fontWeight: FontWeight.normal, color: ColorManager.secondaryFontColor),
        bodyText2: TextStyle(fontSize: 13.0.sp,fontFamily: 'Segoe UI', fontWeight: FontWeight.normal, color: ColorManager.secondaryFontColor ),

        bodyText1: TextStyle(fontSize: 10.0.sp,fontFamily: 'Segoe UI', fontWeight: FontWeight.normal, color: ColorManager.anotherFontColor ),
        labelMedium: TextStyle(fontSize: 14.0.sp,fontFamily: 'Segoe UI', fontWeight: FontWeight.normal, color: ColorManager.labelFontColor ),
        // labelLarge: TextStyle(fontSize: 15.sp, fontFamily: 'Segoe UI', fontWeight: FontWeight.w600, color: ColorManager.labelFontColor)
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.blueColor,
          disabledBackgroundColor: ColorManager.blueColor.withOpacity(0.4),
          disabledForegroundColor: ColorManager.whiteColor,
          textStyle: TextStyle(fontSize: 20.sp, fontFamily: 'Segoe UI', fontWeight: FontWeight.w600, color: ColorManager.whiteColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.r),
          ),
          minimumSize: Size(double.infinity, 44.h)
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: ColorManager.whiteColor,
        contentPadding: EdgeInsets.symmetric(vertical: AppPadding.p15.h, horizontal: AppPadding.p20.w),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.r),
            borderSide: const BorderSide(
              color: ColorManager.mainBorderColor
            )
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.r),
            borderSide: const BorderSide(
                color: ColorManager.mainBorderColor
            )
        ),
        errorBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s10.r)),
          borderSide: const BorderSide(
            color: ColorManager.redColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s10.r)),
          borderSide: const BorderSide(
            color: ColorManager.foucasBorderColor,
            width: 2,
          ),
        ),
      )
    );
  }
}