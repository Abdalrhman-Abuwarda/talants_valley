import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/data/local/shared_controller.dart';
import '../../../../core/model/general_model/user_model.dart';
import '../../../../core/provider/team_provider/user_management_provider.dart';
import '../../../../resources/values_manager.dart';
import '../../../shared/customWidgets/Team_user_mangement/userListTile.dart';
import '../../../shared/customWidgets/Team_user_mangement/userOptionBottomSheet.dart';
import '../../../shared/customWidgets/search_bar.dart';

class MainUserManagementPage extends StatefulWidget {
  const MainUserManagementPage({Key? key}) : super(key: key);

  @override
  State<MainUserManagementPage> createState() => _MainUserManagementPageState();
}

class _MainUserManagementPageState extends State<MainUserManagementPage> {
  final dataUser = SharedPrefController().getUser();
  List<UserModel> userList = [];
  final scrollController = ScrollController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<UserManagementProvider>(context, listen: false).getUsers();
    handleNext();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.dispose();
    super.dispose();
  }

  void handleNext() {
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        Provider.of<UserManagementProvider>(context, listen: false).getOtherUsers();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Management"),
        backgroundColor: Colors.transparent,
      ),
      body: Consumer<UserManagementProvider>(
        builder: (context, userManagement, child) => Padding(
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
                  child: userManagement.users.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                    controller: scrollController,
                          shrinkWrap: true,
                          physics: const ScrollPhysics().parent,
                          scrollDirection: Axis.vertical,
                          itemCount: userManagement.users.length,
                          itemBuilder: (context, index) {
                            final user = userManagement.users[index];
                            if (index < userManagement.users.length ) {
                              return ListTileUser(
                                isBlocked: user.isBlocked,
                                fullName: "${user.firstName} ${user.lastName}",
                                email: user.email,
                                balance: user.balance.toString(),
                                leadingLatter: user.firstName[0].toUpperCase(),
                                onTap: () {
                                  userManagement.getUserDetails(user.id);
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
                                            userManagement.blockUser(user.id);
                                            Navigator.pop(context);
                                          },
                                          deleteFunction: () {
                                            userManagement.deleteUser(user.id);
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
