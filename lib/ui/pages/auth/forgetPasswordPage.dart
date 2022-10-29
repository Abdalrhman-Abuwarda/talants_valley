import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/core/provider/authProvider.dart';
import 'package:talants_valley/resources/valuesManager.dart';

import '../../../resources/assetsManager.dart';
import '../../../routing/navigations.dart';
import '../../../routing/router.dart';
import '../../../utils/validate.dart';
import '../../shared/customWidgets/mainTextFormField.dart';

class ForgetPasswordPage extends StatefulWidget {
  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  var formKye = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Image.asset(
            ImageAssets.mainImage,
            height: 28.h,
            width: 85.w,
          ),
          backgroundColor: Colors.transparent,
          // leadingWidth: 30.w,
          leading: IconButton(
            onPressed: () {
              ServiceNavigations.serviceNavi
                  .pushNamedAndRemoveUtils(RouteGenerator.signInPage);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p32.w),
          child: Form(
            key: formKye,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addVerticalSpace(AppSize.s30.h),
                Center(
                    child: Text('Forget Password',
                        style: Theme.of(context).textTheme.headline2)),
                addVerticalSpace(AppSize.s18.h),
                Text("We'll send a code to your email to reset password",
                    style: Theme.of(context).textTheme.subtitle1),
                addVerticalSpace(AppSize.s30),
                Text(
                  'Email',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                addVerticalSpace(5.h),
                MainTextformField(
                    hintText: 'email@gmail.com',
                    inbutType: TextInputType.emailAddress,
                    controller: _emailController,
                    validator: (value) => Validate.validateEmail(value)),
                addVerticalSpace(AppSize.s55.h),
                Consumer<AuthProvider>(
                  builder: (context, auth, child) => ElevatedButton(
                      onPressed: () {
                        if (formKye.currentState!.validate()) {
                          auth.forgetPassword(email: _emailController.text);
                        }
                      },
                      child: const Text('Send code')),

                ),
              ],
            ),
          ),
        ));
  }
}
