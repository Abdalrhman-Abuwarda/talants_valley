import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../resources/assets_manager.dart';
import '../../../../resources/values_manager.dart';

class HeadarAuth extends StatelessWidget {
  const HeadarAuth({
   required this.heightSpace
  });
  final double heightSpace;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          children: [
            Image.asset(ImageAssets.mainImage,
              height: AppSize.s28.h,
              width: AppSize.s80.w,),
            addVerticalSpace(heightSpace),
            Text('Sigin In', style: Theme.of(context).textTheme.headline1),
          ]
      ),
    );
  }
}
