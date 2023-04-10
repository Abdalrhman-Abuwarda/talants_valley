
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/core/data/local/shared_controller.dart';
import 'package:talants_valley/core/provider/freelancer_provider/payout_freelancer_provider.dart';
import 'package:talants_valley/routing/navigations.dart';
import 'package:talants_valley/utils/validate_extension.dart';

import '../../../resources/assets_manager.dart';
import '../../../resources/colors_manager.dart';
import '../../../resources/values_manager.dart';
import '../../../routing/router.dart';

class AddBalanceCashPage extends StatefulWidget {
  AddBalanceCashPage({Key? key}) : super(key: key);

  @override
  State<AddBalanceCashPage> createState() => _AddBalanceCashPageState();
}

class _AddBalanceCashPageState extends State<AddBalanceCashPage> {
  final _formKey = GlobalKey<FormState>();

  bool isVisible = false;

  final TextEditingController _amountController = TextEditingController();
  String availableMoney = SharedPrefController().getUser().balance.toString();


  @override
  void dispose() {
    // TODO: implement dispose
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String? validateAmount(value) {
      if (value == null || value.trim().isEmpty) {
        return 'Please enter your amount';
      }
      if (value!.toString().contains(".")) {
        setState(() {
          isVisible = true;
        });
        return "Do not write (.)";
      }
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Cash Withdraw"),
        leading: IconButton(onPressed: (){ServiceNavigation.serviceNavi.pushNamedReplacement(RouteGenerator.mainFreelancerPage);}, icon: const Icon(Icons.arrow_back_ios_new_outlined),),
      ),

      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: AppPadding.p32.w),
        child: SingleChildScrollView(
          child: Consumer<PayoutFreelancerProvider>(
            builder: (context, balance, child) => Column(
              children: [
                addVerticalSpace(AppSize.s120.h),
                const Text(
                  "Amount",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: ColorManager.grayColor),
                ),
                addVerticalSpace(AppSize.s8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "\$ ",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: AppSize.s160.w,
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          controller: _amountController,
                          autocorrect: true,
                          validator: (value) => validateAmount(value),
                          keyboardType: TextInputType.number,
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.transparent,
                            hintText: "000.00",
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7.r),
                                borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(AppSize.s10.r)),
                              borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ),
            ]
                    ),

                addVerticalSpace(AppSize.s8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text(
                      "Available",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(color:  Color(0xFF9E9E9E)),
                    ),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            _amountController.text = availableMoney;
                          });
                        },
                        child: Text("\$ ${SharedPrefController().getUser().balance}"))
                  ],
                ),
                addVerticalSpace(AppSize.s20.h),
                Visibility(
                    visible: isVisible,
                    child: Container(
                      height: AppSize.s60.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: const Color.fromRGBO(253, 248, 248, 1),
                          border: Border.all(
                              color: const Color.fromRGBO(255, 209, 209, 1))),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 17,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(IconAssets.warningIcon),
                            Text(
                              "  Sorry, cents can't be withdrawn for \n  cash payout.",
                              style:
                              Theme.of(context).textTheme.subtitle1!.copyWith( color:  ColorManager.redColor ,fontSize: 15),
                            ),
                            const Spacer(),
                            IconButton(onPressed: (){
                              setState(() {
                                isVisible = false;
                              });
                            }, icon: SvgPicture.asset(IconAssets.closeIcon, width: 8, height: 8, ),)
                          ],
                        ),
                      ),
                    )),
                addVerticalSpace(AppSize.s20.h),
                SizedBox(
                  height: 44,
                  width: 326,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        SharedPrefController().saveAmountToWithdraw(amountToWithdraw: _amountController.text);
                        debugPrint("This is amount ${SharedPrefController().getAmountToWithdraw()}");
                        ServiceNavigation.serviceNavi.pushNamedAndRemoveUtils(RouteGenerator.chooseOfficePage);
                      }
                    },
                    style: ElevatedButton.styleFrom(),
                    child: const Text(
                      "Continue",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),


    );


  }
}
