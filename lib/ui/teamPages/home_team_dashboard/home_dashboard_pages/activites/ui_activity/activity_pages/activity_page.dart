import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talants_valley/resources/assets_manager.dart';
import 'package:talants_valley/resources/colors_manager.dart';

import '../../../../../../../../resources/values_manager.dart';
import 'activity_for_freelancer_page.dart';
import 'activity_for_team_page.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

int currantTab = 0;

class _ActivityPageState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: ColorManager.whiteColor,
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: [
                SvgPicture.asset(IconAssets.settingsIcon),
                addHorizontalSpace(AppSize.s20.w)
              ],
              title: const Text("Activity"),
              backgroundColor: ColorManager.whiteColor,
              elevation: 0,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(AppSize.s20.h),
                child: Container(
                  padding: EdgeInsets.all(AppSize.s4.h),
                  margin: EdgeInsets.symmetric(
                      horizontal: AppSize.s20.w, vertical: AppSize.s8.h),
                  height: 40,
                  decoration: BoxDecoration(
                      color: ColorManager.mainColor,
                      borderRadius: BorderRadius.circular(AppSize.s20.r)),
                  child: TabBar(
                      onTap: (index) {
                        currantTab = index;
                        debugPrint(currantTab.toString());
                      },
                      unselectedLabelColor: ColorManager.blackColor,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: ColorManager.whiteColor),
                      tabs: [
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Team",
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ),
                        ),
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("Freelancer",
                                style: Theme.of(context).textTheme.headline3),
                          ),
                        ),
                      ]),
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
              child: Column(
                children: [
                  SizedBox(
                      height: 39,
                      child: TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: SizedBox(
                              width: AppSize.s10.w,
                              child: Row(
                                children: [
                                  addHorizontalSpace(AppSize.s10.w),
                                  SvgPicture.asset(
                                    IconAssets.searchIcon,
                                    color: ColorManager.unselectedAppBarColor,
                                  ),
                                ],
                              ),
                            ),
                            suffix: Column(
                              children: [
                                addVerticalSpace(AppSize.s20.h),
                                SvgPicture.asset(IconAssets.filterIcon,
                                    color: ColorManager.unselectedAppBarColor),
                              ],
                            ),
                            hintText: "Search"),
                      )),
                 const Expanded(
                    child: TabBarView(
                      physics:  NeverScrollableScrollPhysics(),
                      children: [
                         ActivityForTeamPage(),
                        ActivityForFreelancerPage(),
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}


