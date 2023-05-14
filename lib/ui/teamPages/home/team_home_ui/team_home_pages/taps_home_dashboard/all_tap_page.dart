import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talants_valley/resources/values_manager.dart';
import 'package:talants_valley/ui/teamPages/home/team_home_ui/team_home_widget/invoice_dashboard_card.dart';
import 'package:talants_valley/ui/teamPages/home/team_home_ui/team_home_widget/payout_dashboard_card.dart';
import 'package:talants_valley/ui/teamPages/home/team_home_ui/team_home_widget/user_dashboard_card.dart';

class AllTapPage extends StatelessWidget {
  const AllTapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p16.w),
      child: Column(
        children: [
          addVerticalSpace(AppSize.s12.h),
          const InvoiceDashboardCard(),
          const UserDashboardCard(),
           const PayoutDashboardCard(officeName: '', freeLancerName: "",)
        ],
      ),
    ));
  }
}


