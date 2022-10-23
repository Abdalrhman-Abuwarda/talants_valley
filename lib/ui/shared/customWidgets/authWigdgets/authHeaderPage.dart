import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../resources/assetsManager.dart';
import '../../../../resources/valuesManager.dart';

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
              height: 28.h,
              width: 85.w,),
            addVerticalSpace(heightSpace),
            Text('Sigin In', style: Theme.of(context).textTheme.headline1),
          ]
      ),
    );
  }
}
