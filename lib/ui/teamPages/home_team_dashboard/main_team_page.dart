import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/resources/assets_manager.dart';
import 'package:talants_valley/resources/colors_manager.dart';
import 'package:talants_valley/ui/teamPages/home_team_dashboard/payoutsPages/main_payount_page.dart';
import 'package:talants_valley/ui/teamPages/home_team_dashboard/user_management_pages/main_user_management_page.dart';

import '../../../core/provider/team_provider/mainTeamProvider.dart';
import 'analytics_pages/main_analytics_page.dart';
import 'home_dashboard_pages/home_team_dshboard_page.dart';
import 'invoices_pages/main_invoice_page.dart';
class MainTeamPage extends StatefulWidget {
   const MainTeamPage({Key? key}) : super(key: key);

  @override
  State<MainTeamPage> createState() => _MainTeamPageState();
}

class _MainTeamPageState extends State<MainTeamPage> {

  static  final List<Widget> _pages = <Widget>[
    const TeamDashboardPage(),
    const MainPayoutsPage(),
    const MainInvoicesPage(),
    const MainAnalyticsPage(),
    const MainUserManagementPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainTeamProvider>(
      builder: (context, mainTeam, child) => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 25,
          elevation: 0,
          // unselectedItemColor: ColorManager.blackColor,
          // selectedItemColor: ColorManager.blueColor,
          backgroundColor: ColorManager.whiteColor,
          currentIndex: mainTeam.selectedIndex,
          onTap: mainTeam.onItemTapped,
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset(ImageAssets.homeBottomBarImage, color: mainTeam.selectedIndex == 0 ? ColorManager.blueColor : ColorManager.blackColor,),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(ImageAssets.cashBottomBarImage, color: mainTeam.selectedIndex == 1 ? ColorManager.blueColor : ColorManager.blackColor,),
              label: 'cash',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(ImageAssets.invoiceBottomBarImage, color: mainTeam.selectedIndex == 2 ? ColorManager.blueColor : ColorManager.blackColor,),
              label: 'cash',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(ImageAssets.analyticsBottomBarImage, color: mainTeam.selectedIndex == 3 ? ColorManager.blueColor : ColorManager.blackColor,),
              label: 'Chats',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(ImageAssets.userBottomBarImage, color: mainTeam.selectedIndex == 4 ? ColorManager.blueColor : ColorManager.blackColor,
              ),
              label: 'Chats',
            ),
          ],
        ),
        body: _pages.elementAt(mainTeam.selectedIndex),
      ),
    );
  }
}
