import 'package:country_phone_code_picker/core/country_phone_code_picker_widget.dart';
import 'package:country_phone_code_picker/models/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../../resources/colorsManager.dart';
import '../../../../resources/valuesManager.dart';
import '../mainTextFormField.dart';

class PhoneNumberTextField extends StatelessWidget {
   PhoneNumberTextField({
    Key? key,
    required this.phoneNumberController,
    required this.validate
  }) ;

  final TextEditingController phoneNumberController;
   String? Function(String?)? validate;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MainTextformField(
          controller: phoneNumberController,
          validator: validate,
          hintText: '                +972',
          inbutType: TextInputType.phone,
        ),
      //   CountryPhoneCodePicker.withDefaultSelectedCountry(
      //   defaultCountryCode:  Country(name: 'India', countryCode: 'IN', phoneCode: '+91'),
      //   borderRadius: 7.r,
      //   borderWidth: 0,
      //   flagBorderRadius: 7.r,
      //   flagHeight: 30.h,
      //   flagWidth: 40.h,
      //   borderColor: Colors.transparent,
      //   style: const TextStyle(fontSize: 16),
      //   searchBarHintText: 'Search by name',
      // ),
    PositionedDirectional(
            start: AppSize.s80.w,
            top: 8.h,
            bottom: 8.h,
            child: Container(
              height: AppSize.s40.h,
              width: 1,
              color: ColorManager.mainBorderColor,
            ),
          )


      ]
    );
        
        
        
    // Container(
    //   padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
    //   height: AppSize.s66.h,
    //   decoration: BoxDecoration(
    //     color: Colors.white,
    //     borderRadius: BorderRadius.circular(7.r),
    //     border: Border.all(color: ColorManager.mainBorderColor),
    //
    //   ),
    //   child: Stack(
    //     children: [
    //       InternationalPhoneNumberInput(
    //         onInputChanged: (PhoneNumber number) {},
    //         onInputValidated: (bool value) {},
    //         selectorConfig: const SelectorConfig(
    //           selectorType: PhoneInputSelectorType.DIALOG,
    //           trailingSpace: true,
    //         ),
    //         spaceBetweenSelectorAndTextField: 0,
    //         ignoreBlank: true,
    //         countrySelectorScrollControlled: true,
    //         autoValidateMode: AutovalidateMode.disabled,
    //         // selectorTextStyle: const TextStyle(color: Colors.black),
    //         textFieldController: phoneNumberController,
    //         formatInput: false,
    //         maxLength: 15,
    //         keyboardType: TextInputType.phone,
    //         inputDecoration: InputDecoration(
    //           hintText: "+972",
    //           filled: true,
    //           fillColor: ColorManager.whiteColor,
    //           contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
    //           border: InputBorder.none,
    //           errorBorder: const OutlineInputBorder(
    //             borderRadius: BorderRadius.all(Radius.circular(10)),
    //             borderSide: BorderSide(
    //               color: ColorManager.redColor,
    //             ),
    //           ),
    //           focusedBorder: InputBorder.none,
    //         ),
    //
    //         onSaved: (PhoneNumber number) {},
    //       ),
    //       PositionedDirectional(
    //         start: AppSize.s80.h,
    //         child: Container(
    //           height: AppSize.s55.h,
    //           width: 1,
    //           color: ColorManager.mainBorderColor,
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}
