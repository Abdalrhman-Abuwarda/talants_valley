import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
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

import 'core/data/local/sharedController.dart';
import 'core/provider/authProvider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      ],
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (context, child) =>
            MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Talants Valley',
              theme: ThemeManager.lightTheme,
              home: SignInPage() ,
              navigatorKey: ServiceNavigations.serviceNavi.navKey,
              onGenerateRoute: RoutsGnerate.generateRoute,
            ),
      ),
    );
  }
}
