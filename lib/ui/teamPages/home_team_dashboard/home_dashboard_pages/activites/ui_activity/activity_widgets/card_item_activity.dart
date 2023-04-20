import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../../resources/colors_manager.dart';
import '../../../../../../../../resources/values_manager.dart';
import '../../core_activity/card_activity_model.dart';
import 'custam_timeline.dart';

class CardItemActivity extends StatefulWidget {
  final CardActivityModel cardItem;
  final int currantScreen;

  const CardItemActivity(
      {required this.cardItem, required this.currantScreen, Key? key})
      : super(key: key);

  @override
  State<CardItemActivity> createState() => _CardItemActivityState();
}

class _CardItemActivityState extends State<CardItemActivity> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        InkWell(
          splashColor: Colors.transparent,
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          onTap: () {
            setState(() {
              widget.cardItem.chick = !widget.cardItem.chick;
            });
          },
          child:
          Container(
            margin: const EdgeInsets.only(top: AppPadding.p5),
            height: AppSize.s60.h,
            padding: const EdgeInsets.all(AppPadding.p10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s6.r),
                border: Border.all(color: ColorManager.mainBorderColor),
                color: widget.cardItem.chick
                    ? ColorManager.enableCardColor
                    : null),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(AppPadding.p12),
                  height: AppSize.s40.h,
                  width: AppSize.s40.w,
                  decoration: BoxDecoration(
                      color: ColorManager.mainColor,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: const [
                        BoxShadow(
                            color: ColorManager.unselectedAppBarColor,
                            offset: Offset(0, 2),
                            blurRadius: 6)
                      ]),
                  child: SvgPicture.asset(widget.cardItem.image),
                ),
                addHorizontalSpace(AppSize.s10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.cardItem.date,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        addHorizontalSpace(AppSize.s5.w),
                        Text(
                          widget.cardItem.time,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                    Text(
                      widget.cardItem.name,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        if(widget.currantScreen == 1)
            ...[ Visibility(
                visible: widget.cardItem.chick ? true : false,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: a.length,
                  itemBuilder: (context, index) {
                    return a[index];
                  },


                )
            ),
              SizedBox(
                height: widget.cardItem.chick ? AppSize.s15.h : null,
              )
            ] ,

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
List<CustomTimeLine> a =[const CustomTimeLine(),const CustomTimeLine(),const CustomTimeLine()];
