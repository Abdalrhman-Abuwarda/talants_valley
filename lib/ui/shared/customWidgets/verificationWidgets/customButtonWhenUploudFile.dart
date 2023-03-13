import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../resources/colors_manager.dart';
import '../../../../resources/valuesManager.dart';
class CustomButtonWhenUploudFile extends StatelessWidget {
  const CustomButtonWhenUploudFile({
    required this.acceptedFile,
    required this.mainText,
    required this.sizeFile,
    required this.onPressed
  });

  final bool acceptedFile;
  final  void Function()? onPressed;
  final double sizeFile;
  final String mainText;


  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 44,
        decoration: BoxDecoration(
            color: ColorManager.mainBorderColor,
            borderRadius: BorderRadius.circular(7.r),
            border: (acceptedFile == false) ? Border.all(
                color: ColorManager.redColor
            )
                : null
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            addHorizantelSpace(AppSize.s12.w),
            const Icon(Icons.upload_file),
            addHorizantelSpace(AppSize.s12.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: AppSize.s200.w,
                    child: Text(mainText, overflow: TextOverflow.ellipsis, style: TextStyle(),
                )),
                Text("${sizeFile.toStringAsFixed(2)} Mb size"),
              ],
            ),
            const Spacer(),
            IconButton(onPressed: onPressed , icon: const Icon(Icons.cancel))
          ],
        )
    );
  }
}