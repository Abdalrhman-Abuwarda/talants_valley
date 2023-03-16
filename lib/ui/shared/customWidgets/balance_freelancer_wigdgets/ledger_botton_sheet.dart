import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/provider/freelancer_provider/withdraw_freelancer_provider.dart';
import '../../../../resources/valuesManager.dart';

class LedgerBottomSheet extends StatelessWidget {
  const LedgerBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle? subtitleStyle = Theme.of(context).textTheme.subtitle1;
    return Consumer<WithdrawFreelancerProvider>(
      builder: (context , balance , child) => Container(
        padding:  EdgeInsetsDirectional.only(
          top: AppPadding.p20.h,
          start: AppPadding.p22.w,
          end: AppPadding.p32.w,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        height: AppSize.s250.h,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: AppSize.s25.h,
                child: Row(

                  children: [
                    Text("Ledger", style: subtitleStyle,),
                    const Spacer(),
                    IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.cancel_outlined))
                  ],
                ),
              ),
              addVerticalSpace(AppSize.s18.h),
              const Divider(),
              addVerticalSpace(AppSize.s18.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.p12.w),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: balance.ledgersBank.length,
                  itemBuilder: (context, index) =>  InkWell(
                    child: Container(
                      margin: EdgeInsetsDirectional.only(bottom: AppMargin.m24.h),
                      child:
                      Row(
                        children: [
                          Text( balance.ledgersBank[index] , style: subtitleStyle, ),
                          const Spacer(),
                          Text(index == 0 ? "جاري" : index == 1 ? "توفير" : "توفير لكل مواطن" , style: Theme.of(context).textTheme.labelMedium,)
                        ],
                      ),
                    ),
                    onTap: () => balance.selectLedger(ledger: balance.ledgersBank[index]),
                  ),),
              )


            ],
          ),
        ),
      ),
    );
  }
}
