import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/core/provider/teamProvider/mainTeamProvider.dart';
import 'package:talants_valley/resources/assetsManager.dart';
import 'package:talants_valley/resources/colorsManager.dart';
import 'package:talants_valley/resources/valuesManager.dart';
import 'package:talants_valley/ui/teamPages/homeTeamDashboard/payoutsPages/mainPayountsPage.dart';
import 'package:talants_valley/ui/teamPages/homeTeamDashboard/userManagementPages/mainUserManagementPage.dart';

import 'analyticsPages/mainAnalyticsPage.dart';
import 'homeDashboardPages/homeTeamDshboardPage.dart';
import 'invoicesPages/mainInvoicesPage.dart';
class HomeTeamPage extends StatefulWidget {
   HomeTeamPage({Key? key}) : super(key: key);

  @override
  State<HomeTeamPage> createState() => _HomeTeamPageState();
}

class _HomeTeamPageState extends State<HomeTeamPage> {

  static  final List<Widget> _pages = <Widget>[
    const TeamDashboardPage(),
    const MainPayoutsPage(),
    const MainInvoicesPage(),
    const MainAnalyticsPage(),
    MainUserManagementPage(),
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
