import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talants_valley/resources/colors_manager.dart';
import 'package:talants_valley/resources/valuesManager.dart';
import 'package:talants_valley/ui/teamPages/homeTeamDashboard/homeDashboardPages/tapsHomeDashboard/allTapPage.dart';
import 'package:talants_valley/ui/teamPages/homeTeamDashboard/homeDashboardPages/tapsHomeDashboard/invoicesTapPage.dart';
import 'package:talants_valley/ui/teamPages/homeTeamDashboard/homeDashboardPages/tapsHomeDashboard/payoutsTapPage.dart';
import 'package:talants_valley/ui/teamPages/homeTeamDashboard/homeDashboardPages/tapsHomeDashboard/usersTapPage.dart';

class TeamDashboardPage extends StatelessWidget {
  const TeamDashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            // toolbarHeight: 50,
            title: const Text("Team Dashboard"),
            backgroundColor: Colors.transparent,
            actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.settings))],
            bottom: TabBar(
              // indicatorWeight: 0,
              indicatorPadding: EdgeInsets.symmetric(horizontal: AppSize.s12.w, ),
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(5.r)), // Creates border
                  color: ColorManager.whiteColor),
              tabs: [
                Tab(text: "All", height: 25.h, ),
                Tab(text: "Invoices", height: 25.h,),
                Tab(text: "Payouts", height: 25.h,),
                Tab(text: "Users", height: 25.h,),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              AllTapPage(),
              InvoicesTapPage(),
              PayoutsTapPage(),
              UsersTapPage(),
            ],
          ),
        ));
  }
}
