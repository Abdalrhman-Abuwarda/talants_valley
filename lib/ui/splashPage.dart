import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talants_valley/resources/assets_manager.dart';

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

  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), (){
      if(SharedPrefController().accessToken == ""){
        debugPrint("Tis is null ");
        ServiceNavigations.serviceNavi.pushNamedReplacement(RouteGenerator.signInPage);
      }
      else if(isLoggedIn && SharedPrefController().getUser().verifiedEmail && SharedPrefController().getUser().verifiedMobile && SharedPrefController().getUser().role == 0){
        ServiceNavigations.serviceNavi.pushNamedReplacement(RouteGenerator.mainFreelancerPage);
      }
      else if(isLoggedIn && SharedPrefController().getUser().verifiedEmail && SharedPrefController().getUser().verifiedMobile && SharedPrefController().getUser().role == 1){
        ServiceNavigations.serviceNavi.pushNamedReplacement(RouteGenerator.mainTeamPage);
      }
      else if(isLoggedIn && SharedPrefController().getUser().verifiedEmail != true && SharedPrefController().getUser().verifiedMobile != true){
        ServiceNavigations.serviceNavi.pushNamedReplacement(RouteGenerator.mainVerificationPage);
      }
      // else if(SharedPrefController().getUser() == null){
      //   print("Tis is null ");
      //   ServiceNavigations.serviceNavi.pushNamedReplacement(RouteGenerator.signInPage);
      // }
      else{
        ServiceNavigations.serviceNavi.pushNamedReplacement(RouteGenerator.signInPage);
      }

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
