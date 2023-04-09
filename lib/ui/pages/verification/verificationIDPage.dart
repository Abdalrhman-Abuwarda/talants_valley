import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/core/provider/formProvider.dart';
import 'package:talants_valley/core/provider/auth_and_verification_provider/verificationProvider.dart';
import 'package:talants_valley/resources/assets_manager.dart';
import 'package:talants_valley/resources/colors_manager.dart';
import 'package:talants_valley/resources/valuesManager.dart';
import 'package:talants_valley/ui/shared/customWidgets/custom_dropdown_widget.dart';
import 'package:talants_valley/ui/shared/customWidgets/main_text_form_field.dart';

import '../../../core/model/general_model/dropdownModel.dart';
import '../../../routing/navigations.dart';
import '../../../routing/router.dart';
import '../../../utils/validate.dart';
import '../../shared/customWidgets/custom_elevated_button.dart';
import '../../shared/customWidgets/verificationWidgets/customButtonWhenUploudFile.dart';

class VerificationIDPage extends StatefulWidget {
  const VerificationIDPage({Key? key}) : super(key: key);

  @override
  State<VerificationIDPage> createState() => _VerificationIDPageState();
}

class _VerificationIDPageState extends State<VerificationIDPage> {
  var formKye = GlobalKey<FormState>();

  final TextEditingController _idController = TextEditingController();
  String? selectedValue;

  final List<String> items = DropdownModel().idDocumentType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Verification',
        ),
        leading: IconButton(
          onPressed: () {
            ServiceNavigation.serviceNavi
                .pushNamedAndRemoveUtils(RouteGenerator.mainVerificationPage);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p44.w),
        child: Consumer2<VerificationProvider, FormProvider>(
          builder: (context, verification, form, child) => Form(
            key: formKye,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addVerticalSpace(AppSize.s25.h),
                Center(
                    child: Image.asset(
                  ImageAssets.idVerificationImage,
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
                CustomDropdownWidget(
                  items: items,
                  hintText: 'Choose your document type',
                  validator: (value) {
                    return null;
                  },
                  onChange: (Object? value) {
                    form.onChangeIdType(value);
                  },
                  selectedValue: form.selectedVerificationIdType,
                ),
                addVerticalSpace(AppSize.s16.h),
                Text('ID Number',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: ColorManager.primaryFontColor.withOpacity(0.7))),
                addVerticalSpace(AppSize.s5.h),
                MainTextFormField(
                    hintText: "Enter your ID number",
                    inputType: TextInputType.text,
                    controller: _idController,
                    validator: (value) => Validate.validateCode(value)),
                addVerticalSpace(AppSize.s30.h),
                verification.mainIDFile != null ?
                CustomButtonWhenUploudFile(acceptedFile: verification.acceptedIdFile, mainText: verification.idFile!.name, sizeFile: verification.idFileSize, onPressed: () { verification.deleteIfFile(); },)
                :
                CostumElevatedButton(
                  onPressed: () {
                    verification.pickFileID();
                  },
                  validator: (value) => Validate.validateFile(value),
                ),
                Row(
                  children: [
                    Text(verification.idFileSize > 2 ? "❗ Your file is too big." : "" , style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: ColorManager.redColor
                    ),),
                    addHorizontalSpace(verification.idFileSize > 2 ? AppSize.s28.w : 0),
                    Text("2 MP maximum" , style: Theme.of(context).textTheme.bodyText1,),
                  ],
                ),
                addVerticalSpace(AppSize.s60.h),
                ElevatedButton(
                    onPressed: (verification.acceptedIdFile == true  && _idController.text.isNotEmpty) ? () {
                      if (formKye.currentState!.validate()) {
                        verification.verificationID(
                            idNumber: _idController.text,
                            idDocumentType: form.selectedVerificationIdType!);
                      }
                    } :
                       null ,
                    child: const Text('Continue'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
