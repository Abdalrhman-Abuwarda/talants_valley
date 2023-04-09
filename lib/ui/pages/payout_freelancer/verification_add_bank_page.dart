import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/data/local/shared_controller.dart';
import '../../../core/provider/freelancer_provider/payout_freelancer_provider.dart';
import '../../../resources/assets_manager.dart';
import '../../../routing/navigations.dart';
import '../../../routing/router.dart';
import '../../../utils/validate_extension.dart';
import '../../shared/customPages/customOptPage.dart';

class VerificationAddBnkPage extends StatefulWidget {
  VerificationAddBnkPage({Key? key}) : super(key: key);

  @override
  State<VerificationAddBnkPage> createState() => _VerificationAddBnkPageState();
}

class _VerificationAddBnkPageState extends State<VerificationAddBnkPage> {
  final TextEditingController _optMobileController = TextEditingController();
  var formKye = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<PayoutFreelancerProvider>(context,listen: false).startTimer();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<PayoutFreelancerProvider>(
      builder: (context, balance, child) => Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Image.asset(
          ImageAssets.mainImage,
          height: 28.h,
          width: 85.w,
        ),
        backgroundColor: Colors.transparent,
        // leadingWidth: 30.w,
        leading: IconButton(
          onPressed: () {
            balance.disposeTimer();
            ServiceNavigation.serviceNavi.popFunction();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKye,
          child:
                CustomOptPage(
                  isLoading: balance.isLoading,
                  withImage: true,
                  pathImage: ImageAssets.mobileSuccessImage,
                  optController: _optMobileController,
                  caption:
                  'We have sent you a verification code to your mobile number ${SharedPrefController().getUser().mobile!.replaceRange(0, 9, "**********")}',
                  buttonText: 'Verify',
                  fotterText: "Didn't get the code? ",
                  futtarButtonText: 'Resend',
                  onPressedButton: () {
                    if (formKye.currentState!.validate()) {
                      balance.verifyAddBnkPage( code: _optMobileController.text);
                    }
                  },
                  onPressedTextButton: () => balance.resendCodeAddBank(),
                  validator: (value) => Validate.validateCode(value), minutes: balance.minutes.toString(), seconds: balance.seconds.toString(),
                ),
          ),
        ),
      ),
    );
  }
}
