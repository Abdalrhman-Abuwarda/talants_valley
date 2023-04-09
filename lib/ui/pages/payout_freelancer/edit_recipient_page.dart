import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/core/provider/freelancer_provider/payout_freelancer_provider.dart';
import 'package:talants_valley/resources/valuesManager.dart';
import 'package:talants_valley/routing/navigations.dart';
import 'package:talants_valley/ui/shared/customWidgets/main_elevated_button.dart';
import 'package:talants_valley/ui/shared/customWidgets/main_text_form_field.dart';
import 'package:talants_valley/utils/validate_extension.dart';

import '../../../resources/colors_manager.dart';

class EditRecipientPage extends StatefulWidget {
  EditRecipientPage({Key? key}) : super(key: key);

  @override
  State<EditRecipientPage> createState() => _EditRecipientPageState();
}

class _EditRecipientPageState extends State<EditRecipientPage> {
  final TextEditingController _recipientsFullNameController = TextEditingController();
  final TextEditingController _recipientsIdNumberController = TextEditingController();
  final TextEditingController _recipientsPhoneNumberController = TextEditingController();
  var formKye = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var withdrawProvider = Provider.of<PayoutFreelancerProvider>(context, listen: false);
    _recipientsFullNameController.text = withdrawProvider.recipientForEdit!.name;
    _recipientsPhoneNumberController.text = withdrawProvider.recipientForEdit!.mobile;
    _recipientsIdNumberController.text = withdrawProvider.recipientForEdit!.idNumber;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _recipientsPhoneNumberController.dispose();
    _recipientsFullNameController.dispose();
    _recipientsIdNumberController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final TextStyle? labelMedium = Theme.of(context).textTheme.labelMedium;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Edit Recipient"),
        leading: IconButton(onPressed: (){ServiceNavigation.serviceNavi.popFunction();}, icon: const Icon(Icons.arrow_back_ios_new_outlined)),
      ),

      body: Form(
        key: formKye,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p32.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addVerticalSpace(AppSize.s15.h),
                Text("Recipients Full Name (Arabic)", style: labelMedium,),
                addVerticalSpace(AppSize.s5.h),
                MainTextFormField(hintText: "الاسم ثلاثي بالعربي", inputType: TextInputType.text, controller: _recipientsFullNameController, validator: (value) => value!.validateUserName()),
                addVerticalSpace(AppSize.s18.h),
                Text("Recipients Phone Number" , style: labelMedium,),
                addVerticalSpace(AppSize.s5.h),
                MainTextFormField(hintText: "Enter phone number", inputType: TextInputType.phone, controller: _recipientsPhoneNumberController, validator: (value) => value!.validatePhoneNumber()),
                addVerticalSpace(AppSize.s18.h),
                Text("Recipients ID Number" , style: labelMedium,),
                addVerticalSpace(AppSize.s5.h),
                MainTextFormField(hintText: "Enter ID number", inputType: TextInputType.number, controller: _recipientsIdNumberController, validator: (value) => value!.validateIdNumber()),
                addVerticalSpace(AppSize.s80.h),
                Consumer<PayoutFreelancerProvider>(
                  builder: (context , balance , child) =>
                      MainElevatedButton(textColor: ColorManager.whiteColor,
                          onPressed: (){balance.sendCodeUpdateRecipient(mobile: _recipientsPhoneNumberController.text, idNumber: _recipientsIdNumberController.text, name: _recipientsFullNameController.text, id: balance.recipientForEdit!.id!);},
                          isLoading: balance.isLoading, text: "Save Changes", isMain: true)

                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
