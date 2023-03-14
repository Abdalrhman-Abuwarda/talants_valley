import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/data/local/sharedController.dart';
import '../../../core/provider/freelancer_provider/balance_freelancer_provider.dart';
import '../../../resources/assets_manager.dart';
import '../../../routing/navigations.dart';
import '../../../routing/router.dart';
import '../../../utils/validate.dart';
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
    Provider.of<BalanceFreelancerProvider>(context,listen: false).startTimer();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ServiceNavigation.serviceNavi
                .pushNamedAndRemoveUtils(RouteGenerator.addBankAccountPage);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Form(
        key: formKye,
        child: Consumer<BalanceFreelancerProvider>(
          builder: (context, balance, child) =>
              CustomOptPage(
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
                    balance.disposeTimer();
                    ServiceNavigation.serviceNavi.pushNamedAndRemoveUtils(RouteGenerator.chooseBankAccountPage);
                  }
                },
                onPressedTextButton: () => balance.resendCode(),
                validator: (value) => Validate.validateCode(value), minutes: balance.minutes.toString(), seconds: balance.seconds.toString(),
              ),
        ),
      ),
    );
  }
}
