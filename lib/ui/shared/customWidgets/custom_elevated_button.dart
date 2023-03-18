import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/colors_manager.dart';
import '../../../resources/valuesManager.dart';

class CostumElevatedButton extends StatelessWidget {
  CostumElevatedButton({
    required this.onPressed,
    required this.validator
  });
  final void Function()? onPressed;
  String? Function(dynamic)? validator;

  @override
  Widget build(BuildContext context) {
    return





      // FormField<File>(
      //   validator: validator,
      //   builder: (formFieldState) {
      //     return GestureDetector(
      //       onTap: onPressed,
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Container(
      //             width: double.infinity,
      //             height: AppSize.s45.h,
      //             decoration: BoxDecoration(
      //               color: ColorManager.whiteColor,
      //               borderRadius: BorderRadius.circular(7.r),
      //               border: Border.all(color: ColorManager.mainBorderColor)
      //             ),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 Icon(Icons.upload_file),
      //                 addHorizantelSpace(AppSize.s10.w),
      //                 Text('Upload a File',
      //                   style: Theme.of(context).textTheme.subtitle1),
      //               ],
      //             ),
      //           ),
      //           if (formFieldState.hasError)
      //             Padding(
      //               padding: const EdgeInsets.only(left: 8, top: 10),
      //               child: Text(
      //                 formFieldState.errorText!,
      //                 style: TextStyle(
      //                     fontStyle: FontStyle.normal,
      //                     fontSize: 13,
      //                     color: Colors.red[700],
      //                     height: 0.5),
      //               ),
      //             )
      //         ],
      //       ),
      //
      //     );
      //   });
      //





      ElevatedButton(
        style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            backgroundColor: const MaterialStatePropertyAll(ColorManager.whiteColor),
            elevation: const MaterialStatePropertyAll(0),
            side: const MaterialStatePropertyAll(
                BorderSide(color: ColorManager.mainBorderColor))),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.upload_file,
              color: Colors.black,
            ),
            addHorizantelSpace(AppSize.s10.w),
            Text(
              'Upload a File',
              style: Theme.of(context).textTheme.subtitle1,
            )
          ],
        ));
  }
}
