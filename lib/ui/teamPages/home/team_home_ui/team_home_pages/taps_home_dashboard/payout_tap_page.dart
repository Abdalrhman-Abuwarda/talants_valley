import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/resources/values_manager.dart';
import 'package:talants_valley/ui/shared/customWidgets/balance_freelancer_wigdgets/withdraw_skeleton_widget.dart';
import 'package:talants_valley/ui/teamPages/home/team_home_core/home_team_dashboard_provider/home_team_dashboard_provider.dart';
import 'package:talants_valley/ui/teamPages/home/team_home_ui/team_home_widget/payout_dashboard_card.dart';

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
      body: Consumer<HomeTeamDashboardProvider>(
        builder: (context, controller, child) => Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p16.w),
            child:  Column(
              children: [
                addVerticalSpace(AppSize.s12.h),
                controller.isLoading
                    ? ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) =>
                    const WithdrawSkeleton())
                    :
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.4,
                  child: ListView.builder(
                      itemCount: controller.withdrawals.length,
                      itemBuilder: (context, index) {
                        final payout = controller.withdrawals[index];
                        return PayoutDashboardCard(officeName: payout.office!.name, freeLancerName: payout.recipient!.name,);
                      }),
                )
              ],
            )
        ),
      ),
    );
  }
}
