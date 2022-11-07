import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talants_valley/resources/assetsManager.dart';

import '../core/data/local/sharedController.dart';
import '../routing/navigations.dart';
import '../routing/router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override

  final bool isLoggedIn = SharedPrefController().isLoggedIn();
  final verifiedEmail = SharedPrefController().verifiedEmail;
  final verifiedMobil = SharedPrefController().verifiedMobile;

  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), (){
      if(isLoggedIn && verifiedEmail && verifiedMobil){
        ServiceNavigations.serviceNavi.pushNamedReplacement(RouteGenerator.homePage);
      }
      else if(isLoggedIn && verifiedEmail != true && verifiedMobil != true){
        ServiceNavigations.serviceNavi.pushNamedReplacement(RouteGenerator.mainVerificationPage);
      }
      else{
        ServiceNavigations.serviceNavi.pushNamedReplacement(RouteGenerator.signInPage);
      }
      // SharedPrefController().isLoggedIn() && SharedPrefController().getData().user.verifiedMobile && SharedPrefController().getData().user.verifiedEmail ? ServiceNavigations.serviceNavi.pushNamedReplacement(RouteGenerator.mainVerificationPage)
      //     : ServiceNavigations.serviceNavi.pushNamedReplacement(RouteGenerator.settingPage);
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(ImageAssets.mainImage,
        height: 70.h,
        width: 70.w,
        ),
      ),
    );
  }
}
