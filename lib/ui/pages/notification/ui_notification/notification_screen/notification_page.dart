import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talants_valley/resources/values_manager.dart';

import '../../core/local_notification_service.dart';
import '../notification_widget/card_notificaion_widget.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Allow Notifications'),
            content: const Text('Our app would like to send you notifications'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Don\'t Allow',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
              ),
              TextButton(
                  onPressed: () => AwesomeNotifications()
                      .requestPermissionToSendNotifications()
                      .then((_) => Navigator.pop(context)),
                  child: const Text(
                    'Allow',
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ))
            ],
          ),
        );
      }
    });


  }
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        centerTitle: false,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 20,
              itemBuilder: (context, index) => const CardNotificationWidget(),),
            addVerticalSpace(AppSize.s20.h),
            const ElevatedButton(onPressed: createLocalNotification , child: Text("Set Notification")),
            addVerticalSpace(AppSize.s40.h),

            // Container(
            //   padding: EdgeInsets.symmetric(
            //       horizontal: AppPadding.p10.w, vertical: AppPadding.p22.h),
            //   height: AppSize.s96.h,
            //   color: ColorManager.whiteColor,
            //   child: Row(
            //     children: [
            //       Stack(
            //         alignment: Alignment.bottomRight,
            //         children: [
            //           Container(
            //             padding: EdgeInsets.all(AppSize.s10,),
            //               height: AppSize.s48.h,
            //               width: AppSize.s48.w,
            //               decoration: BoxDecoration(
            //                 color: ColorManager.whiteColor,
            //                 shape: BoxShape.circle,
            //                 boxShadow: [
            //                   BoxShadow(
            //                       blurRadius: 3, color: Colors.black.withOpacity(0.5), spreadRadius: 0.5)
            //                 ],
            //               ),
            //               child: SvgPicture.asset(
            //                 IconAssets.cashIcon,
            //                 height: 35.h,
            //                 width: 38.w,
            //               )),
            //           // CircleAvatar(
            //           //   radius: AppSize.s10.r,
            //           //   backgroundColor: Colors.green,
            //           // ),
            //         ],
            //       ),
            //       addHorizontalSpace(AppSize.s15.w),
            //       SizedBox(
            //         width: AppSize.s280.w,
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.start,
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             const Text("Invoice Approved & Sent to Hassan Ahmed."),
            //             gSV5,
            //             Row(
            //               children: const [
            //                 Text("Graphic Design \$400"),
            //                 Spacer(),
            //                 Text("2 hours ago")
            //               ],
            //             )
            //           ],
            //         ),
            //       ),
            //       gSH5,
            //       CircleAvatar(
            //         backgroundColor: ColorManager.blueColor,
            //         radius: AppSize.s5.r,
            //       )
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

