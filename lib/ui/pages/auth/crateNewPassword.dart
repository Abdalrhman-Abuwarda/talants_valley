import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/core/provider/authProvider.dart';
import 'package:talants_valley/resources/valuesManager.dart';
import 'package:talants_valley/ui/shared/customWidgets/mainTextFormField.dart';

import '../../../resources/assetsManager.dart';
import '../../../routing/navigations.dart';
import '../../../routing/router.dart';
import '../../../utils/validate.dart';

class CreateNewPasswordPage extends StatelessWidget {
  CreateNewPasswordPage({Key? key}) : super(key: key);

  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _reEnterPasswordController = TextEditingController();
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
          onPressed: () {ServiceNavigations.serviceNavi
              .pushNamedAndRemoveUtils(RouteGenerator.forgetPassword);},
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p32.w),
        child: Form(
          key: formKye,
          child: Consumer<AuthProvider>(
            builder: (context, auth, child) =>
            Column(
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

                      MainTextformField(
                          hintText: '********',
                          inbutType: TextInputType.visiblePassword,
                          controller: _newPasswordController,
                          validator: (value) => Validate.validatePassword(value),
                        isPassword: auth.isPassword,
                        suffixPressed: (){auth.suffixPressed();},
                        suffixIcon:
                        auth.isPassword ? Icons.visibility : Icons.visibility_off,
                      ),

                addVerticalSpace(AppSize.s20.h),
                Text(
                  'Re-Enter Password',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                addVerticalSpace(AppSize.s4.h),

                      MainTextformField(
                        hintText: '********',
                        inbutType: TextInputType.visiblePassword,
                        controller: _reEnterPasswordController,
                        validator: (value) => Validate.validateRePassword(value, _newPasswordController.text),
                        isPassword: auth.isPassword,
                        suffixPressed: (){auth.suffixPressed();},
                        suffixIcon:
                        auth.isPassword ? Icons.visibility : Icons.visibility_off,
                      ),

                addVerticalSpace(AppSize.s55.h),
                Consumer<AuthProvider>(
                  builder: (context, auth, child) =>
                      ElevatedButton(onPressed: (){
                        if(formKye.currentState!.validate()){
                         auth.createNewPassword(password: _newPasswordController.text);
                        }
                      }, child: Text('Conferm')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
