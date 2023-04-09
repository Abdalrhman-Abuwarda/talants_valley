import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/core/provider/auth_and_verification_provider/authProvider.dart';
import 'package:talants_valley/resources/colors_manager.dart';
import 'package:talants_valley/resources/valuesManager.dart';
import 'package:talants_valley/ui/shared/customWidgets/main_elevated_button.dart';
import '../../../routing/navigations.dart';
import '../../../routing/router.dart';
import '../../../utils/validate_extension.dart';
import '../../shared/customWidgets/authWigdgets/authFooterPage.dart';
import '../../shared/customWidgets/authWigdgets/authHeaderPage.dart';
import '../../shared/customWidgets/main_text_form_field.dart';

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  var formKye = GlobalKey<FormState>();

  final bool isPassword = true;

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();



  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p32.w),
            child: Form(
              key: formKye,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addVerticalSpace(AppSize.s30.h),
                  const HeadarAuth(
                    heightSpace: 100,
                  ),
                  addVerticalSpace(55.h),
                  Text(
                    'Email',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  MainTextFormField(
                    hintText: 'email@gmail.com',
                    inputType: TextInputType.emailAddress,
                    controller: _emailController,
                    validator: (value) => Validate.validateEmail(value),
                  ),
                  addVerticalSpace(24.h),
                  Text(
                    'Password',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Consumer<AuthProvider>(
                      builder: (context, auth, child) => MainTextFormField(
                            hintText: 'Enter your password',
                            isPassword: auth.isPassword,
                            inputType: TextInputType.visiblePassword,
                            controller: _passwordController,
                            validator: (value) =>
                                Validate.validatePassword(value),
                            suffixPressed: () {
                              auth.suffixPressed();
                            },
                            suffixIcon: auth.isPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          )),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        ServiceNavigation.serviceNavi.pushNamedWidget(
                            RouteGenerator.forgetPassword);
                      },
                      child: Text(
                        "Forget Password?",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                  ),
                  addVerticalSpace(60.h),
                  Consumer<AuthProvider>(
                      builder: (context, auth, child) =>
                          MainElevatedButton(
                            textColor: ColorManager.whiteColor,
                            onPressed: () {
                              if (formKye.currentState!.validate()) {
                                auth.loginUser(_emailController.text,
                                    _passwordController.text);
                              }
                            },
                            isLoading: auth.isLoading,
                            text: 'Sign In',
                            isMain: true,
                          )
                      ),
                  addVerticalSpace(38.h),
                  FooterAuth(
                    text: "Don't have an account?",
                    textButtom: 'Sign Up',
                    onPressed: () {
                      ServiceNavigation.serviceNavi
                          .pushNamedWidget(RouteGenerator.signUpPage);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
