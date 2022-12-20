import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/core/provider/formProvider.dart';
import 'package:talants_valley/core/provider/teamProvider/userMangementProvider.dart';

import '../../../../core/model/dropdownModel.dart';
import '../../../../resources/colorsManager.dart';
import '../../../../resources/valuesManager.dart';
import '../../../../routing/navigations.dart';
import '../../../../routing/router.dart';
import '../../../../utils/validate.dart';
import '../../../shared/customWidgets/authWigdgets/phoneNumberTextField.dart';
import '../../../shared/customWidgets/customDropdownWidget.dart';
import '../../../shared/customWidgets/mainTextFormField.dart';

class EditUserInformation extends StatefulWidget {
  EditUserInformation({Key? key}) : super(key: key);

  @override
  State<EditUserInformation> createState() => _EditUserInformationState();
}

class _EditUserInformationState extends State<EditUserInformation> {
  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _lastNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _phoneNumberController = TextEditingController();

  final TextEditingController _idController = TextEditingController();

  final TextEditingController _address1Controller = TextEditingController();

  final TextEditingController _address2Controller = TextEditingController();

  final TextEditingController _cityController = TextEditingController();

  final TextEditingController _countryController = TextEditingController();
  final List<String> country = DrppdownModel().countriesName;

  var formKye = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var userManagementProvider =
        Provider.of<UserManagementProvider>(context, listen: false);
    var formProvider = Provider.of<FormProvider>(context, listen: false);
    _firstNameController.text = userManagementProvider.userDetails!.firstName;
    _lastNameController.text = userManagementProvider.userDetails!.lastName;
    _emailController.text = userManagementProvider.userDetails!.email;
    _phoneNumberController.text =
        userManagementProvider.userDetails!.mobile!.substring(2);
    _idController.text =
        userManagementProvider.userDetails!.verifiedId.idNumber ?? "";
    _address1Controller.text =
        userManagementProvider.userDetails!.address!.address1 ?? "";
    _address2Controller.text =
        userManagementProvider.userDetails!.address!.address2 ?? "";
    _cityController.text =
        userManagementProvider.userDetails!.address!.city ?? "";
    // formProvider.selectedCountryAddress = userManagementProvider.userDetails!.address!.country ?? "aa";
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _idController.dispose();
    _address1Controller.dispose();
    _address2Controller.dispose();
    _cityController.dispose();
    _countryController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle? labelStyle = Theme.of(context).textTheme.labelMedium;
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: AppSize.s80.h,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              ServiceNavigations.serviceNavi
                  .pushNamedAndRemoveUtils(RouteGenerator.getUserDetails);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text("Edit"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p32.w),
        child: SingleChildScrollView(
          child: Consumer<UserManagementProvider>(
            builder: (context, userManagement, child) => Form(
                key: formKye,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Personal Information",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    addVerticalSpace(AppSize.s15.h),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'First Name',
                                style: labelStyle,
                              ),
                              addVerticalSpace(AppSize.s5.h),
                              MainTextformField(
                                  hintText: 'Enter first name',
                                  inbutType: TextInputType.name,
                                  controller: _firstNameController,
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
                                style: labelStyle,
                              ),
                              addVerticalSpace(AppSize.s5.h),
                              MainTextformField(
                                  hintText: 'Enter last name',
                                  inbutType: TextInputType.name,
                                  controller: _lastNameController,
                                  validator: (value) =>
                                      Validate.validateUserName(value))
                            ],
                          ),
                        )
                      ],
                    ),
                    addVerticalSpace(AppSize.s15.h),
                    Text(
                      'Email',
                      style: labelStyle,
                    ),
                    addVerticalSpace(AppSize.s4.h),
                    MainTextformField(
                        hintText: 'Enter your email',
                        inbutType: TextInputType.emailAddress,
                        controller: _emailController,
                        validator: (value) => Validate.validateUserName(value)),
                    addVerticalSpace(AppSize.s15.h),
                    Text(
                      'Phone Number',
                      style: labelStyle,
                    ),
                    addVerticalSpace(AppSize.s4.h),
                    PhoneNumberTextField(
                      phoneNumberController: _phoneNumberController,
                    ),
                    addVerticalSpace(AppSize.s4.h),
                    Text(
                      'ID Number',
                      style: labelStyle,
                    ),
                    MainTextformField(
                        hintText: 'Enter ID number',
                        inbutType: TextInputType.number,
                        controller: _idController,
                        validator: (value) => Validate.validateUserName(value)),
                    addVerticalSpace(AppSize.s15.h),
                    Text(
                      'Address 1',
                      style: labelStyle,
                    ),
                    addVerticalSpace(AppSize.s4.h),
                    MainTextformField(
                        hintText: 'Address 1',
                        inbutType: TextInputType.streetAddress,
                        controller: _address1Controller,
                        validator: (value) => Validate.validateUserName(value)),
                    addVerticalSpace(AppSize.s15.h),
                    Text(
                      'Address 1',
                      style: labelStyle,
                    ),
                    addVerticalSpace(AppSize.s4.h),
                    MainTextformField(
                        hintText: 'Address 2',
                        inbutType: TextInputType.streetAddress,
                        controller: _address2Controller,
                        validator: (value) => Validate.validateUserName(value)),
                    addVerticalSpace(AppSize.s15.h),
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
                              MainTextformField(
                                  hintText: '',
                                  inbutType: TextInputType.text,
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
                                  userManagement.onChangeCountryAddress(value);
                                },
                                selectedValue:
                                    userManagement.selectedCountryAddress,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    addVerticalSpace(AppSize.s50.h),
                    ElevatedButton(
                        onPressed: () {
                          debugPrint(_cityController.text);
                          userManagement.editUserInformation(
                            fistName: _firstNameController.text,
                            lastName: _lastNameController.text,
                            email: _emailController.text,
                            mobile: "${userManagement.postCode}${_phoneNumberController.text}",
                            idNumber: _idController.text,
                            address1: _address1Controller.text,
                            address2: _address2Controller.text,
                            city: _cityController.text,
                            country: userManagement.selectedCountryAddress ?? "",
                            userId: userManagement.userDetails!.id,
                          );
                        },
                        child: Text("Save")),
                    addVerticalSpace(AppSize.s45.h),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
