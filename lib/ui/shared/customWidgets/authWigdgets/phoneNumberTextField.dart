import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/core/provider/auth_and_verification_provider/authProvider.dart';
import 'package:talants_valley/core/provider/teamProvider/userManagementProvider.dart';

import '../../../../resources/valuesManager.dart';

class PhoneNumberTextField extends StatelessWidget {
   PhoneNumberTextField({
    Key? key,
    required this.phoneNumberController,
  }) ;

  final TextEditingController phoneNumberController;

  @override
  Widget build(BuildContext context) {
    return Consumer2<AuthProvider, UserManagementProvider>(
      builder: (context, auth, userManagement, child) => SizedBox(
        height: AppSize.s70.h,
        child: IntlPhoneField(
          initialCountryCode: "PS",
          controller: phoneNumberController,
          dropdownIconPosition: IconPosition.trailing,
          disableLengthCheck: true,
          flagsButtonMargin: EdgeInsets.only(left: AppPadding.p16.w),
          dropdownIcon: Icon(Icons.arrow_drop_down),
          decoration:  InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(7.r)),
              borderSide: BorderSide(),
            ),
          ),
          onChanged: (phone) {
            // print("This is phone ${phone.countryCode}");
            // print("This is with Complite ${phone.completeNumber}");
            auth.postCode = phone.countryCode.toString();
            userManagement.postCode = phone.countryCode.toString();
          },
          onCountryChanged: (country) {
            // print('Country changed to: ' + country.name);
          },
        ),
      ),
    );
  }
}
