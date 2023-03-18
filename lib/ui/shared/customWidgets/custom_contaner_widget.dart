import 'package:flutter/material.dart';

import '../../../resources/colors_manager.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({required this.child,this.select = false, Key? key}) : super(key: key);
  final Widget child;
  final bool select;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border:(select)? Border.all(color: ColorManager.blueColor,width: 1):Border.all(color: ColorManager.mainBorderColor,width: 2),
          color: ColorManager.whiteColor
      ),
      child: child,

    );
  }
}