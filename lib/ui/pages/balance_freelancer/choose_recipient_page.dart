import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/resources/assets_manager.dart';
import 'package:talants_valley/resources/colors_manager.dart';
import 'package:talants_valley/routing/navigations.dart';
import 'package:talants_valley/routing/router.dart';

import '../../../core/provider/freelancer_provider/withdraw_freelancer_provider.dart';
import '../../../resources/valuesManager.dart';
import '../../shared/customWidgets/balance_freelancer_wigdgets/choose_bank_skeleton.dart';
import '../../shared/customWidgets/custom_contaner_widget.dart';
import '../../shared/customWidgets/custom_elevated_button.dart';
import '../../shared/second_custom_buttom.dart';

class ChooseRecipientPage extends StatefulWidget {
  const ChooseRecipientPage({Key? key}) : super(key: key);

  @override
  State<ChooseRecipientPage> createState() => _ChooseRecipientPageState();
}

class _ChooseRecipientPageState extends State<ChooseRecipientPage> {

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<WithdrawFreelancerProvider>(context , listen: false).getRecipients();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<WithdrawFreelancerProvider>(
      builder: (context , balance , child) => Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: AppPadding.p22.w),
            child: Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: AppSize.s160.w,
                  child: SecondCustomButton(isLoading: false,
                    text: "Add", onPressed: (){ServiceNavigation.serviceNavi.pushNamedWidget(RouteGenerator.addRecipientPage);} ,),
                ),
                SizedBox(
                  width: AppSize.s160.w,
                  child: ElevatedButton(onPressed:balance.checkSelectRecipients ,
                    child: const Text("Select"),),
                )
              ],
            ),
          ),
          addVerticalSpace(AppSize.s80.h)
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Recipients"),
        leading: IconButton(onPressed: (){ServiceNavigation.serviceNavi.popFunction();}, icon: const Icon(Icons.arrow_back_ios_new_outlined)),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child:  balance.isLoading ? ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: AppSize.s16.h,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context , index) => const ChooseBankCardSkeleton()) : Column(
                children: [
                addVerticalSpace(AppSize.s15.h),
                SizedBox(
                  // height: MediaQuery.of(context).size.height * 0.65,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: balance.recipients.length,
                      itemBuilder: ((context, index) =>
                          CustomInformationCard(
                            onPressedDelete: ()=> balance.deleteRecipient(id: balance.recipients[index].id),
                            onPressedEdit: (){
                              balance.editRecipient(recipient: balance.recipients[index]);
                            },
                            name: balance.recipients[index].name,
                            id: balance.recipients[index].idNumber,
                            select: balance.recipients[index].isSelected,
                            phone: balance.recipients[index].mobile,
                            onTap: () {
                              balance.selectRecipientFromRecipientsPage(idNumber: balance.recipients[index].idNumber);
                            },
                          )


                      )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomInformationCard extends StatelessWidget {
  const CustomInformationCard({required this.name, this.onTap,required this.id,required this.phone, required this.onPressedEdit, required this.onPressedDelete,this.select =false,Key? key}) : super(key: key);
  final String name;
  final String id;
  final String phone;
  final bool select;
  final Function()? onTap;
  final void Function()? onPressedDelete;
  final void Function()? onPressedEdit;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: MaterialStateProperty.all(Colors.transparent,),
      onTap: onTap,
      child: CustomContainer(
          select: select,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [

                      InkWell(
                        onTap: onPressedDelete,
                          child: SvgPicture.asset(IconAssets.deleteIcon)),
                      addHorizantelSpace(AppSize.s16.w),
                      InkWell(
                        onTap: onPressedEdit,
                          child: SvgPicture.asset(IconAssets.pencilIcon)),
                    ],
                  ),
                  Text(name,
                      style: const TextStyle(
                          color: ColorManager.blackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600))
                ],
              ),
              addVerticalSpace(AppSize.s8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("ID: $id",
                      style: const TextStyle(
                          color: ColorManager.anotherFontColor, fontSize: 14)),
                  Text(
                    "Phone: $phone",
                    style: const TextStyle(color: ColorManager.anotherFontColor, fontSize: 14),
                  )
                ],
              )
            ],
          )),
    );
  }
}

