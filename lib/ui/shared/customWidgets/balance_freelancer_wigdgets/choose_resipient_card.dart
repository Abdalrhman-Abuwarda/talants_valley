import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talants_valley/core/model/recipient_model.dart';

import '../../../../resources/colors_manager.dart';
import '../../../../resources/valuesManager.dart';

class ChooseRecipientCard extends StatelessWidget {
  const ChooseRecipientCard({
    required this.onTap,
    required this.recipient,
    Key? key,
  }) : super(key: key);

  final RecipientModel? recipient;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return
      InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p16.w, vertical: AppPadding.p12.h),
        height: AppSize.s80.h,
        decoration: BoxDecoration(
            color: ColorManager.whiteColor,
            borderRadius: BorderRadius.circular(AppSize.s5.r),
            border: Border.all(color: ColorManager.mainBorderColor)),
        child: recipient == null ?
        Row(
          children: [
            Text("Select a recipient" , style: Theme.of(context).textTheme.labelMedium!.copyWith(color: ColorManager.anotherFontColor),),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios , size: 18, color: ColorManager.disableIconColor),
          ],
        ) : Container(
          child:
          Stack(children: [
            SizedBox(
              width: AppSize.s250.w,
              child: Column(
                children: [
                  Row(
                    children: [

                      // const Spacer(),?
                      Text(recipient!.name , overflow: TextOverflow.ellipsis , style: Theme.of(context).textTheme.labelMedium!.copyWith(color: ColorManager.blackColor),),
                    ],
                  ),
                  addVerticalSpace(AppSize.s8.h),
                  Row(
                    children: [
                      Text("ID: ${recipient!.idNumber}" , style: Theme.of(context).textTheme.bodyText1),
                      const Spacer(),
                      Text("Phone: ${recipient!.mobile}", style: Theme.of(context).textTheme.bodyText2!.copyWith(color: ColorManager.anotherFontColor),),
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
        )

      ),
    );
  }
}