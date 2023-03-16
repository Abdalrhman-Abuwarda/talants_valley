import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talants_valley/resources/colors_manager.dart';

import '../../../../resources/valuesManager.dart';
import '../CustomContanerWidget.dart';

class DetailsStatusCard extends StatelessWidget {
  const DetailsStatusCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle? supTitleStyle = Theme.of(context).textTheme.headline6;
    final TextStyle? headLineStyle = Theme.of(context).textTheme.headline5;
    return CustomContainer(child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Details", style: Theme.of(context).textTheme.headline4!.copyWith(color: ColorManager.blackColor),),
        addVerticalSpace(AppSize.s12.h),
        Row(
          children: [
            Text("Bank Account Name", style: supTitleStyle,),
            const Spacer(),
            Text("Safa K. Mousa" , style: headLineStyle,),
          ],
        ),
        addVerticalSpace(AppSize.s12.h),
        Row(
          children: [
            Text("Expected Date", style: supTitleStyle),
            const Spacer(),
            Text("Within 24 Hours (Avg: 2hrs)" , style: headLineStyle,)
          ],
        )
      ],
    ));
  }
}