import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../resources/colors_manager.dart';
import '../../../../../resources/valuesManager.dart';

class PersonalInformationCard extends StatelessWidget {
  const PersonalInformationCard({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.id,
    required this.address,
    required this.role,
    required this.password,
    required this.onTapEdit,
    required this.onTapRole
  });

  final String fullName;
  final String email;
  final String phone;
  final String id;
  final String address;
  final String role;
  final String password;
  final void Function()? onTapEdit;
  final void Function()? onTapRole;

  @override
  Widget build(BuildContext context) {
    TextStyle? titleCardStyle = Theme.of(context).textTheme.headline4;
    TextStyle? propertyCardStyle = Theme.of(context).textTheme.headline6;
    TextStyle? valueCardStyle = Theme.of(context).textTheme.headline5;

    return Container(
      padding: EdgeInsets.symmetric(
          vertical: AppPadding.p18.h, horizontal: AppPadding.p17.w),
      decoration: BoxDecoration(
          color: ColorManager.whiteColor,
          borderRadius: BorderRadius.circular(AppSize.s7.r),
          border: Border.all(color: ColorManager.mainBorderColor)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Text(
                "Personal Information",
                style: titleCardStyle,
              )),
              // Spacer(),
              InkWell(
                  onTap: onTapEdit,
                  child: const Text(
                    "Edit",
                    style: TextStyle(color: ColorManager.blueColor),
                  ))
            ],
          ),
          addVerticalSpace(AppSize.s18.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Full Name", style: propertyCardStyle),
                  addVerticalSpace(AppSize.s10.h),
                  Text(
                    "Email",
                    style: propertyCardStyle,
                  ),
                  addVerticalSpace(AppSize.s10.h),
                  Text(
                    "Phone",
                    style: propertyCardStyle,
                  ),
                  addVerticalSpace(AppSize.s10.h),
                  Text(
                    "ID",
                    style: propertyCardStyle,
                  ),
                  addVerticalSpace(AppSize.s10.h),
                  Text(
                    "Address",
                    style: propertyCardStyle,
                  ),
                  addVerticalSpace(AppSize.s10.h),
                  Text(
                    "Role",
                    style: propertyCardStyle,
                  ),
                  addVerticalSpace(AppSize.s10.h),
                  Text(
                    "Password",
                    style: propertyCardStyle,
                  ),
                  addVerticalSpace(AppSize.s10.h),
                ],
              ),
              addHorizontalSpace(AppSize.s40.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fullName,
                    style: valueCardStyle,
                  ),
                  addVerticalSpace(AppSize.s10.h),
                  Text(
                    email,
                    style: valueCardStyle,
                  ),
                  addVerticalSpace(AppSize.s10.h),
                  Text(
                    phone,
                    style: valueCardStyle,
                  ),
                  addVerticalSpace(AppSize.s10.h),
                  Text(
                    id,
                    style: valueCardStyle,
                  ),
                  addVerticalSpace(AppSize.s10.h),
                  Text(
                    address,
                    style: valueCardStyle,
                  ),
                  addVerticalSpace(AppSize.s10.h),
                  InkWell(
                    onTap: onTapRole,
                    child: Text(
                      role == 0 ? "User" : "Team",
                      style: valueCardStyle,
                    ),
                  ),
                  addVerticalSpace(AppSize.s10.h),
                  Text(
                    "Send Recovery Email",
                    style: valueCardStyle,
                  ),
                  addVerticalSpace(AppSize.s10.h),
                ],
              ),
              const Spacer()
            ],
          )
        ],
      ),
    );
  }
}
