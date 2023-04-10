import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/colors_manager.dart';
import '../../../resources/values_manager.dart';

class CustomDropdownWidget extends StatelessWidget {
  CustomDropdownWidget({required this.items, required this.hintText, required this.validator, required this.onChange, required this.selectedValue});
  final List<String>? items ;
  final String hintText ;
  final String? Function(Object?)? validator;
  final void Function(Object?)? onChange;
  final String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s55.h,
      child: DropdownButtonFormField2(
        items: items!
            .map((item) => DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ))
            .toList(),
        value: selectedValue,
        onChanged: onChange,
        // items
        //     .map((item) => DropdownMenuItem<String>(
        //   value: item,
        //   child: Text(
        //     item,
        //     style: const TextStyle(
        //       fontSize: 14,
        //       fontWeight: FontWeight.bold,
        //       color: Colors.black,
        //     ),
        //     overflow: TextOverflow.ellipsis,
        //   ),
        // ))
        //     .toList(),
        isExpanded: true,
        hint: Row(
          children: [
            Expanded(
              child: Text(
                hintText,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        validator: validator,
        buttonHeight: 50,
        buttonWidth: double.infinity,
        decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.zero,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7.r),
            )),
        buttonPadding:
        EdgeInsets.symmetric(horizontal: AppSize.s18.w),
        itemHeight: 40,
        dropdownMaxHeight: 300.h,
        dropdownWidth: 300.w,
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s5.r),
          color: ColorManager.whiteColor,
        ),
        dropdownElevation: 3,
      ),
    );
  }
}
