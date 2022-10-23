import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/resources/valuesManager.dart';
import 'package:talants_valley/ui/shared/customWidgets/authWigdgets/authHeaderPage.dart';
import 'package:talants_valley/ui/shared/customWidgets/mainTextFormField.dart';
import 'package:talants_valley/utils/validate.dart';

import '../../../core/provider/authProvider.dart';
import '../../shared/customWidgets/authWigdgets/authFooterPage.dart';

class SignUpPage extends StatelessWidget {
   SignUpPage({Key? key}) : super(key: key);

  final TextEditingController _firstNameController= TextEditingController();
  final TextEditingController _lastNameController= TextEditingController();
  final TextEditingController _emailController= TextEditingController();
  final TextEditingController _passwordController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p32),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addVerticalSpace(30.h),
                HeadarAuth(heightSpace: 32.h),
                addVerticalSpace(AppSize.s40.h),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('First Name', style: Theme.of(context).textTheme.subtitle1,),
                          addVerticalSpace(5.h),
                          MainTextformField(hintText: 'Enter first name', inbutType: TextInputType.name, controller: _firstNameController, validator:(value) {
                            Validate.validateUserName(value);
                          })
                        ],
                      ),
                    ),
                    addHorizantelSpace(24.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Last Name', style: Theme.of(context).textTheme.subtitle1,),
                          addVerticalSpace(5.h),
                          MainTextformField(hintText: 'Enter last name', inbutType: TextInputType.name, controller: _lastNameController, validator:(value) {
                            Validate.validateUserName(value);
                          })
                        ],
                      ),
                    )
                  ],
                ),
                addVerticalSpace(AppSize.s16.h),
                Text('Email', style: Theme.of(context).textTheme.subtitle1,),
                addVerticalSpace(5.h),
                MainTextformField(hintText: 'email@gmail.com', inbutType: TextInputType.emailAddress, controller: _emailController, validator:(value) {
                  Validate.validateEmail(value);
                }),
                addVerticalSpace(AppSize.s16.h),
                Text('Password', style: Theme.of(context).textTheme.subtitle1,),
                addVerticalSpace(5.h),
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
                addVerticalSpace(AppSize.s16.h),
                Text('Phone Numper', style: Theme.of(context).textTheme.subtitle1,),
                addVerticalSpace(5.h),
                MainTextformField(hintText: '+972', inbutType: TextInputType.emailAddress, controller: _emailController, validator:(value) {
                  Validate.validateEmail(value);
                }),
                addVerticalSpace(AppSize.s16.h),
                Text('Country', style: Theme.of(context).textTheme.subtitle1,),
                addVerticalSpace(5.h),
                MainTextformField(hintText: '', inbutType: TextInputType.emailAddress, controller: _emailController, validator:(value) {
                  Validate.validateEmail(value);
                }),
                addVerticalSpace(AppSize.s66.h),
                ElevatedButton(onPressed: (){},
                    child: const Text('Sign In')),
                addVerticalSpace(AppSize.s30.h),
                FooterAuth(text: "Alredy have an account?", textButtom: 'Sign in', onPressed: () {},)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
