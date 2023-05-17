
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/core/provider/freelancer_provider/general_freelancer_provider.dart';
import 'package:talants_valley/locator.dart';
import 'package:talants_valley/resources/colors_manager.dart';
import 'package:talants_valley/resources/theme_manager.dart';
import 'package:talants_valley/routing/navigations.dart';
import 'package:talants_valley/routing/routes.dart';
import 'package:talants_valley/ui/teamPages/activites/core_activity/activity_provider/activity_provider.dart';
import 'package:talants_valley/ui/teamPages/activites/ui_activity/activity_pages/main_activity_page.dart';
import 'package:talants_valley/ui/teamPages/home/team_home_core/home_team_dashboard_provider/home_team_dashboard_provider.dart';
import 'package:talants_valley/ui/teamPages/notification_team/notification_team_core/notification_setup/onesignal_service.dart';
import 'package:talants_valley/ui/teamPages/notification_team/notification_team_core/notification_team_provider/notification_team_provider.dart';
import 'package:talants_valley/utils/helper.dart';

import 'core/data/local/shared_controller.dart';
import 'core/provider/auth_and_verification_provider/auth_provider.dart';
import 'core/provider/formProvider.dart';
import 'core/provider/freelancer_provider/payout_freelancer_provider.dart';
import 'core/provider/auth_and_verification_provider/verification_provider.dart';
import 'core/provider/team_provider/main_team_provider.dart';
import 'core/provider/team_provider/user_management_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations;
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: ColorManager.blackColor,
    systemNavigationBarDividerColor: ColorManager.whiteColor
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // await NotificationService().initNotification();
  // NotificationService().requestIOSPermissions();
  setup();
  await ScreenUtil.ensureScreenSize();
  await SharedPrefController().initSharedPreferences();
  runApp(const MyApp());
  OneSignalService().oneSignalSService();
  AwesomeNotifications().initialize(
    'resource://drawable/res_notification_app_icon',
    [
      NotificationChannel(
        channelKey: 'basic_channel2',
        channelName: 'Basic Notifications2',
        defaultColor: Colors.teal,
        importance: NotificationImportance.High,
        channelShowBadge: true,
        channelDescription: '',
      ),
    ],
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => AuthProvider(), child: const MyApp()),
        ChangeNotifierProvider(
            create: (_) => FormProvider(), child: const MyApp()),
        ChangeNotifierProvider(
            create: (_) => VerificationProvider(), child: const MyApp()),
        ChangeNotifierProvider(
            create: (_) => MainTeamProvider(), child: const MyApp()),
        ChangeNotifierProvider(
            create: (_) => UserManagementProvider(), child: const MyApp()),
        ChangeNotifierProvider(
            create: (_) => GeneralFreelancerProvider(), child: const MyApp()),
        ChangeNotifierProvider(
            create: (_) => PayoutFreelancerProvider(), child: const MyApp()),
        ChangeNotifierProvider(
            create: (_) => ActivityProvider(), child: const MyApp()),
        ChangeNotifierProvider(
            create: (_) => NotificationTeamProvider(), child: const MyApp()),
        ChangeNotifierProvider(
            create: (_) => HomeTeamDashboardProvider(), child: const MyApp()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (context, child) => MaterialApp(
          scaffoldMessengerKey: Helpers.scaffoldKey,
          debugShowCheckedModeBanner: false,
          title: 'Talents Valley',
          theme: ThemeManager.lightTheme,
          home: const ActivityPage(),
          navigatorKey: ServiceNavigation.serviceNavi.navKey,
          onGenerateRoute: RoutsGenerate.generateRoute,
        ),
      ),
    );
  }
}
