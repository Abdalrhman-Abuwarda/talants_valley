import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/resources/values_manager.dart';
import 'package:talants_valley/ui/teamPages/activites/ui_activity/activity_widgets/card_item_activity.dart';
import 'package:talants_valley/ui/teamPages/home/team_home_core/home_team_dashboard_provider/home_team_dashboard_provider.dart';
import 'package:talants_valley/ui/teamPages/home/team_home_ui/team_home_widget/payout_dashboard_widgets/payout_dashboard_card.dart';
import 'package:talants_valley/ui/teamPages/home/team_home_ui/team_home_widget/payout_dashboard_widgets/payout_skeleton_dashboard.dart';

class PayoutsTapPage extends StatefulWidget {
  const PayoutsTapPage({Key? key}) : super(key: key);

  @override
  State<PayoutsTapPage> createState() => _PayoutsTapPageState();
}

class _PayoutsTapPageState extends State<PayoutsTapPage> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<HomeTeamDashboardProvider>(context, listen: false)
        .getWithdrawals();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p16.w),
            child: Consumer<HomeTeamDashboardProvider>(
                builder: (context, controller, child) => Column(
              children: [
                addVerticalSpace(AppSize.s12.h),
                controller.isLoading
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (context, index) =>
                            const PayoutSkeletonDashboard())
                    : SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.withdrawals.length,
                            itemBuilder: (context, index) {
                              final payout = controller.withdrawals[index];
                              return PayoutDashboardCard(
                                officeName: payout.office != null ? payout.office!.name : payout.bank!.bankName,
                                freeLancerName: payout.recipient != null ? payout.recipient!.name : payout.bank!.accountName,
                              );
                            }),
                      ),
                // addVerticalSpace(AppSize.s33.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Activity"),
                    TextButton(onPressed: () {}, child: const Text("View"))
                  ],
                ),
                CardItemActivity(
                  timeLine: const [],
                  type: 'user',
                  date: '15 Aug, 22',
                  time: '3:19 pm',
                  title: 'Dalia edit cash payout',
                  onTap: () {},
                  isCheck: false,
                  isLoading: false,
                )
              ],
            )),
      ),
    );
  }
}
