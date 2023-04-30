import 'package:flutter/cupertino.dart';
import 'package:talants_valley/ui/teamPages/activites/core_activity/activity_model/activity_model.dart';
import 'package:talants_valley/ui/teamPages/activites/core_activity/activiyt_data/activity_repo/activity_repo.dart';

import '../../../../../locator.dart';

class ActivityProvider extends ChangeNotifier {
  final ActivityRepo _activityRepo = locator<ActivityRepo>();

  bool isLoading = false;
  bool secondIsLoading = false;
  List<ActivityModel> freelancerActivities = [];
  List<ActivityModel> teamActivities = [];
  List<ActivityModel> otherTeamActivities = [];
  List<ActivityModel> otherFreelancerActivities = [];
  int offsetTeamActivities = 19;
  int offsetFreelancerActivities = 19;
  bool isLast = false;
  bool freelancerLoading = false;

  List<ActivityLogs> tileLine = [];

  //--------------------------getFreelancerActivities---------------------------

  Future<dynamic> getFreelancerActivities() async {
    freelancerLoading = true;
    freelancerActivities = await _activityRepo.getActivitiesRepo(
        role: "user", limit: "20", offset: "0", type: "");
    notifyListeners();
  }

  //--------------------------disposeLoading-------------------------------------

  disposeLoading() {
    isLoading = false;
    secondIsLoading = false;
    freelancerLoading = false;
    notifyListeners();
  }

  //------------------------------getTeamActivities------------------------------

  Future<dynamic> getTeamActivities() async {
    isLoading = true;
    teamActivities = await _activityRepo.getActivitiesRepo(
        role: "team", limit: "20", offset: "0" , type: "");
    notifyListeners();
  }

  //-----------------------------getOtherActivitiesTeam-------------------------

  Future<dynamic> getOtherActivitiesTeam() async {
    otherTeamActivities = await _activityRepo.getActivitiesRepo(
        role: "team", limit: "20", offset: "$offsetTeamActivities", type: "");
    offsetTeamActivities += 19;
    teamActivities.addAll(otherTeamActivities);
  }

  //-----------------------------getOtherActivitiesFreelancer-------------------

  Future<dynamic> getOtherActivitiesFreelancer() async {
    otherFreelancerActivities = await _activityRepo.getActivitiesRepo(
        role: "user", limit: "100", offset: "$offsetFreelancerActivities",type: "");
    offsetFreelancerActivities += 19;
    if(otherFreelancerActivities.isEmpty) {
      isLast = true;
    }
    freelancerActivities.addAll(otherFreelancerActivities);
    otherFreelancerActivities = [];
  }

  //------------------------selectActivityAndGetTimeLine------------------------

 bool isChecked = false ;

  Future<dynamic> selectActivity({required String activityId}) async{
    final int index = freelancerActivities
        .indexWhere((activity) => activity.id.id == activityId);
    if (freelancerActivities[index].isCheck ) {

      freelancerActivities[index].isCheck = false;
      isChecked = freelancerActivities[index].isCheck;
     
      notifyListeners();
    }

    else {
      for (var element in freelancerActivities) {
        element.isCheck = false;
      }
      secondIsLoading = true;
      freelancerActivities[index].isCheck = true;
      notifyListeners();
      tileLine = await _activityRepo.getActivityTimeLineRepo(id: activityId);
      freelancerActivities[index].isCheck = true;
      notifyListeners();
    }

  }

  //------------------------------searchActivity-----------------------------------

Future<dynamic> searchActivity({required String searchText, required String role}) async {
  // isLoading = true;
  // notifyListeners();
  Future.delayed(const Duration(seconds: 2) , () async {
    if(role == "team"){
    teamActivities = await _activityRepo.searchActivityRepo(
        role: role, limit: "20", offset: "0" , searchText: searchText);
    notifyListeners();
    } else {
      freelancerActivities = await _activityRepo.searchActivityRepo(
          role: role, limit: "20", offset: "0" , searchText: searchText);
      notifyListeners();
    }
  });

}

}
