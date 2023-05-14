import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talants_valley/resources/assets_manager.dart';
import 'package:talants_valley/utils/time_extension.dart';

import '../../../../../../../../resources/colors_manager.dart';
import '../../../../../../../../resources/values_manager.dart';
import '../../core_activity/activity_model/activity_model.dart';
import 'custam_timeline.dart';

class CardItemActivity extends StatefulWidget {
  final String date;
  final String time;
  final String title;
  final String type;
  final void Function()? onTap;
  final bool isCheck;
  final bool isLoading;
  List<ActivityLogs>? timeLine = [];

  CardItemActivity(
      {required this.type,
      required this.date,
      required this.title,
      required this.time,
      required this.onTap,
      required this.isCheck,
      required this.isLoading,
      this.timeLine,
      Key? key})
      : super(key: key);

  @override
  State<CardItemActivity> createState() => _CardItemActivityState();
}

class _CardItemActivityState extends State<CardItemActivity> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        InkWell(
          splashColor: Colors.transparent,
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          onTap: (){
              widget.onTap!();
          },
          child: Container(
            margin: const EdgeInsets.only(top: AppPadding.p5),
            height: AppSize.s60.h,
            padding: const EdgeInsets.all(AppPadding.p10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s6.r),
                border: Border.all(color: ColorManager.mainBorderColor),
                color: widget.isCheck
                    ? ColorManager.enableCardColor
                    : Colors.transparent),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  height: AppSize.s40.h,
                  width: AppSize.s40.w,
                  decoration: const BoxDecoration(
                      color: ColorManager.mainColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: ColorManager.unselectedAppBarColor,
                            offset: Offset(0, 2),
                            blurRadius: 6)
                      ]),
                  child: SvgPicture.asset(IconAssets.cashIcon),
                ),
                addHorizontalSpace(AppSize.s10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.date,
                          style: textTheme.bodyText1,
                        ),
                        addHorizontalSpace(AppSize.s5.w),
                        Text(
                          widget.time,
                          style: textTheme.bodyText1,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Text(
                        widget.title,
                        style: textTheme.headline5,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
       ...[
          Visibility(
              visible: widget.isCheck ,
              child: widget.isLoading
                  ?  Center(
                      child: Column(
                        children: [
                          addVerticalSpace(AppSize.s10.h),
                          SizedBox(
                            height: 30.h,
                              width: 30.w,
                              child: const CircularProgressIndicator(strokeWidth: 3,)),
                        ],
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.timeLine!.length,
                      itemBuilder: (context, index) {
                        final time = widget.timeLine![index];
                        return CustomTimeLine(
                          title: time.message,
                          time:
                              "${time.createdAt.convertToDate()} ${time.createdAt.convertToTime()!}",
                        );
                      },
                    )),
          Visibility(
            visible: widget.isCheck,
            child: SizedBox(
              height: widget.isCheck ? AppSize.s15.h : null,
            ),
          )
        ],
      ],
    );
  }
}

// Container(
//   margin: const EdgeInsets.only(top: AppPadding.p5),
//   decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(AppSize.s6.r),
//       border: Border.all(color: ColorManager.mainBorderColor),
//       // color: widget.cardItem.chick
//       //     ? ColorManager.enableCardColor
//       //     : null
//   ),
//   child: ExpansionTile(
//     leading: Container(
//       padding: const EdgeInsets.all(AppPadding.p12),
//       height: AppSize.s40.h,
//       width: AppSize.s40.w,
//       decoration: BoxDecoration(
//           color: ColorManager.mainColor,
//           borderRadius: BorderRadius.circular(50),
//           boxShadow: const [
//             BoxShadow(
//                 color: ColorManager.unselectedAppBarColor,
//                 offset: Offset(0, 2),
//                 blurRadius: 6)
//           ]),
//       child: SvgPicture.asset(widget.cardItem.image),
//     ),
//     title:  Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         Row(
//           children: [
//             Text(
//               widget.cardItem.date,
//               style: Theme.of(context).textTheme.bodyText1,
//             ),
//             addHorizontalSpace(AppSize.s5.w),
//             Text(
//               widget.cardItem.time,
//               style: Theme.of(context).textTheme.bodyText1,
//             ),
//           ],
//         ),
//         addVerticalSpace(AppSize.s5.h),
//         Text(
//           widget.cardItem.name,
//           style: Theme.of(context).textTheme.headline5,
//         ),
//       ],
//     ),
//     trailing: const SizedBox(height: 5,),
//     // childrenPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
//     children: const [
//       CustomTimeLine(),
//       CustomTimeLine(),
//     ],
//     ),
// ),
// List<CustomTimeLine> a =[const CustomTimeLine(),const CustomTimeLine(),const CustomTimeLine()];
