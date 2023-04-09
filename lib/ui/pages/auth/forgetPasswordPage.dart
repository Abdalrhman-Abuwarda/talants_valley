import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/core/provider/auth_and_verification_provider/authProvider.dart';
import 'package:talants_valley/core/provider/auth_and_verification_provider/verificationProvider.dart';
import 'package:talants_valley/resources/colors_manager.dart';
import 'package:talants_valley/resources/valuesManager.dart';
import 'package:talants_valley/ui/shared/customWidgets/main_elevated_button.dart';

import '../../../core/data/local/shared_controller.dart';
import '../../../resources/assets_manager.dart';
import '../../../routing/navigations.dart';
import '../../../routing/router.dart';
import '../../../utils/validate_extension.dart';
import '../../shared/customWidgets/main_text_form_field.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  var formKye = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
  }

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
              ServiceNavigation.serviceNavi
                  .popFunction();
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
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
                  MainTextFormField(
                      hintText: 'email@gmail.com',
                      inputType: TextInputType.emailAddress,
                      controller: _emailController,
                      validator: (value) => Validate.validateEmail(value)),
                  addVerticalSpace(AppSize.s55.h),
                  Consumer2<AuthProvider, VerificationProvider>(
                    builder: (context, auth, verification, child) =>
                        MainElevatedButton(textColor: ColorManager.whiteColor,
                            onPressed: () {
                              if (formKye.currentState!.validate()) {
                                SharedPrefController().saveForgetEmail(email: _emailController.text);
                                auth.forgetPassword(email: _emailController.text);
                                // verification.startTimer();
                              }
                            },
                            isLoading: auth.isLoading, text: "Send Code", isMain: true)


                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
