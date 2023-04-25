import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../resources/assets_manager.dart';
import '../../../../../resources/colors_manager.dart';
import '../../../../../resources/values_manager.dart';
class CardNotificationWidget extends StatelessWidget {
  const CardNotificationWidget({
    required this.title,
    required this.subTitle,
    Key? key,
  }) : super(key: key);

  final String title;
  final String subTitle;



  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return ListTile(
      leading: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
              padding: const EdgeInsets.all(AppSize.s10),
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
            radius: AppSize.s8.r,
            backgroundColor: Colors.green,
          ),
        ],
      ),
      title: Text(title , overflow: TextOverflow.ellipsis, style: textTheme.headline3!.copyWith(fontWeight: FontWeight.normal),),
      subtitle: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
              child: Text(subTitle, style: textTheme.bodyText2!.copyWith(color: ColorManager.labelFontColor), overflow: TextOverflow.ellipsis,)),
          const Spacer(),
          Text("2 hours ago" , style: textTheme.bodyText1!.copyWith(color: ColorManager.grayColor))
        ],
      ),
      trailing:  CircleAvatar(
        backgroundColor: ColorManager.blueColor,
        radius: AppSize.s5.r,
      ),
    );
  }
}
