import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/core/provider/teamProvider/mainTeamProvider.dart';
import 'package:talants_valley/core/provider/teamProvider/userMangementProvider.dart';
import 'package:talants_valley/resources/themeManager.dart';
import 'package:talants_valley/routing/navigations.dart';
import 'package:talants_valley/routing/routes.dart';
import 'package:talants_valley/ui/pages/auth/crateNewPassword.dart';
import 'package:talants_valley/ui/pages/auth/forgetPasswordPage.dart';
import 'package:talants_valley/ui/pages/auth/checkEmailPage.dart';
import 'package:talants_valley/ui/pages/auth/signInPage.dart';
import 'package:talants_valley/ui/pages/auth/signUpPage.dart';
import 'package:talants_valley/ui/pages/auth/successResetPassword.dart';
import 'package:talants_valley/ui/pages/verification/mainVerificationPage.dart';
import 'package:talants_valley/ui/pages/verification/verificationIDPage.dart';
import 'package:talants_valley/ui/splashPage.dart';
import 'package:talants_valley/ui/teamPages/homeTeamDashboard/HomeTeamPage.dart';
import 'package:talants_valley/ui/teamPages/homeTeamDashboard/userManagementPages/userDetailsPage.dart';
import 'package:talants_valley/utils/helper.dart';

import 'core/data/local/sharedController.dart';
import 'core/provider/authProvider.dart';
import 'core/provider/formProvider.dart';
import 'core/provider/verificationProvider.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations;
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  await ScreenUtil.ensureScreenSize();
  await SharedPrefController().initSharedPreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider(), child: MyApp()),
        ChangeNotifierProvider(create: (_) => FormProvider(), child: MyApp()),
        ChangeNotifierProvider(create: (_) => VerificationProvider(), child: MyApp()),
        ChangeNotifierProvider(create: (_) => MainTeamProvider(), child: MyApp()),
        ChangeNotifierProvider(create: (_) => UserManagementProvider(), child: MyApp()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (context, child) =>
            MaterialApp(
              scaffoldMessengerKey: Helpers.scaffoldKey,
              debugShowCheckedModeBanner: false,
              title: 'Talants Valley',
              theme: ThemeManager.lightTheme,
              home: SplashPage() ,
              navigatorKey: ServiceNavigations.serviceNavi.navKey,
              onGenerateRoute: RoutsGnerate.generateRoute,
            ),
      ),
    );
  }
}
