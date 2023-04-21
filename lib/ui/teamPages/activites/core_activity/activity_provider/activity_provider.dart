import 'package:flutter/cupertino.dart';
import 'package:talants_valley/ui/teamPages/activites/core_activity/activity_model/activity_model.dart';
import 'package:talants_valley/ui/teamPages/activites/core_activity/activiyt_data/activity_repo/activity_repo.dart';

import '../../../../../locator.dart';

class ActivityProvider extends ChangeNotifier{
  final ActivityRepo  _activityRepo =  locator<ActivityRepo>();

  bool isLoading = false;
 List<ActivityModel> freelancerActivities = [];


 //--------------------------getFreelancerActivities---------------------------

 Future<dynamic> getFreelancerActivities() async {
   isLoading = true;
   freelancerActivities = await _activityRepo.getActivitiesRepo(role: "user" , limit: "10");
   notifyListeners();
 }

 //--------------------------disposeLoading-------------------------------------
 disposeLoading(){
   isLoading = false;
  notifyListeners();
 }
}