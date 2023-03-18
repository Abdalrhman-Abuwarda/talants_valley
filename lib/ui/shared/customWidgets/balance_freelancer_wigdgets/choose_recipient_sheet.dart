import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/routing/navigations.dart';

import '../../../../core/provider/freelancer_provider/withdraw_freelancer_provider.dart';
import '../../../../resources/assets_manager.dart';
import '../../../../resources/colors_manager.dart';
import '../../../../resources/valuesManager.dart';

class ChooseRecipientButtonSheet extends StatelessWidget {
  const ChooseRecipientButtonSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textStyle = Theme.of(context).textTheme;
    return Consumer<WithdrawFreelancerProvider>(
      builder: (context , balance , child) => Container(
        padding:  EdgeInsetsDirectional.only(
          top: AppPadding.p16.h,
          start: AppPadding.p22.w,
          end: AppPadding.p22.w,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        height: 450.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: AppSize.s25.h,
              child: Row(
                children: [
                  Text("Recipient", style: textStyle.subtitle1,),
                  const Spacer(),
                  IconButton(onPressed: (){ServiceNavigation.serviceNavi.popFunction();}, icon: SvgPicture.asset(IconAssets.closeIcon , height: AppSize.s10.h, width: AppSize.s10.w,))
                ],
              ),
            ),
            addVerticalSpace(AppSize.s5.h),
            const Divider(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: balance.recipients.length,
                itemBuilder: (context, index) =>  InkWell(
                  child: Container(
                    height: AppSize.s90.h,
                    padding: EdgeInsets.symmetric(vertical: AppPadding.p16.h),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                              color: ColorManager.mainBorderColor,
                              width: 1,
                            )
                        )
                    ),
                    child:
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                            child: Text(balance.recipients[index].name , style: textStyle.headline4!.copyWith(color: ColorManager.blackColor) )),
                        addVerticalSpace(AppSize.s8.h),
                        Row(
                          children: [
                            Text("ID: ${balance.recipients[index].idNumber}", style: textStyle.labelMedium!.copyWith(color: const Color(0xFF919191)) ),
                            const Spacer(),
                            Text("Phone: ${balance.recipients[index].mobile}" , style: textStyle.labelMedium!.copyWith(color: const Color(0xFF919191)))
                          ],
                        ),
                      ],
                    ),
                  ),
                  onTap: () => balance.selectRecipient(idNumber: balance.recipients[index].idNumber),
                ),),
            )


          ],
        ),
      ),
    );
  }
}
