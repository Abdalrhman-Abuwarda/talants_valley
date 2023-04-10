import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../resources/values_manager.dart';

class UserOptionBottomSheet extends StatelessWidget {
  const UserOptionBottomSheet({super.key,
    required this.blockFunction,
    required this.deleteFunction,
    required this.isBlocked
  });

  final void Function()? blockFunction;
  final void Function()? deleteFunction;
  final bool isBlocked;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(
        top: AppSize.s33.h,
        start: AppSize.s33.w,
        end: AppSize.s33.w,
        bottom: AppSize.s33.h,
      ),
      child: Wrap(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // CheckboxListTile(value: true, onChanged: (value){}),
          ListTile(
            title: Text( isBlocked == false ? "Block" : "Unblock"),
            onTap: blockFunction,
          ),
          ListTile(
            title: const Text("Delete"),
            onTap: deleteFunction,
          )
        ],
      ),
    );
  }
}
