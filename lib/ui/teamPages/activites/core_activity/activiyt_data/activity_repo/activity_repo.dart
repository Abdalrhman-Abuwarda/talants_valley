import 'package:dio/dio.dart';
import 'package:talants_valley/core/data/network/api/end_points.dart';

import '../../../../../../../../core/data/network/api/dio_client.dart';
import '../../../../../../../../locator.dart';
import '../../activity_model/activity_model.dart';

class ActivityRepo {
  final DioClient _dioClient = locator<DioClient>();

  //----------------------------------------------------------------------------


  Future<List<ActivityModel>> getActivitiesRepo(
      {required String role, required String limit, required String offset, required String type}) async {
    final Response response = await _dioClient.get(
        Endpoints.getActivityList, queryParameters: {
      "role": role,
      "limit": limit,
      "offset": offset,
    });

    final List dataList = response.data["data"]["activityLogs"];
    final List<ActivityModel> activities = dataList.map((activity) =>
        ActivityModel.fromJson(activity)).toList();
    return activities;
  }


  //-----------------------------searchActivity---------------------------------


  Future<List<ActivityModel>> searchActivityRepo({required String searchText, required String limit, required String offset,
  required String role}) async {
    final Response response = await _dioClient.get(Endpoints.getActivityList, queryParameters: {
      "role": role,
      "limit": limit,
      "offset": offset,
      "search" : searchText
    });

    final List dataList = response.data["data"]["activityLogs"];
    final List<ActivityModel> activities = dataList.map((activity) =>
        ActivityModel.fromJson(activity)).toList();
    return activities;
  }


//------------------------------------------------------------------------------


  Future<List<ActivityLogs>> getActivityTimeLineRepo(
      {required String id}) async {
    final Response response = await _dioClient.get(
        "${Endpoints.getActivityTimeLine}$id");
    final List dataList = response.data["data"]["timeline"];
    final List<ActivityLogs> activityLogs = dataList.map((logs) =>
        ActivityLogs.fromJson(logs)).toList();
    return activityLogs;
  }

}