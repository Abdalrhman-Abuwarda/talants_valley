import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/core/provider/authProvider.dart';
import 'package:talants_valley/resources/colors_manager.dart';
import 'package:talants_valley/resources/valuesManager.dart';
import 'package:talants_valley/ui/shared/customWidgets/main_elevated_button.dart';
import 'package:talants_valley/ui/shared/customWidgets/main_text_form_field.dart';

import '../../../resources/assets_manager.dart';
import '../../../routing/navigations.dart';
import '../../../routing/router.dart';
import '../../../utils/validate.dart';

class CreateNewPasswordPage extends StatefulWidget {
  const CreateNewPasswordPage({Key? key}) : super(key: key);

  @override
  State<CreateNewPasswordPage> createState() => _CreateNewPasswordPageState();
}

class _CreateNewPasswordPageState extends State<CreateNewPasswordPage> {
  final TextEditingController _newPasswordController = TextEditingController();

  final TextEditingController _reEnterPasswordController =
      TextEditingController();

  var formKye = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _newPasswordController.dispose();
    _reEnterPasswordController.dispose();
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
                .pushNamedAndRemoveUtils(RouteGenerator.signInPage);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p32.w),
        child: Form(
          key: formKye,
          child: Consumer<AuthProvider>(
            builder: (context, auth, child) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addVerticalSpace(AppSize.s30.h),
                Center(
                    child: Text('Create New Password',
                        style: Theme.of(context).textTheme.headline2)),
                addVerticalSpace(AppSize.s55.h),
                Text(
                  'New Password',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                addVerticalSpace(AppSize.s4.h),
                MainTextFormField(
                  hintText: '********',
                  inputType: TextInputType.visiblePassword,
                  controller: _newPasswordController,
                  validator: (value) => Validate.validatePassword(value),
                  isPassword: auth.isPassword,
                  suffixPressed: () {
                    auth.suffixPressed();
                  },
                  suffixIcon:
                      auth.isPassword ? Icons.visibility : Icons.visibility_off,
                ),
                addVerticalSpace(AppSize.s20.h),
                Text(
                  'Re-Enter Password',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                addVerticalSpace(AppSize.s4.h),
                MainTextFormField(
                  hintText: '********',
                  inputType: TextInputType.visiblePassword,
                  controller: _reEnterPasswordController,
                  validator: (value) => Validate.validateRePassword(
                      value, _newPasswordController.text),
                  isPassword: auth.isPassword,
                  suffixPressed: () {
                    auth.suffixPressed();
                  },
                  suffixIcon:
                      auth.isPassword ? Icons.visibility : Icons.visibility_off,
                ),
                addVerticalSpace(AppSize.s55.h),
                Consumer<AuthProvider>(
                    builder: (context, auth, child) => MainElevatedButton(
                        textColor: ColorManager.whiteColor,
                        onPressed: () {
                          if (formKye.currentState!.validate()) {
                            auth.createNewPassword(
                                password: _newPasswordController.text);
                          }
                        },
                        isLoading: auth.isLoading,
                        text: "Conferm",
                        isMain: true)
                    // ElevatedButton(onPressed: (){
                    //   if(formKye.currentState!.validate()){
                    //    auth.createNewPassword(password: _newPasswordController.text);
                    //   }
                    // }, child: Text('Conferm')),
                    )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
