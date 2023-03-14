import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/resources/valuesManager.dart';
import 'package:talants_valley/ui/shared/customWidgets/authWigdgets/authHeaderPage.dart';
import 'package:talants_valley/ui/shared/customWidgets/mainTextFormField.dart';
import 'package:talants_valley/utils/validate.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../core/model/dropdownModel.dart';
import '../../../core/provider/authProvider.dart';
import '../../../core/provider/formProvider.dart';
import '../../../resources/colors_manager.dart';
import '../../../routing/navigations.dart';
import '../../../routing/router.dart';
import '../../shared/customWidgets/authWigdgets/authFooterPage.dart';
import '../../shared/customWidgets/authWigdgets/phoneNumberTextField.dart';
import '../../shared/customWidgets/customDropdownWidget.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final List<String> country = DrppdownModel().countriesName;

  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _lastNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _phoneNumberController = TextEditingController();
  // final TextEditingController _countryController = TextEditingController();
  var formKye = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneNumberController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: formKye,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppPadding.p32.w),
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
                            addVerticalSpace(AppSize.s5.h),
                            MainTextFormField(
                                hintText: 'Enter first name',
                                inputType: TextInputType.name,
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
                            addVerticalSpace(AppSize.s5.h),
                            MainTextFormField(
                                hintText: 'Enter last name',
                                inputType: TextInputType.name,
                                controller: _lastNameController,
                                validator: (value) =>
                                    Validate.validateUserName(value))
                          ],
                        ),
                      )
                    ],
                  ),
                  addVerticalSpace(AppSize.s15.h),
                  Text(
                    'Email',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  addVerticalSpace(AppSize.s5.h),
                  MainTextFormField(
                      hintText: 'email@gmail.com',
                      inputType: TextInputType.emailAddress,
                      controller: _emailController,
                      validator: (value) => Validate.validateEmail(value)),
                  addVerticalSpace(AppSize.s16.h),
                  Text(
                    'Password',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  addVerticalSpace(AppSize.s5.h),
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
                                ? Icons.visibility_off
                                : Icons.visibility,
                          )),
                  addVerticalSpace(AppSize.s16.h),
                  Text(
                    'Phone Numper',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  addVerticalSpace(5.h),
                  PhoneNumberTextField(
                    phoneNumberController: _phoneNumberController,
                  ),
                  addVerticalSpace(AppSize.s5.h),
                  Text(
                    'Country',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  addVerticalSpace(AppSize.s5.h),
                  Consumer<FormProvider>(
                    builder: (context, form, child) =>
                        CustomDropdownWidget(
                          items: country,
                          hintText: '',
                          validator: (value) {},
                          onChange: (Object? value) {
                            form.onChangeCountrySignUp(value);
                          },
                          selectedValue: form.selectedCountrySignUp,
                        ),
                  ),
                  addVerticalSpace(AppSize.s66.h),
                  Consumer2<AuthProvider, FormProvider>(
                    builder: (context, auth, form,child) => ElevatedButton(
                        onPressed: () {
                          if (formKye.currentState!.validate()) {
                            auth.signupUser(
                                firstName: _firstNameController.text,
                                lastName: _lastNameController.text,
                                email: _emailController.text,
                                country: form.selectedCountrySignUp!,
                                mobile: "${auth.postCode}${_phoneNumberController.text}",
                                password: _passwordController.text);
                          }
                        },
                        child: const Text('Sign Up')),
                  ),
                  addVerticalSpace(AppSize.s28.h),
                  FooterAuth(
                    text: "Alredy have an account?",
                    textButtom: 'Sign In',
                    onPressed: () {
                      ServiceNavigation.serviceNavi
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
