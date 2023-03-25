import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/core/provider/teamProvider/userMangementProvider.dart';
import 'package:talants_valley/resources/colors_manager.dart';
import 'package:talants_valley/resources/valuesManager.dart';

import '../../../../routing/navigations.dart';
import '../../../../routing/router.dart';
import '../../../shared/customWidgets/TeamUserMangement/userDetail/financialInformationCard.dart';
import '../../../shared/customWidgets/TeamUserMangement/userDetail/personalInformationCard.dart';
import '../../../shared/customWidgets/TeamUserMangement/userDetail/updatesCard.dart';

class UserDetailsPage extends StatelessWidget {
   UserDetailsPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: AppSize.s80.h,
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: (){ServiceNavigation.serviceNavi
            .pushNamedAndRemoveUtils(RouteGenerator.mainUserManagementPage);},
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text("User Name"),
        actions: [
          IconButton(onPressed: (){},
              icon: const Icon(Icons.add, color: ColorManager.blueColor,)),
          addHorizontalSpace(AppSize.s10.h),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.s15.h),
        child: Consumer<UserManagementProvider>(
          builder: (context, userManagement, child) =>
              SingleChildScrollView(
                child: Column(
                  children: [
                     PersonalInformationCard(fullName: "${userManagement.userDetails!.firstName} ${userManagement.userDetails!.firstName}",
                      email: userManagement.userDetails!.email,
                      phone: "${userManagement.userDetails!.mobile}",
                      id: userManagement.userDetails!.id,
                      address: userManagement.userDetails!.address!.country,
                      role: userManagement.userDetails!.role.toString(), password: 'Send Recovery Email'
                      ,
                       onTapEdit: (){ServiceNavigation.serviceNavi
                           .pushNamedAndRemoveUtils(RouteGenerator.editUserInformationPage);},
                       onTapRole: (){
                         AlertDialog(
                             title: const Text("Example"),
                             content: const Text("Do you like this book?"),
                             actions: [
                               TextButton(onPressed: (){}, child: Text("Team")),
                               TextButton(onPressed: (){}, child: Text("Block")),
                             ],
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(30),
                             )
                         );
                       },
                    ),
                    addVerticalSpace(AppSize.s10.h),
                    UpdatesCard(created: userManagement.userDetails!.createdAt!.substring(0, 10),
                      lastLogin: userManagement.userDetails!.lastLogin!.substring(0, 10),),
                    addVerticalSpace(AppSize.s10.h),
                    FinancialInformatioCard(balance: userManagement.userDetails!.balance.toString(), profit: userManagement.userDetails!.profit.toString(), revenue: userManagement.userDetails!.revenue.toString(),),
                  ],
                ),
              ),    
        ),
      ),
    );
  }
}





