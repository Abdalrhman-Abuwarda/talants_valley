import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../resources/colors_manager.dart';

class MainTextformField extends StatelessWidget {
   MainTextformField({
    required this.hintText,
    required this.inbutType,
    required this.controller,
    this.isPassword = false,
    required this.validator,
    this.suffixIcon,
     this.suffixPressed
}) ;

final TextEditingController controller;
final String hintText;
final TextInputType inbutType;
   bool isPassword;
  final String? Function(String?)? validator;
  final IconData? suffixIcon;
  final Function()? suffixPressed;
   var formKye = GlobalKey<FormState>();



   @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // onChanged: ,
      validator: validator,
      controller: controller,
      obscureText: isPassword ,
      decoration: InputDecoration(
          hintText: hintText,
        suffixIcon: suffixIcon != null ? IconButton(
            icon: Icon(suffixIcon, ),
            onPressed: suffixPressed) : null,
      ),
      keyboardType: inbutType,


    );
  }
}
