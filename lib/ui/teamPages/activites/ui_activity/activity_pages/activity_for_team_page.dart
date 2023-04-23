import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/utils/time_extension.dart';

import '../../core_activity/activity_provider/activity_provider.dart';
import '../activity_widgets/card_item_activity.dart';
import 'main_activity_page.dart';

class ActivityForTeamPage extends StatefulWidget {
  const ActivityForTeamPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ActivityForTeamPage> createState() => _ActivityForTeamPageState();
}

class _ActivityForTeamPageState extends State<ActivityForTeamPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ActivityProvider>(
      builder: (context , activity , child) =>
      activity.isLoading ? const Center(child: CircularProgressIndicator(),) :
      ListView.builder(
        itemCount: activity.teamActivities.length,
        itemBuilder: (context, index) {
          final active = activity.teamActivities[index];
          return CardItemActivity(
            onTap: null,
            type: active.activityLogs.type,
            isTeam: true,
            currantScreen: currantTab,
            title: active.activityLogs.message,
            date: active.activityLogs.createdAt.convertToDate()!,
            time: active.activityLogs.createdAt.convertToTime()!,
            isCheck: false,
          );
        },
        shrinkWrap: true,
      ),
    );
  }
}
