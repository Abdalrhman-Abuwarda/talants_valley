import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/core/provider/authProvider.dart';
import 'package:talants_valley/core/provider/verificationProvider.dart';
import 'package:talants_valley/resources/assetsManager.dart';

import '../../../resources/colorsManager.dart';
import '../../../resources/valuesManager.dart';
import '../../../utils/validate.dart';
import '../customWidgets/authWigdgets/authFooterPage.dart';

class CustomOptPage extends StatefulWidget {
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
 final  Function() onPressedTextButtom;
 final String? Function(String?)? valedate;
 final bool withImage ;
 final String? pathImage;


  @override
  State<CustomOptPage> createState() => _CustomOptPageState();
}
class _CustomOptPageState extends State<CustomOptPage> {

  // static const maxSeconds = 120;
  // int seconds = maxSeconds;
  // Timer? timer;
  //
  // void startTimer() {
  //   timer = Timer.periodic(Duration(seconds: 1), (_) {
  //     if(seconds > 0) {
  //       setState(() => seconds--);
  //     }else{
  //       timer?.cancel();
  //     }
  //   });
  // }
@override
  void initState() {
  Provider.of<AuthProvider>(context,listen: false).startTimer();
  super.initState();

  // TODO: implement initState
  }

  // @override
  // void dispose() {
  //   Provider.of<AuthProvider>(context, listen: false).timer!.cancel();
  //   // TODO: implement dispose
  //   super.dispose();
  // }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p32.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          addVerticalSpace(AppSize.s30.h),
          widget.withImage == true ?
          Image.asset(widget.pathImage ?? "", height: 68.h, width: 68.w,)
         : Center(
              child: Text(widget.title ?? "",
                  style: Theme.of(context).textTheme.headline2)),
          addVerticalSpace(AppSize.s18.h),
          Text(widget.caption,
              style: Theme.of(context).textTheme.subtitle1),
          addVerticalSpace(AppSize.s30),
          Pinput(
            validator: widget.valedate,
            controller: widget.optController,
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
          Consumer<AuthProvider>(
              builder: (context, auth, child) =>
              Text("${auth.minutes.toString().padLeft(2, '0')} : ${auth.seconds.toString().padLeft(2, '0')}")
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.fotterText),
              Consumer<AuthProvider>(
                builder: (context, auth, child) => TextButton(
                    onPressed: auth.seconds != 0 ? null : widget.onPressedTextButtom
                     ,
                    child: Text(widget.futterButtomText)),
              )
            ],
          ),

          addVerticalSpace(AppSize.s60.h),
          ElevatedButton(onPressed: widget.onPressedButtom, child: Text(widget.buttomText,)),
          addVerticalSpace(AppPadding.p44),
        ],
      ),
    );
  }
}