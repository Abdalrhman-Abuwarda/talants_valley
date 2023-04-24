import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/ui/teamPages/activites/core_activity/activity_provider/activity_provider.dart';
import 'package:talants_valley/utils/time_extension.dart';
import '../activity_widgets/card_item_activity.dart';
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
    return Consumer<ActivityProvider>(
      builder: (context , activity , child) =>
      activity.isLoading ? const Center(child: CircularProgressIndicator(),) :
          ListView.builder(
            controller: scrollController,
        itemCount: activity.freelancerActivities.length,
        itemBuilder: (context, index) {
          final active = activity.freelancerActivities[index];
          return CardItemActivity(
            onTap: () => activity.selectActivity(activityId: active.id.id),
            type: active.activityLogs.type,
            isTeam: false,
            currantScreen: currantTab,
            title: active.activityLogs.message,
            date: active.activityLogs.createdAt.convertToDate()!,
            time: active.activityLogs.createdAt.convertToTime()!,
            isCheck: active.isCheck,
          );
        },
        shrinkWrap: true,
      ),
    );
  }
}
