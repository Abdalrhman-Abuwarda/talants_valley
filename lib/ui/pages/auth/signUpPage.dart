import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/resources/valuesManager.dart';
import 'package:talants_valley/ui/shared/customWidgets/authWigdgets/authHeaderPage.dart';
import 'package:talants_valley/ui/shared/customWidgets/mainTextFormField.dart';
import 'package:talants_valley/utils/validate.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../core/provider/authProvider.dart';
import '../../../resources/colorsManager.dart';
import '../../../routing/navigations.dart';
import '../../../routing/router.dart';
import '../../shared/customWidgets/authWigdgets/authFooterPage.dart';
import '../../shared/customWidgets/authWigdgets/phoneNumberTextField.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _lastNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  var formKye = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p32.w),
          child: Form(
            key: formKye,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addVerticalSpace(AppSize.s28.h),
                  HeadarAuth(heightSpace: AppSize.s30.h),
                  addVerticalSpace(AppSize.s40.h),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'First Name',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            addVerticalSpace(AppSize.s4.h),
                            MainTextformField(
                                hintText: 'Enter first name',
                                inbutType: TextInputType.name,
                                controller: _firstNameController,
                                validator: (value) =>
                                    Validate.validateUserName(value))
                          ],
                        ),
                      ),
                      addHorizantelSpace(AppSize.s25.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Last Name',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            addVerticalSpace(AppSize.s4.h),
                            MainTextformField(
                                hintText: 'Enter last name',
                                inbutType: TextInputType.name,
                                controller: _lastNameController,
                                validator: (value) =>
                                    Validate.validateUserName(value))
                          ],
                        ),
                      )
                    ],
                  ),
                  addVerticalSpace(AppSize.s16.h),
                  Text(
                    'Email',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  addVerticalSpace(AppSize.s5.h),
                  MainTextformField(
                      hintText: 'email@gmail.com',
                      inbutType: TextInputType.emailAddress,
                      controller: _emailController,
                      validator: (value) => Validate.validateEmail(value)),
                  addVerticalSpace(AppSize.s16.h),
                  Text(
                    'Password',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  addVerticalSpace(AppSize.s5.h),
                  Consumer<AuthProvider>(
                      builder: (context, auth, child) => MainTextformField(
                            hintText: 'Enter your password',
                            isPassword: auth.isPassword,
                            inbutType: TextInputType.visiblePassword,
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
                  addVerticalSpace(AppSize.s16.h),
                  Text(
                    'Phone Numper',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  addVerticalSpace(5.h),
                  PhoneNumberTextField(
                    phoneNumberController: _phoneNumberController,
                    validate: (value) => Validate.validatePhoneNumber(value),
                  ),
                  addVerticalSpace(AppSize.s16.h),
                  Text(
                    'Country',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  addVerticalSpace(AppSize.s5.h),
                  MainTextformField(
                      hintText: '',
                      inbutType: TextInputType.text,
                      controller: _countryController,
                      validator: (value) => Validate.validateUserName(value)),
                  addVerticalSpace(AppSize.s55.h),
                  Consumer<AuthProvider>(
                    builder: (context, auth, child) => ElevatedButton(
                        onPressed: () {
                          if (formKye.currentState!.validate()) {
                            auth.SignupUser(
                                firstName: _firstNameController.text,
                                lastName: _lastNameController.text,
                                email: _emailController.text,
                                country: _countryController.text,
                                mobile: _phoneNumberController.text,
                                password: _passwordController.text);
                            // ServiceNavigations.serviceNavi
                            //     .pushNamedAndRemoveUtils(
                            //         RouteGenerator.homePage);
                          }
                        },
                        child: const Text('Sign Up')),
                  ),
                  addVerticalSpace(AppSize.s28.h),
                  FooterAuth(
                    text: "Alredy have an account?",
                    textButtom: 'Sign In',
                    onPressed: () {
                      ServiceNavigations.serviceNavi
                          .pushNamedWidget(RouteGenerator.signInPage);
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
