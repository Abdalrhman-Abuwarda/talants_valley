import 'package:flutter/material.dart';

import '../../../../../../../resources/assets_manager.dart';
import '../../core_activity/activity_model/activity_model.dart';
import '../activity_widgets/card_item_activity.dart';
import 'main_activity_page.dart';

class ActivityForTeamPage extends StatelessWidget {
  const ActivityForTeamPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return CardItemActivity(
          type: "",
          isTeam: true,
          currantScreen: currantTab,
          time: "3:19 pm",
          date: "17 Aug, 22",
          title: "Zain Zaira requested \$400 cash payout",
        );
      },
      shrinkWrap: true,
    );
  }
}
