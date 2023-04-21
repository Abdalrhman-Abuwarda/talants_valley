import 'package:dio/dio.dart';
import 'package:talants_valley/core/data/network/api/end_points.dart';

import '../../../../../../../../core/data/network/api/dio_client.dart';
import '../../../../../../../../locator.dart';
import '../../activity_model/activity_model.dart';

class ActivityRepo{
  final DioClient  _dioClient =  locator<DioClient>();

Future<List<ActivityModel>> getActivitiesRepo({required String role , required String limit}) async{
  final Response response = await _dioClient.get(Endpoints.getActivityList, queryParameters: {
    "role" : role,
    "limit" : limit
  }) ;
  final List dataList = response.data["data"]["activityLogs"];
  final List<ActivityModel> activities = dataList.map((activity) => ActivityModel.fromJson(activity)).toList();
  return activities;
}

}