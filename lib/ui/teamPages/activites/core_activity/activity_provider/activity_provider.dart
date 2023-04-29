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
  int offsetFreelancerActivities = 100;
  bool isLast = false;

  List<ActivityLogs> tileLine = [];

  //--------------------------getFreelancerActivities---------------------------

  Future<dynamic> getFreelancerActivities() async {
    isLoading = true;
    freelancerActivities = await _activityRepo.getActivitiesRepo(
        role: "user", limit: "20", offset: "0");
    notifyListeners();
  }

  //--------------------------disposeLoading-------------------------------------

  disposeLoading() {
    isLoading = false;
    secondIsLoading = false;
    notifyListeners();
  }

  //------------------------------getTeamActivities------------------------------

  Future<dynamic> getTeamActivities() async {
    isLoading = true;
    teamActivities = await _activityRepo.getActivitiesRepo(
        role: "team", limit: "20", offset: "0");
    notifyListeners();
  }

  //-----------------------------getOtherActivitiesTeam-------------------------

  Future<dynamic> getOtherActivitiesTeam() async {
    otherTeamActivities = await _activityRepo.getActivitiesRepo(
        role: "team", limit: "20", offset: "$offsetTeamActivities");
    offsetTeamActivities += 19;
    teamActivities.addAll(otherTeamActivities);
  }

  //-----------------------------getOtherActivitiesFreelancer-------------------

  Future<dynamic> getOtherActivitiesFreelancer() async {
    otherFreelancerActivities = await _activityRepo.getActivitiesRepo(
        role: "user", limit: "100", offset: "$offsetFreelancerActivities");
    offsetFreelancerActivities += 100;
    if(otherFreelancerActivities.isEmpty) {
      isLast = true;
    }
    freelancerActivities.addAll(otherFreelancerActivities);
    otherFreelancerActivities = [];
  }

  //------------------------------selectActivity--------------------------------

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

  //------------------------------getTimeLine-----------------------------------


}
