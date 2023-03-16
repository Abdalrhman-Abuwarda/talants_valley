import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../resources/colors_manager.dart';
import '../../../../resources/valuesManager.dart';

class ChooseOfficeCard extends StatelessWidget {
  ChooseOfficeCard({
    required this.address,
    required this.fees,
    required this.officeName,
    required this.workHours,
    required this.sheetPage,
    Key? key,
  }) : super(key: key);

  Widget Function(BuildContext) sheetPage;
  final String officeName;
  final String workHours;
  final String fees;
  final String address;





  @override
  Widget build(BuildContext context) {
    final TextStyle? labelMedium = Theme.of(context).textTheme.labelMedium;
    return InkWell(
      onTap: () => showModalBottomSheet(
      isScrollControlled: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(23.r),
            topRight: Radius.circular(23.r)),
      ),
      context: context,
      builder: sheetPage,),
      child:
      Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p16.w, vertical: AppPadding.p12.h),
        height: AppSize.s80.h,
        decoration: BoxDecoration(
            color: ColorManager.whiteColor,
            borderRadius: BorderRadius.circular(AppSize.s5.r),
            border: Border.all(color: ColorManager.mainBorderColor)),
        child:
        Stack(children: [
          SizedBox(
            width: AppSize.s250.w,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: Text(workHours , overflow: TextOverflow.ellipsis ,style: Theme.of(context).textTheme.bodyText1,)),
                    // const Spacer(),
                    Text(officeName , overflow: TextOverflow.ellipsis , style: labelMedium!.copyWith(color: ColorManager.blackColor),),
                  ],
                ),
                addVerticalSpace(AppSize.s8.h),
                Row(
                  children: [
                    Text("\$ $fees" , style: Theme.of(context).textTheme.bodyText1),
                    const Spacer(),
                    Text(address, style: Theme.of(context).textTheme.bodyText2!.copyWith(color: ColorManager.anotherFontColor),),
                  ],
                ),
              ],
            ),
          ),
          const Align(
            alignment: Alignment.centerRight,
            child: Icon(Icons.arrow_forward_ios , size: 18, color: ColorManager.disableIconColor,),
          )
        ]),
      ),
    );
  }
}