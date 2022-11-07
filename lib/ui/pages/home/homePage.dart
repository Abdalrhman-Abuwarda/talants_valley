import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/core/provider/authProvider.dart';
import 'package:talants_valley/resources/valuesManager.dart';

import '../../../core/data/local/sharedController.dart';
import '../../../core/provider/verificationProvider.dart';
import '../../../resources/colorsManager.dart';
import '../../../routing/navigations.dart';
import '../../../routing/router.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Home",
          style: Theme.of(context).textTheme.headline2,),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){
            _key.currentState!.openDrawer();
          },
        ),
      ),
      drawer: Drawer(
        child: Consumer<AuthProvider>(
         builder: (context, auth, child) =>
             ListView(
               children: [
                 ListTile(
                     onTap: (){
                       auth.logout();
                     },
                     title: Text("Logout"),
                     trailing: Icon(Icons.logout)
                 )
               ],
             ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p18.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, ${SharedPrefController().getUser().firstName}',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            addVerticalSpace(AppSize.s14.h),
            Visibility(
              visible: SharedPrefController().getUser().verifiedAddress != true || SharedPrefController().getUser().verifiedId != true ? true : false,
              child: Container(
                height: AppSize.s45.h,
                decoration: BoxDecoration(
                  color: ColorManager.whiteColor,
                  borderRadius: BorderRadius.circular(7.r)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('${SharedPrefController().getUser().verifiedAddress != true && SharedPrefController().getUser().verifiedId != true ? 2 : 1} task left to complete'),
                    SizedBox(
                      height: AppSize.s30.h,
                      width:
                      AppSize.s90.w,
                      child: ElevatedButton(
                        onPressed: (){
                          ServiceNavigations.serviceNavi
                              .pushNamedAndRemoveUtils(RouteGenerator.mainVerificationPage);
                        },
                        child: Text("Verify"),
                      ),
                    ),
                  ]
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
