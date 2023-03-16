import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/resources/assets_manager.dart';
import 'package:talants_valley/resources/colors_manager.dart';

import '../../../core/provider/freelancer_provider/withdraw_freelancer_provider.dart';
import '../../../resources/valuesManager.dart';

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Recipients"),
        leading: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_ios_new_outlined)),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Consumer<WithdrawFreelancerProvider>(
          builder: (context , balance , child) => Column(
            children: [
              addVerticalSpace(AppSize.s15.h),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: balance.recipients.length,
                  itemBuilder: ((context, index) =>
                      CustomInformationCard(
                        name: balance.recipients[index].name,
                        id: balance.recipients[index].idNumber,
                        select: balance.recipients[index].isSelected,
                        phone: balance.recipients[index].mobile,
                        onTap: () {
                          balance.selectRecipient(idNumber: balance.recipients[index].idNumber);
                        },

                      )


                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomInformationCard extends StatelessWidget {
  const CustomInformationCard({required this.name, this.onTap,required this.id,required this.phone, this.select =false,Key? key}) : super(key: key);
  final String name;
  final String id;
  final String phone;
  final bool select;
  final Function()? onTap;


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
                      SvgPicture.asset(IconAssets.deleteIcon),
                      addHorizantelSpace(AppSize.s16.w),
                      SvgPicture.asset(IconAssets.pencilIcon),
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
class CustomContainer extends StatelessWidget {
  const CustomContainer({required this.child,this.select = false, Key? key}) : super(key: key);
  final Widget child;
  final bool select;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border:(select)? Border.all(color: ColorManager.blueColor,width: 2):Border.all(color: ColorManager.mainBorderColor,width: 2),
          color: ColorManager.whiteColor
      ),
      child: child,

    );
  }
}
