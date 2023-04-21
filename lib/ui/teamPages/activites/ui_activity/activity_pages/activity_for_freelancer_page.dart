import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/ui/teamPages/activites/core_activity/activity_provider/activity_provider.dart';
import 'package:talants_valley/utils/time_extension.dart';

import '../../../../../../../resources/assets_manager.dart';
import '../../core_activity/activity_model/activity_model.dart';
import '../activity_widgets/card_item_activity.dart';
import 'main_activity_page.dart';

class ActivityForFreelancerPage extends StatelessWidget {
  const ActivityForFreelancerPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ActivityProvider>(
      builder: (context , activity , child) =>
      activity.isLoading ? const Center(child: CircularProgressIndicator(),) :
          ListView.builder(
        itemCount: activity.freelancerActivities.length,
        itemBuilder: (context, index) {
          final active = activity.freelancerActivities[index];
          return CardItemActivity(
            type: active.activityLogs.type,
            isTeam: false,
            currantScreen: currantTab,
            title: active.activityLogs.message,
            date: active.activityLogs.createdAt.convertToDate()!,
            time: active.activityLogs.createdAt.convertToTime()!,
          );
        },
        shrinkWrap: true,
      ),
    );
  }
}
