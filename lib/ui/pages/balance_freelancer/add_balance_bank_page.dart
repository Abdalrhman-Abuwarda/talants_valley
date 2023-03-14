import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talants_valley/resources/colors_manager.dart';
import 'package:talants_valley/resources/valuesManager.dart';
import 'package:talants_valley/routing/navigations.dart';
import 'package:talants_valley/utils/validate.dart';

import '../../../routing/router.dart';


class AddBalanceBankPage extends StatefulWidget {
  const AddBalanceBankPage({Key? key}) : super(key: key);

  @override
  State<AddBalanceBankPage> createState() => _AddBalanceBankPageState();
}

class _AddBalanceBankPageState extends State<AddBalanceBankPage> {
  final _formKey = GlobalKey<FormState>();
  bool visible = false;
  String availableMoney = "800.5";
  String userMoney = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Bank Withdrow",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(onPressed: (){ServiceNavigation.serviceNavi.popFunction();}, icon: const Icon(Icons.arrow_back_ios_new_outlined , color: ColorManager.blackColor,),),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              addVerticalSpace(AppSize.s200.h),
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
                    width: 115,
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        controller: TextEditingController(text: userMoney),
                        autocorrect: true,
                        validator: (value) => value!.validateBankAmount(),
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(
                          hintText: "000.00",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Available",
                    style: TextStyle(
                        fontSize: 16, color: Color.fromRGBO(140, 140, 140, 1)),
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          userMoney = availableMoney;
                        });
                      },
                      child: Text("\$$availableMoney"))
                ],
              ),
              addVerticalSpace(AppSize.s20.h),
              // Visibility(
              //     visible: visible,
              //     child: Container(
              //       width: 342,
              //       height: 58,
              //       decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(7),
              //           color: const Color.fromRGBO(253, 248, 248, 1),
              //           border: Border.all(
              //               color: const Color.fromRGBO(255, 209, 209, 1))),
              //       child: Padding(
              //         padding: const EdgeInsets.only(
              //           left: 17,
              //         ),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             SvgPicture.asset("assets/warning.svg"),
              //             const Text(
              //               "  Sorry, cents can't be withdrawn for \n  cash payout.",
              //               style:
              //               TextStyle(color: Color.fromRGBO(238, 64, 76, 1)),
              //             ),
              //             const SizedBox(
              //               width: 20,
              //             ),
              //             IconButton(
              //               onPressed: () {
              //                 setState(() {
              //                   visible = false;
              //                 });
              //               },
              //               icon: SizedBox(
              //                   height: 15,
              //                   width: 15,
              //                   child: SvgPicture.asset("assets/close.svg")),
              //             )
              //           ],
              //         ),
              //       ),
              //     )),
              // const SizedBox(
              //   height: 20,
              // ),
              SizedBox(
                height: 44,
                width: 326,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      debugPrint("Done");
                      ServiceNavigation.serviceNavi.pushNamedAndRemoveUtils(RouteGenerator.chooseBankAccountPage);

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
    );
  }
}