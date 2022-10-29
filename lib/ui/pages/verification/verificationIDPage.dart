import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/core/provider/formProvider.dart';
import 'package:talants_valley/resources/assetsManager.dart';
import 'package:talants_valley/resources/colorsManager.dart';
import 'package:talants_valley/resources/valuesManager.dart';
import 'package:talants_valley/ui/shared/customWidgets/cusomDropdownWidget.dart';
import 'package:talants_valley/ui/shared/customWidgets/mainTextFormField.dart';

import '../../../core/model/dropdownModel.dart';
import '../../../routing/navigations.dart';
import '../../../routing/router.dart';
import '../../../utils/validate.dart';
import '../../shared/customWidgets/costumElevatedbutton.dart';

class VerificationIDPage extends StatefulWidget {
  VerificationIDPage({Key? key}) : super(key: key);

  @override
  State<VerificationIDPage> createState() => _VerificationIDPageState();
}

class _VerificationIDPageState extends State<VerificationIDPage> {
  var formKye = GlobalKey<FormState>();

  final TextEditingController _idController = TextEditingController();
  String? selectedValue = null;

  final List<String> items = DrppdownModel().idDocumentType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Verification',
          style: Theme.of(context).textTheme.headline2,
        ),
        leading: IconButton(
          onPressed: () {
            ServiceNavigations.serviceNavi
                .pushNamedAndRemoveUtils(RouteGenerator.mainVerificationPage);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p44.w),
        child: Form(
          key: formKye,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addVerticalSpace(AppSize.s25.h),
              Center(
                  child: Image.asset(
                ImageAssets.IdVerificationImage,
                height: AppSize.s66.h,
                width: AppSize.s66.w,
              )),
              addVerticalSpace(AppSize.s20.h),
              Text(
                "Upload Document that Proof your Identity\nSuch as: Identity Card, Passport, Driver License",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              addVerticalSpace(AppSize.s28.h),
              Text('Document Type',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: ColorManager.primaryFontColor.withOpacity(0.7))),
              addVerticalSpace(AppSize.s5.h),
              Consumer<FormProvider>(
                builder: (context, form, child) => CustomDropdownWidget(
                  items: items,
                  hintText: 'Choose your document type',
                  validator: (value) {},
                  onChange: (Object? value) {
                    form.onChangeId(value);
                  },
                  selectedValue: form.selectedValueId,
                ),
              ),
              addVerticalSpace(AppSize.s16.h),
              Text('ID Number',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: ColorManager.primaryFontColor.withOpacity(0.7))),
              addVerticalSpace(AppSize.s5.h),
              MainTextformField(
                  hintText: "Enter your ID number",
                  inbutType: TextInputType.text,
                  controller: _idController,
                  validator: (value) => Validate.validateCode(value)),
              addVerticalSpace(AppSize.s30.h),
              const CostumElevatedButton(),
              addVerticalSpace(AppSize.s70.h),
              ElevatedButton(onPressed: () {}, child: Text('Continue'))
            ],
          ),
        ),
      ),
    );
  }
}

// DropdownButton2(
// isExpanded: true,
// hint: Row(
// children: const [
// Expanded(
// child: Text(
// 'Choose your document type',
// overflow: TextOverflow.ellipsis,
// ),
// ),
// ],
// ),
// items: items
//     .map((item) => DropdownMenuItem<String>(
// value: item,
// child: Text(
// item,
// style: const TextStyle(
// fontSize: 14,
// fontWeight: FontWeight.bold,
// color: Colors.black,
// ),
// overflow: TextOverflow.ellipsis,
// ),
// ))
//     .toList(),
//
// value: selectedValue,
// onChanged: (value) {
// setState(() {
// selectedValue = value as String;
// });
// },
//
// // icon: const Icon(
// //   Icons.arrow_forward_ios_outlined,
// // ),
// // iconSize: 14,
// // iconEnabledColor: Colors.yellow,
// // iconDisabledColor: Colors.grey,
// buttonHeight: 50,
// buttonWidth: double.infinity,
// buttonPadding: EdgeInsets.symmetric(horizontal: AppSize.s18.w),
// buttonDecoration: BoxDecoration(
// borderRadius: BorderRadius.circular(7.r),
// border: Border.all(
// color: ColorManager.mainBorderColor,
// ),
// color: ColorManager.whiteColor,
// ),
// // buttonElevation: 2,
// itemHeight: 40,
// // itemPadding: const EdgeInsets.only(left: 14, right: 14),
// dropdownMaxHeight: 300.h,
// dropdownWidth: 300.w,
// dropdownDecoration: BoxDecoration(
// borderRadius: BorderRadius.circular(AppSize.s5.r),
// color: ColorManager.whiteColor,
// ),
// dropdownElevation: 3,
// ),
