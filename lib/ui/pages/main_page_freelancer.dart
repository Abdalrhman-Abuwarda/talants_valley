import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/core/provider/freelancer_provider/general_freelancer_provider.dart';

import '../../resources/assets_manager.dart';
import '../../resources/colors_manager.dart';
import 'balance_freelancer/balance_freelancer_page.dart';
import 'help_freelancer/main_help_freelancer_page.dart';
import 'home_freelancer/home_freelancer_page.dart';
import 'invoice_freelancer/main_invoice_freelancer_page.dart';

class MainPageFreelancer extends StatelessWidget {
  const MainPageFreelancer({Key? key}) : super(key: key);

  static  final List<Widget> _pages = <Widget>[
     HomeFreelancerPage(),
    const MainInvoiceFreeLancerPage(),
    const BalanceFreelancerPage(),
    const MainHelpFreelancerPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<GeneralFreelancerProvider>(
      builder: (context, general, child) => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 25,
          elevation: 0,
          // unselectedItemColor: ColorManager.blackColor,
          // selectedItemColor: ColorManager.blueColor,
          backgroundColor: ColorManager.whiteColor,
          currentIndex: general.selectedIndex,
          onTap: general.onItemTapped,
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(IconAssets.homeFreelancerIcon, color: general.selectedIndex == 0 ? ColorManager.blueColor : ColorManager.unselectedAppBarColor, ),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(IconAssets.invoiceFreelancerIcon, color: general.selectedIndex == 1 ? ColorManager.blueColor : ColorManager.unselectedAppBarColor, ),
              label: 'invoice',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset( general.selectedIndex == 2 ? IconAssets.selectedBalanceFreelancerIcon : IconAssets.unselectedBalanceFreelancerIcon  ),
              label: 'balance',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(IconAssets.helpFreelancerIcon, color: general.selectedIndex == 3 ? ColorManager.blueColor : ColorManager.unselectedAppBarColor, ),
              label: 'help',
            ),

          ],
        ),
        body: _pages.elementAt(general.selectedIndex),
      ),
    );
  }
}
