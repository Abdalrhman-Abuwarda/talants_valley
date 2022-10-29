import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/core/provider/formProvider.dart';
import 'package:talants_valley/resources/assetsManager.dart';
import 'package:talants_valley/resources/valuesManager.dart';

import '../../../core/model/dropdownModel.dart';
import '../../../resources/colorsManager.dart';
import '../../../routing/navigations.dart';
import '../../../routing/router.dart';
import '../../../utils/validate.dart';
import '../../shared/customWidgets/costumElevatedbutton.dart';
import '../../shared/customWidgets/cusomDropdownWidget.dart';
import '../../shared/customWidgets/mainTextFormField.dart';

class VerificationAdressPage extends StatefulWidget {
  VerificationAdressPage({Key? key}) : super(key: key);

  @override
  State<VerificationAdressPage> createState() => _VerificationAdressPageState();
}

class _VerificationAdressPageState extends State<VerificationAdressPage> {
  var formKye = GlobalKey<FormState>();
  List<String> items = DrppdownModel().addressDocumentType;
  String? selectedValue = null;
  final TextEditingController _adress_1_Controller = TextEditingController();
  final TextEditingController _adress_2_Controller = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _CountryController = TextEditingController();

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
          child: SingleChildScrollView(
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
                Consumer<FormProvider>(
                  builder: (context, form, child) =>
                      CustomDropdownWidget(
                        items: items,
                        hintText: 'Choose your document type',
                        validator: (value) {},
                        onChange: (Object? value) {
                          form.onChangeAddress(value);
                        },
                        selectedValue: form.selectedValueAddress,
                    ),
                ),
                addVerticalSpace(AppSize.s16.h),
                Text('Adress 1',
                    style: Theme.of(context).textTheme.subtitle1),
                addVerticalSpace(AppSize.s5.h),
                MainTextformField(
                    hintText: "Neighborhood, building..",
                    inbutType: TextInputType.text,
                    controller: _adress_1_Controller,
                    validator: (value) => Validate.validateCode(value)),
                addVerticalSpace(AppSize.s16.h),
                Text('Adress 2',
                    style: Theme.of(context).textTheme.subtitle1),
                addVerticalSpace(AppSize.s5.h),
                MainTextformField(
                    hintText: "Street",
                    inbutType: TextInputType.text,
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
                            'First Name',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          addVerticalSpace(AppSize.s4.h),
                          MainTextformField(
                              hintText: '',
                              inbutType: TextInputType.name,
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
                            'Last Name',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          addVerticalSpace(AppSize.s4.h),
                          MainTextformField(
                              hintText: '',
                              inbutType: TextInputType.name,
                              controller: _CountryController,
                              validator: (value) =>
                                  Validate.validateUserName(value))
                        ],
                      ),
                    )
                  ],
                ),
                addVerticalSpace(AppSize.s22.h),
                CostumElevatedButton(),
                Text("Your document shouldn't be three months old", style: Theme.of(context).textTheme.bodyText2,),
                addVerticalSpace(AppSize.s30.h),
                ElevatedButton(onPressed: (){}, child: Text("Continue"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
