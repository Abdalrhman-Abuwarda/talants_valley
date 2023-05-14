import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/ui/teamPages/activites/core_activity/activity_provider/activity_provider.dart';
import 'package:talants_valley/utils/time_extension.dart';
import '../../../../../resources/values_manager.dart';
import '../../../../shared/customWidgets/search_bar.dart';
import '../activity_widgets/card_item_activity.dart';
import '../activity_widgets/filter_activity_button_sheet.dart';
import 'main_activity_page.dart';

class ActivityForFreelancerPage extends StatefulWidget {
  const ActivityForFreelancerPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ActivityForFreelancerPage> createState() =>
      _ActivityForFreelancerPageState();
}

class _ActivityForFreelancerPageState extends State<ActivityForFreelancerPage> {
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
            .getOtherActivitiesFreelancer();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ActivityProvider>(
      builder: (context, activity, child) => RefreshIndicator(
        onRefresh: () => activity.getFreelancerActivities(),
        child: SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p20.w),
            child: Column(
              children: [
                SearchBar(
                    sheetPage: (context) => const FilterActivityButtonSheet(),
                    searchController: searchController,
                    onChange: (value) {
                      debugPrint("This is inside onChange");
                      activity.onSearchChange(indexText: value, role: "user");
                    }),
                activity.freelancerLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        // controller: scrollController,
                        itemCount: activity.freelancerActivities.length,
                        itemBuilder: (context, index) {
                          var lastValue =
                              activity.freelancerActivities.length - 1;
                          final active = activity.freelancerActivities[index];
                          if (index != lastValue) {
                            return CardItemActivity(
                              onTap: () => activity.selectFreelancerActivity(
                                  activityId: active.id.id),
                              type: active.activityLogs.type,
                              title: active.activityLogs.message,
                              date: active.activityLogs.createdAt
                                  .convertToDate()!,
                              time: active.activityLogs.createdAt
                                  .convertToTime()!,
                              isCheck: active.isCheck,
                              isLoading: activity.secondIsLoading,
                              timeLine: activity.freelancerTimeLine,
                            );
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
