import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/core/provider/teamProvider/userMangementProvider.dart';
import 'package:talants_valley/resources/colorsManager.dart';

import '../../../../core/data/local/sharedController.dart';
import '../../../../core/model/userModel.dart';
import '../../../../resources/valuesManager.dart';
import '../../../shared/customWidgets/TeamUserMangement/userListTile.dart';
import '../../../shared/customWidgets/TeamUserMangement/userOptionBottomSheet.dart';
import '../../../shared/customWidgets/searchBar.dart';

class MainUserManagementPage extends StatefulWidget {
  MainUserManagementPage({Key? key}) : super(key: key);

  @override
  State<MainUserManagementPage> createState() => _MainUserManagementPageState();
}

class _MainUserManagementPageState extends State<MainUserManagementPage> {
  final dataUser = SharedPrefController().getUser();
  List<UserModel> userList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<UserManagementProvider>(context, listen: false).getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Management"),
        backgroundColor: Colors.transparent,
      ),
      body: Consumer<UserManagementProvider>(
        builder: (context, userMangement, child) => Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.s20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SearchBar(),
              addVerticalSpace(AppSize.s10.h),

              Expanded(
                // height: 300.h,
                child: RefreshIndicator(
                  // triggerMode: RefreshIndicatorTriggerMode.onEdge,
                  onRefresh: () async {},
                  child: userMangement.listUsers.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics().parent,
                          scrollDirection: Axis.vertical,
                          itemCount: userMangement.listUsers.length,
                          itemBuilder: (context, index) => ListTileUser(
                            isBlocked: userMangement.listUsers[index].isBlocked,
                                fullName:
                                    "${userMangement.listUsers[index].firstName} ${userMangement.listUsers[index].lastName}",
                                email: userMangement.listUsers[index].email,
                                balance: userMangement.listUsers[index].balance
                                    .toString(),
                                leadingLatter: userMangement
                                    .listUsers[index].firstName[0]
                                    .toUpperCase(),
                                onTap: () {
                                  userMangement.getUserDetails(
                                      userMangement.listUsers[index].id);
                                },
                                onPressedIcon: () => showModalBottomSheet(
                                    isScrollControlled: true,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(23.r),
                                          topRight: Radius.circular(23.r)),
                                    ),
                                    context: context,
                                    builder: (context) => UserOptionBottomSheet(
                                      isBlocked: userMangement
                                          .listUsers[index].isBlocked,
                                          blockFunction: () {
                                            userMangement.blockUser(
                                                userMangement
                                                    .listUsers[index].id);
                                            Navigator.pop(context);
                                          },
                                          deleteFunction: () {
                                            userMangement.deleteUser(
                                                userMangement
                                                    .listUsers[index].id);
                                            Navigator.pop(context);
                                          },
                                        )),
                              )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ListView(
//   shrinkWrap: true,
//   children: [
//     Container(
//       height: AppSize.s57.h,
//       decoration: BoxDecoration(
//         color: ColorManager.whiteColor,
//         border: Border.all(
//           color: ColorManager.mainBorderColor
//         ),
//         borderRadius: BorderRadius.all(Radius.circular(7.r))
//       ),
//       child: ListTile(
//         leading: CircleAvatar(
//           backgroundColor: ColorManager.grayColor,
//           radius: AppSize.s15.r,
//           child: const Text("A", style: TextStyle(color: ColorManager.whiteColor),),
//         ),
//         visualDensity:  VisualDensity(horizontal: 0, vertical: -4.h),
//         title: Row(
//           children: [
//             Text("Abdalrhman Abuwarda", style: Theme.of(context).textTheme.bodyText2!.copyWith(fontWeight: FontWeight.bold)),
//              Spacer(),
//             Text(r"$200", style: Theme.of(context).textTheme.bodyText2!.copyWith(fontWeight: FontWeight.bold)),
//           ],
//         ),
//         subtitle: Row(
//           children: [
//             Text("eng.abdalrhman@gmail.com", style: Theme.of(context).textTheme.bodyText1,),
//             Spacer(),
//             Text("Not Verified", style: Theme.of(context).textTheme.bodyText1,),
//           ],
//         ),
//         trailing: IconButton(onPressed: (){}, icon: Icon(Icons.more_vert, size: 20,),),
//       ),
//     )
//   ],
// ),
