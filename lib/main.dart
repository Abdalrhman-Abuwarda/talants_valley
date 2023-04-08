import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/core/provider/freelancer_provider/general_freelancer_provider.dart';
import 'package:talants_valley/core/provider/teamProvider/mainTeamProvider.dart';
import 'package:talants_valley/core/provider/teamProvider/userManagementProvider.dart';
import 'package:talants_valley/locator.dart';
import 'package:talants_valley/resources/themeManager.dart';
import 'package:talants_valley/routing/navigations.dart';
import 'package:talants_valley/routing/routes.dart';
import 'package:talants_valley/ui/splashPage.dart';
import 'package:talants_valley/utils/helper.dart';

import 'core/data/local/sharedController.dart';
import 'core/provider/authProvider.dart';
import 'core/provider/formProvider.dart';
import 'core/provider/freelancer_provider/payout_freelancer_provider.dart';
import 'core/provider/verificationProvider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations;
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  setup();
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
        ChangeNotifierProvider(create: (_) => AuthProvider(), child: const MyApp()),
        ChangeNotifierProvider(create: (_) => FormProvider(), child: const MyApp()),
        ChangeNotifierProvider(create: (_) => VerificationProvider(), child: const MyApp()),
        ChangeNotifierProvider(create: (_) => MainTeamProvider(), child: const MyApp()),
        ChangeNotifierProvider(create: (_) => UserManagementProvider(), child: const MyApp()),
        ChangeNotifierProvider(create: (_) => GeneralFreelancerProvider(), child: const MyApp()),
        ChangeNotifierProvider(create: (_) => PayoutFreelancerProvider(), child: const MyApp()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (context, child) =>
            MaterialApp(
              scaffoldMessengerKey: Helpers.scaffoldKey,
              debugShowCheckedModeBanner: false,
              title: 'Talants Valley',
              theme: ThemeManager.lightTheme,
              home: const SplashPage() ,
              navigatorKey: ServiceNavigation.serviceNavi.navKey,
              onGenerateRoute: RoutsGenerate.generateRoute,
            ),
      ),
    );
  }
}
