import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talants_valley/resources/assets_manager.dart';
import 'package:talants_valley/resources/colors_manager.dart';
import 'package:talants_valley/resources/values_manager.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        centerTitle: false,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppPadding.p10.w, vertical: AppPadding.p22.h),
            height: AppSize.s96.h,
            color: ColorManager.whiteColor,
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: AppSize.s6.w, vertical: AppSize.s6.h),
                        height: AppSize.s48.h,
                        width: AppSize.s48.w,
                        decoration: BoxDecoration(
                          color: ColorManager.whiteColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 3, color: Colors.black.withOpacity(0.5), spreadRadius: 0.5)
                          ],
                        ),
                        child: SvgPicture.asset(
                          IconAssets.cashIcon,
                          height: 35.h,
                          width: 38.w,
                        )),
                    // CircleAvatar(
                    //   radius: AppSize.s10.r,
                    //   backgroundColor: Colors.green,
                    // ),
                  ],
                ),
                addHorizontalSpace(AppSize.s15.w),
                SizedBox(
                  width: AppSize.s280.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Invoice Approved & Sent to Hassan Ahmed."),
                      gSV5,
                      Row(
                        children: const [
                          Text("Graphic Design \$400"),
                          Spacer(),
                          Text("2 hours ago")
                        ],
                      )
                    ],
                  ),
                ),
                gSH5,
                CircleAvatar(
                  backgroundColor: ColorManager.blueColor,
                  radius: AppSize.s5.r,
                )
              ],
            ),
          ),

          ListTile(
            leading: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: AppSize.s6.w, vertical: AppSize.s6.h),
                    height: AppSize.s48.h,
                    width: AppSize.s48.w,
                    decoration: BoxDecoration(
                      color: ColorManager.whiteColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 3, color: Colors.black.withOpacity(0.5), spreadRadius: 0.5)
                      ],
                    ),
                    child: SvgPicture.asset(
                      IconAssets.cashIcon,
                      height: 35.h,
                      width: 38.w,
                    )),
                CircleAvatar(
                  radius: AppSize.s10.r,
                  backgroundColor: Colors.green,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
