import 'package:flutter/cupertino.dart';
import 'package:talants_valley/ui/teamPages/activites/core_activity/activity_model/activity_model.dart';
import 'package:talants_valley/ui/teamPages/activites/core_activity/activiyt_data/activity_repo/activity_repo.dart';

import '../../../../../locator.dart';

class ActivityProvider extends ChangeNotifier{
  final ActivityRepo  _activityRepo =  locator<ActivityRepo>();

  bool isLoading = false;
 List<ActivityModel> freelancerActivities = [];
 List<ActivityModel> teamActivities = [];


 //--------------------------getFreelancerActivities---------------------------

 Future<dynamic> getFreelancerActivities() async {
   isLoading = true;
   freelancerActivities = await _activityRepo.getActivitiesRepo(role: "user" , limit: "20");
   notifyListeners();
 }

 //--------------------------disposeLoading-------------------------------------


 disposeLoading(){
   isLoading = false;
  notifyListeners();
 }

 //------------------------------getTeamActivities------------------------------

  Future<dynamic> getTeamActivities() async {
    isLoading = true;
    teamActivities = await _activityRepo.getActivitiesRepo(role: "team" , limit: "20");
    notifyListeners();
  }

  //------------------------------selectActivity--------------------------------


  selectActivity({required String activityId}) {
    final int index = freelancerActivities.indexWhere((activity) => activity.id.id == activityId );

    if(freelancerActivities[index].isCheck == true){
      debugPrint("This is inside if");
      freelancerActivities[index].isCheck = false;
      debugPrint("This is freelancerActivities[index].isCheck ${freelancerActivities[index].isCheck}");
      notifyListeners();
    }

    for (var element in freelancerActivities) {
      element.isCheck = false;
    }
      freelancerActivities[index].isCheck = true;
      notifyListeners();
  }


}