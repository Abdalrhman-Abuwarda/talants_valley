import 'package:flutter/material.dart';

import '../../../../../../../resources/assets_manager.dart';
import '../../core_activity/card_activity_model.dart';
import '../activity_widgets/card_item_activity.dart';
import 'activity_page.dart';

class ActivityForFreelancerPage extends StatelessWidget {
  const ActivityForFreelancerPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return CardItemActivity(
          cardItem: CardActivityModel(
              image: IconAssets.cashIcon,
              name:
              "Zain Zaira requested \$400 cash payout",
              date: "17 Aug, 22",
              time: "3:19 pm"),
          currantScreen: currantTab,
        );
      },
      shrinkWrap: true,
    );
  }
}
