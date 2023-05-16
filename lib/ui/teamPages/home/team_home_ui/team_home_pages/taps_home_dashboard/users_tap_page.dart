import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talants_valley/resources/values_manager.dart';
import 'package:talants_valley/ui/teamPages/home/team_home_ui/team_home_widget/user_dashboard_widgets/user_dashboard_card.dart';
import 'package:talants_valley/ui/teamPages/home/team_home_ui/team_home_widget/user_dashboard_widgets/user_dashboard_skeleton.dart';

class UsersTapPage extends StatelessWidget {
  const UsersTapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
        child: Column(
          children: [
            addVerticalSpace(AppSize.s15.h),
            const UserDashboardCard(),
           const UserSkeletonDashboard(),
          ],
        ),
      ),
    );
  }
}
