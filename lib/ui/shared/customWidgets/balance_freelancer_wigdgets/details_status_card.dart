import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talants_valley/resources/colors_manager.dart';

import '../../../../resources/values_manager.dart';
import '../custom_contaner_widget.dart';

class DetailsStatusCard extends StatelessWidget {
  const DetailsStatusCard({
    required this.accountName,
    Key? key,
    this.forBank = true
  }) : super(key: key);

  final String accountName;
  final bool forBank ;

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
            Text(forBank ? "Bank Account Name" : "Office Name", style: supTitleStyle,),
            const Spacer(),
            Text(accountName , style: headLineStyle,),
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