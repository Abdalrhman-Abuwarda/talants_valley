import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/core/provider/authProvider.dart';
import 'package:talants_valley/resources/colorsManager.dart';
import 'package:talants_valley/resources/valuesManager.dart';

import '../../../resources/assetsManager.dart';
import '../../../routing/navigations.dart';
import '../../../routing/router.dart';
import '../../../utils/validate.dart';
import '../../shared/customWidgets/authWigdgets/authFooterPage.dart';
import '../../shared/customWidgets/authWigdgets/authHeaderPage.dart';
import '../../shared/customWidgets/mainTextFormField.dart';

class SignInPage extends StatelessWidget {
  var formKye = GlobalKey<FormState>();

  final bool isPassword = true;

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.only(
              start: AppPadding.p44.w, end: AppPadding.p32.w),
          child: Form(
            key: formKye,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addVerticalSpace(AppSize.s30.h),
                const HeadarAuth(heightSpace: 100,),
                addVerticalSpace(55.h),
                Text(
                  'Email',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                MainTextformField(
                  hintText: 'email@gmail.com',
                  inbutType: TextInputType.emailAddress,
                  controller: _emailController,
                  validator: (value) {
                    Validate.validatePassword(value);
                  },
                ),
                addVerticalSpace(24.h),
                Text(
                  'Password',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Consumer<AuthProvider>(
                  builder: (context, auth, child)=>
                      MainTextformField(
                        hintText: 'Enter your password',
                        isPassword: auth.isPassword,
                        inbutType: TextInputType.visiblePassword,
                        controller: _passwordController,
                        validator: (value){
                          Validate.validateEmail(value);
                        },
                        suffixPressed: (){auth.suffixPressed();},
                        suffixIcon:
                        auth.isPassword ? Icons.visibility : Icons.visibility_off,
                      )
                ),

                Row(
                  children: [
                    addHorizantelSpace(160.w),
                    TextButton(
                      onPressed: () {
                        ServiceNavigations.serviceNavi.pushNamedWidget(RouteGenerator.forgetPassword);
                      },
                      child:  Text(
                        "Forget Password?",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                  ],
                ),
                addVerticalSpace(60.h),
                ElevatedButton(onPressed: (){}, child: const Text('Sign In')),
                addVerticalSpace(38.h),
                FooterAuth(text: "Don't have an account?", textButtom: 'Sign Up', onPressed: () {},)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
