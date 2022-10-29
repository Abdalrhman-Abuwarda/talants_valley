import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/colorsManager.dart';
import '../../../resources/valuesManager.dart';

class CostumElevatedButton extends StatelessWidget {
  const CostumElevatedButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            backgroundColor: const MaterialStatePropertyAll(ColorManager.whiteColor),
            elevation: const MaterialStatePropertyAll(0),
            side: const MaterialStatePropertyAll(
                BorderSide(color: ColorManager.mainBorderColor))),
        onPressed: () {},
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
