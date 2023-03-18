import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/colors_manager.dart';

class SecondCustomButton extends StatelessWidget {
   SecondCustomButton({
    required this.text,
    required this.onPressed,
    required this.isLoading,
    Key? key,
  }) : super(key: key);

  final String text;
  final void Function()? onPressed;
  bool isLoading;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorManager.whiteColor,
            side: const BorderSide(
                width: 1.0,
                color: ColorManager.mainBorderColor
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.r),
            ),
            elevation: 0
        ),
        onPressed: isLoading ? null : onPressed, child: isLoading ? const CircularProgressIndicator() : Text(text , style: Theme.of(context).textTheme.headline4!.copyWith(color: ColorManager.blueColor),)
    );
  }
}
