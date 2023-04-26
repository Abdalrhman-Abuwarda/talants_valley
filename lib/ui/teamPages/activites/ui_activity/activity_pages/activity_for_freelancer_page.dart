import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/ui/teamPages/activites/core_activity/activity_provider/activity_provider.dart';
import 'package:talants_valley/utils/time_extension.dart';
import '../../../../../resources/assets_manager.dart';
import '../../../../../resources/colors_manager.dart';
import '../../../../../resources/values_manager.dart';
import '../activity_widgets/card_item_activity.dart';
import '../activity_widgets/custam_timeline.dart';
import 'main_activity_page.dart';

class ActivityForFreelancerPage extends StatefulWidget {
  const ActivityForFreelancerPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ActivityForFreelancerPage> createState() => _ActivityForFreelancerPageState();
}

class _ActivityForFreelancerPageState extends State<ActivityForFreelancerPage> {

  final scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    handleNext();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.dispose();
    super.dispose();
  }


  void handleNext() {
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        Provider.of<ActivityProvider>(context, listen: false).getOtherActivitiesFreelancer();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Consumer<ActivityProvider>(
      builder: (context , activity , child) =>
      activity.isLoading ? const Center(child: CircularProgressIndicator(),) :
          ListView.builder(
            controller: scrollController,
        itemCount: activity.freelancerActivities.length,
        itemBuilder: (context, index) {
          final active = activity.freelancerActivities[index];
          return Column(
            children: [
              InkWell(
                splashColor: Colors.transparent,
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                onTap: (){

                    activity.selectActivity(activityId: active.id.id);

                },
                child: Container(
                  margin: const EdgeInsets.only(top: AppPadding.p5),
                  height: AppSize.s60.h,
                  padding: const EdgeInsets.all(AppPadding.p10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.s6.r),
                      border: Border.all(color: ColorManager.mainBorderColor),
                      color: active.isCheck
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
                                active.activityLogs.createdAt.convertToDate()!,
                                style: textTheme.bodyText1,
                              ),
                              addHorizontalSpace(AppSize.s5.w),
                              Text(
                                active.activityLogs.createdAt.convertToTime()!,
                                style: textTheme.bodyText1,
                              ),

                            ],
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Text(
                              active.activityLogs.message,
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
                    visible: active.isCheck ,
                    child: activity.secondIsLoading
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
                      itemCount: activity.tileLine.length,
                      itemBuilder: (context, index) {
                        final time = activity.tileLine[index];
                        return CustomTimeLine(
                          title: time.message,
                          time:
                          "${time.createdAt.convertToDate()} ${time.createdAt.convertToTime()!}",
                        );
                      },
                    )),
                Visibility(
                  visible: active.isCheck,
                  child: SizedBox(
                    height: active.isCheck ? AppSize.s15.h : null,
                  ),
                )
              ],
            ],
          );

          //   CardItemActivity(
          //   onTap: () => activity.selectActivity(activityId: active.id.id),
          //   type: active.activityLogs.type,
          //   isTeam: false,
          //   currantScreen: currantTab,
          //   title: active.activityLogs.message,
          //   date: active.activityLogs.createdAt.convertToDate()!,
          //   time: active.activityLogs.createdAt.convertToTime()!,
          //   isCheck: active.isCheck,
          //   isLoading: activity.secondIsLoading,
          //   timeLine: activity.tileLine,
          // );
        },
        shrinkWrap: true,
      ),
    );
  }
}
