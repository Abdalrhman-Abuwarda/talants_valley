import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/core/provider/formProvider.dart';
import 'package:talants_valley/core/provider/verificationProvider.dart';
import 'package:talants_valley/resources/assets_manager.dart';
import 'package:talants_valley/resources/valuesManager.dart';

import '../../../core/model/dropdownModel.dart';
import '../../../resources/colors_manager.dart';
import '../../../routing/navigations.dart';
import '../../../routing/router.dart';
import '../../../utils/validate.dart';
import '../../shared/customWidgets/customElevatedbutton.dart';
import '../../shared/customWidgets/customDropdownWidget.dart';
import '../../shared/customWidgets/mainTextFormField.dart';
import '../../shared/customWidgets/verificationWidgets/customButtonWhenUploudFile.dart';

class VerificationAdressPage extends StatefulWidget {
  VerificationAdressPage({Key? key}) : super(key: key);

  @override
  State<VerificationAdressPage> createState() => _VerificationAdressPageState();
}

class _VerificationAdressPageState extends State<VerificationAdressPage> {
  var formKye = GlobalKey<FormState>();
  final List<String> items = DrppdownModel().addressDocumentType;
  final List<String> country = DrppdownModel().countriesName;
  String? selectedValue = null;
  final TextEditingController _adress_1_Controller = TextEditingController();
  final TextEditingController _adress_2_Controller = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _CountryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p44.w),
          child: Consumer2<VerificationProvider, FormProvider>(
            builder: (context, verification, form, chile) => Form(
              key: formKye,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // addVerticalSpace(AppSize.s5.h),
                  Center(
                    child: Image.asset(
                      ImageAssets.addressVerificationImage,
                      height: AppSize.s80.h,
                      width: AppSize.s80.w,
                    ),
                  ),
                  addVerticalSpace(AppSize.s22.h),
                  Text(
                    "Upload Document that Proof your Address Such as: Bill (Phone, Electricity, Water, Bank statement)",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  addVerticalSpace(AppSize.s20.h),
                  Text('Document Type',
                      style: Theme.of(context).textTheme.subtitle1),
                  addVerticalSpace(AppSize.s5.h),
                  CustomDropdownWidget(
                    items: items,
                    hintText: 'Choose your document type',
                    validator: (value) {},
                    onChange: (Object? value) {
                      form.onChangeAddressType(value);
                    },
                    selectedValue: form.selectedVerificationAddressType,
                  ),
                  addVerticalSpace(AppSize.s16.h),
                  Text('Adress 1',
                      style: Theme.of(context).textTheme.subtitle1),
                  addVerticalSpace(AppSize.s5.h),
                  MainTextFormField(
                      hintText: "Neighborhood, building..",
                      inputType: TextInputType.text,
                      controller: _adress_1_Controller,
                      validator: (value) => Validate.validateCode(value)),
                  addVerticalSpace(AppSize.s16.h),
                  Text('Adress 2',
                      style: Theme.of(context).textTheme.subtitle1),
                  addVerticalSpace(AppSize.s5.h),
                  MainTextFormField(
                      hintText: "Street",
                      inputType: TextInputType.text,
                      controller: _adress_2_Controller,
                      validator: (value) => Validate.validateCode(value)),
                  addVerticalSpace(AppSize.s16.h),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'City',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            addVerticalSpace(AppSize.s4.h),
                            MainTextFormField(
                                hintText: '',
                                inputType: TextInputType.name,
                                controller: _cityController,
                                validator: (value) =>
                                    Validate.validateUserName(value))
                          ],
                        ),
                      ),
                      addHorizantelSpace(AppSize.s25.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Country',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            addVerticalSpace(AppSize.s4.h),
                            CustomDropdownWidget(
                              items: country,
                              hintText: '',
                              validator: (value) {},
                              onChange: (Object? value) {
                                form.onChangeCountryAddress(value);
                              },
                              selectedValue: form.selectedCountryAddress,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  addVerticalSpace(AppSize.s22.h),
                  verification.mainAddressFile != null?
                  CustomButtonWhenUploudFile(acceptedFile: verification.acceptedAddressFile, mainText: verification.addressFile!.name, sizeFile: verification.addressFileSize!, onPressed: () { verification.deleteAddressFile(); },)
                  :
                  CostumElevatedButton(
                    onPressed: () {
                      verification.pickFileAddress();
                    },
                    validator: (value) => Validate.validateFile(value),
                  ),
                  Text(
                    "Your document shouldn't be three months old",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  addVerticalSpace(AppSize.s30.h),
                  ElevatedButton(
                      onPressed: (verification.acceptedAddressFile == false || _adress_1_Controller.text.isEmpty || _adress_2_Controller.text.isEmpty || _cityController.text.isEmpty) ? null :
                          () {
                        verification.verificationAdress(
                            address1: _adress_1_Controller.text,
                            address2: _adress_2_Controller.text,
                            city: _cityController.text,
                            addressDocumentType:
                                form.selectedVerificationAddressType!,
                            country: form.selectedCountryAddress!);
                      }
                      ,
                      child: const Text("Continue")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


