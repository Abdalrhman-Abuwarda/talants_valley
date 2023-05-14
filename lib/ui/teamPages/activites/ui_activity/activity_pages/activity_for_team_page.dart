import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/resources/values_manager.dart';
import 'package:talants_valley/ui/teamPages/activites/ui_activity/activity_widgets/activity_skeleton.dart';
import 'package:talants_valley/utils/time_extension.dart';

import '../../../../shared/customWidgets/search_bar.dart';
import '../../core_activity/activity_provider/activity_provider.dart';
import '../activity_widgets/card_item_activity.dart';
import '../activity_widgets/filter_activity_button_sheet.dart';

class ActivityForTeamPage extends StatefulWidget {
  const ActivityForTeamPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ActivityForTeamPage> createState() => _ActivityForTeamPageState();
}

class _ActivityForTeamPageState extends State<ActivityForTeamPage> {
  final scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();

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
    searchController.dispose();
    super.dispose();
  }

  void handleNext() {
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        Provider.of<ActivityProvider>(context, listen: false)
            .getOtherActivitiesTeam();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ActivityProvider>(
      builder: (context, activity, child) =>
          RefreshIndicator(
            onRefresh: () => activity.getTeamActivities(),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.p20.w),
                child: Column(
                  children: [
                    SearchBar(
                        sheetPage: (
                            context) => const FilterActivityButtonSheet(),
                        searchController: searchController,
                        onChange: (value) {
                          activity.onSearchChange(
                              indexText: value, role: "team");
                        }),
                    addVerticalSpace(AppSize.s15.h),
                    activity.isLoading
                        ? ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (context, index) =>
                        const ActivitySkeleton())
                        : ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      // controller: scrollController,
                      itemCount: activity.teamActivities.length,
                      itemBuilder: (context, index) {
                        final active = activity.teamActivities[index];
                        var lastValue = activity.teamActivities.length - 1;
                        if ((index != lastValue)) {
                          return CardItemActivity(
                              onTap: () =>
                                  activity.selectTeamActivity(
                                      activityId: active.id.id),
                              type: active.activityLogs.type,
                              title: active.activityLogs.message,
                              date: active.activityLogs.createdAt
                                  .convertToDate()!,
                              time: active.activityLogs.createdAt
                                  .convertToTime()!,
                              isLoading: activity.secondIsLoading,
                              timeLine: activity.teamTimeLine,
                              isCheck: active.isCheck,);
                        } else if (activity.isLast) {
                          return const Center(
                            child: Text("No more data"),
                          );
                        } else {
                          return Padding(
                            padding:
                            EdgeInsets.symmetric(vertical: AppSize.s30.h),
                            child: const Center(
                                child: CircularProgressIndicator()),
                          );
                        }
                      },
                      shrinkWrap: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }
}
