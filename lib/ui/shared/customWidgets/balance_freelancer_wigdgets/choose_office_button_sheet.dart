import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/resources/assets_manager.dart';
import 'package:talants_valley/resources/colors_manager.dart';

import '../../../../core/provider/freelancer_provider/withdraw_freelancer_provider.dart';
import '../../../../resources/valuesManager.dart';
class ChooseOfficeButtonSheet extends StatelessWidget {
  const ChooseOfficeButtonSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle bodyTextStyle = Theme.of(context).textTheme.bodyText1!.copyWith(color: ColorManager.thirdFontColor);
    return Consumer<WithdrawFreelancerProvider>(
      builder: (context , balance , child) => Container(
        padding:  EdgeInsetsDirectional.only(
          top: AppPadding.p16.h,
          start: AppPadding.p22.w,
          end: AppPadding.p22.w,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        height: 450.h,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: AppSize.s25.h,
                child: Row(
                  children: [
                    Text("Offices", style: Theme.of(context).textTheme.subtitle1,),
                    const Spacer(),
                    IconButton(onPressed: (){Navigator.pop(context);}, icon: SvgPicture.asset(IconAssets.closeIcon , height: AppSize.s10.h, width: AppSize.s10.w,))
                  ],
                ),
              ),
              addVerticalSpace(AppSize.s5.h),
              const Divider(),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: balance.officeList.length,
                itemBuilder: (context, index) =>  InkWell(
                  child: Container(
                    height: AppSize.s70.h,
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
                        Row(
                          children: [
                            Text(" صباحاً -${balance.officeList[index].endingHour} مساءاً${balance.officeList[index].startingHour} ساعات العمل: " , style: bodyTextStyle ),
                            const Spacer(),
                            Text(balance.officeList[index].name , style: Theme.of(context).textTheme.labelMedium!.copyWith(color: ColorManager.blackColor),)
                          ],
                        ),
                        Row(
                          children: [
                            Text("\$ ${balance.officeList[index].fees!.toString()}", style: bodyTextStyle ),
                            const Spacer(),
                            Text(balance.officeList[index].address , style: Theme.of(context).textTheme.headline6)
                          ],
                        ),
                      ],
                    ),
                  ),
                  onTap: () => balance.selectOffice(officeId: balance.officeList[index].id),
                ),)


            ],
          ),
        ),
      ),
    );
  }
}
