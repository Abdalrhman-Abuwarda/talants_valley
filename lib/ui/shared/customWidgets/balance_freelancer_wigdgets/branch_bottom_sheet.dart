import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../core/provider/freelancer_provider/balance_freelancer_provider.dart';
import '../../../../resources/assets_manager.dart';
import '../../../../resources/valuesManager.dart';

class BranchBottomSheet extends StatelessWidget {
  const BranchBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle? subtitleStyle = Theme.of(context).textTheme.subtitle1;
    return Consumer<BalanceFreelancerProvider>(
      builder: (context , balance , child) => Container(
        padding:  EdgeInsetsDirectional.only(
          top: AppPadding.p20.h,
          start: AppPadding.p22.w,
          end: AppPadding.p32.w,
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
                    Text("Branch", style: subtitleStyle,),
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
                  itemCount: balance.branchesBank.length,
                  itemBuilder: (context, index) =>  InkWell(
                  child: Container(
                    margin: EdgeInsetsDirectional.only(bottom: AppMargin.m24.h),
                    child:
                      Text( balance.branchesBank[index] , style: subtitleStyle, ),
                  ),
                  onTap: () => balance.selectBranch(branch: balance.branchesBank[index]),
                ),),
              )


            ],
          ),
        ),
      ),
    );
  }
}
