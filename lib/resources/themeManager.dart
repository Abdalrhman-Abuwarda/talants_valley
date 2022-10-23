import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colorsManager.dart';

class ThemeManager {
  static ThemeData get lightTheme { //1
    return ThemeData( //2
        primaryColor: ColorManager.mainColor,

        scaffoldBackgroundColor: ColorManager.mainColor,
        fontFamily: 'Segoe UI', //3
        buttonTheme: ButtonThemeData( // 4
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: ColorManager.blueColor,
        ),
        appBarTheme: const AppBarTheme(
          toolbarHeight: 100,
            elevation: 0,
            iconTheme: IconThemeData(
              size: 25,
              color: Color(0xFF151617),
            ),
            centerTitle: true,
            // titleSpacing: 30,
            actionsIconTheme: IconThemeData(
              size: 20,
              color: Color(0xFF151617),
            ),
            backgroundColor: null,
            titleTextStyle: TextStyle(fontSize: 43, color: Colors.white)
        ),
      textTheme:   TextTheme(
        headline1: TextStyle(fontSize: 30.sp, fontFamily: 'Segoe UI',fontWeight: FontWeight.w600, color: ColorManager.primaryFontColor),
        headline2: TextStyle(fontSize: 20.0.sp,fontFamily: 'Segoe UI', fontWeight: FontWeight.w600, color: ColorManager.primaryFontColor),
        // headline6: TextStyle(fontSize: 20.0,fontFamily: 'Segoe UI', fontWeight: FontWeight.w600),
        subtitle1: TextStyle(fontSize: 16.sp,fontFamily: 'Segoe UI', fontWeight: FontWeight.normal, color: ColorManager.secondaryFontColor),
        bodyText2: TextStyle(fontSize: 13.0.sp,fontFamily: 'Segoe UI', fontWeight: FontWeight.normal, color: ColorManager.secondaryFontColor ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
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
        contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.r),
            borderSide: const BorderSide(
              color: ColorManager.mainBorderColor,
            )
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: ColorManager.redColor,
          ),
        ),
        focusedBorder:  const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: ColorManager.foucasBorderColor,
            width: 2,
          ),
        ),
      )
    );
  }
}