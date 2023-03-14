import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../resources/valuesManager.dart';

class PolicyWithdrawalWidget extends StatelessWidget {
  const PolicyWithdrawalWidget({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final TextStyle? supTitle = Theme.of(context).textTheme.subtitle1;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          "- Estimated arrival: 2 business days.",
          style: supTitle,
        ),
        addVerticalSpace(AppSize.s18.h),
         Text(
          "- Transfers made after 9:00 PM or on weekends \n   takes longer. ",
          style: supTitle,
        ),
        addVerticalSpace(AppSize.s18.h),
         Text(
          "- All transfers are subject to review and could be \n   delayed or stopped if we identify an issue.",
          style: supTitle,
        ),
      ],
    );
  }
}
