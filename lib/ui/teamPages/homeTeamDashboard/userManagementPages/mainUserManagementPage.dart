import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/core/provider/teamProvider/userMangementProvider.dart';
import 'package:talants_valley/resources/colors_manager.dart';

import '../../../../core/data/local/sharedController.dart';
import '../../../../core/model/userModel.dart';
import '../../../../resources/valuesManager.dart';
import '../../../shared/customWidgets/TeamUserMangement/userListTile.dart';
import '../../../shared/customWidgets/TeamUserMangement/userOptionBottomSheet.dart';
import '../../../shared/customWidgets/search_bar.dart';

class MainUserManagementPage extends StatefulWidget {
  MainUserManagementPage({Key? key}) : super(key: key);

  @override
  State<MainUserManagementPage> createState() => _MainUserManagementPageState();
}

class _MainUserManagementPageState extends State<MainUserManagementPage> {
  final dataUser = SharedPrefController().getUser();
  List<UserModel> userList = [];
  final controllerScrolling = ScrollController();

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
                  child: userMangement.users.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                    controller: controllerScrolling,
                          shrinkWrap: true,
                          physics: const ScrollPhysics().parent,
                          scrollDirection: Axis.vertical,
                          itemCount: userMangement.users.length + 1,
                          itemBuilder: (context, index) {
                            final user = userMangement.users[index];
                            if (index < userMangement.users.length) {
                              return ListTileUser(
                                isBlocked: user.isBlocked,
                                fullName: "${user.firstName} ${user.lastName}",
                                email: user.email,
                                balance: user.balance.toString(),
                                leadingLatter: user.firstName[0].toUpperCase(),
                                onTap: () {
                                  userMangement.getUserDetails(user.id);
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
                                          isBlocked: user.isBlocked,
                                          blockFunction: () {
                                            userMangement.blockUser(user.id);
                                            Navigator.pop(context);
                                          },
                                          deleteFunction: () {
                                            userMangement.deleteUser(user.id);
                                            Navigator.pop(context);
                                          },
                                        )),
                              );
                            } else {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: AppSize.s30.h),
                                child: const Center(child: CircularProgressIndicator()),
                              );
                            }
                          }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
