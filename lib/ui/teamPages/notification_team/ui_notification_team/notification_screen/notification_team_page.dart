import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/resources/values_manager.dart';
import 'package:talants_valley/ui/teamPages/notification_team/notification_team_core/notification_team_provider/notification_team_provider.dart';
import 'package:talants_valley/utils/time_extension.dart';

import '../../notification_team_core/notification_setup/local_notification_service.dart';
import '../notification_widget/card_notificaion_widget.dart';

class NotificationTeamPage extends StatefulWidget {
  const NotificationTeamPage({Key? key}) : super(key: key);

  @override
  State<NotificationTeamPage> createState() => _NotificationTeamPageState();
}

class _NotificationTeamPageState extends State<NotificationTeamPage> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<NotificationTeamProvider>(context, listen: false)
        .getNotifications();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        Provider.of<NotificationTeamProvider>(context, listen: false).markNotificationAsSeen()
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        centerTitle: false,
        backgroundColor: Colors.transparent,
      ),
      body: Consumer<NotificationTeamProvider>(
        builder: (context, logic, child) => logic.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: logic.notifications.length,
                      itemBuilder: (context, index) {
                        final notification = logic.notifications[index];
                        return CardNotificationWidget(
                          title:
                              "${notification.notifications!.first.title} and ${notification.notifications!.length} other",
                          subTitle: notification.notifications!.first.content,
                          time: notification.notifications!.first.createdAt
                                      .differenceDay()! !=
                                  "Today"
                              ? "${notification.notifications!.first.createdAt.differenceDay()!} at ${notification.notifications!.first.createdAt.convertToTime()}"
                              : notification.notifications!.first.createdAt
                                  .differenceHour()!,
                        );
                      },
                    ),

                    addVerticalSpace(AppSize.s20.h),
                    const ElevatedButton(
                        onPressed: createLocalNotification,
                        child: Text("Set Notification")),
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
      ),
    );
  }
}
