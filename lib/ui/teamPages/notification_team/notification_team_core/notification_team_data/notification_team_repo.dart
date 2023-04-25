import 'package:talants_valley/core/data/network/api/end_points.dart';

import '../../../../../core/data/network/api/dio_client.dart';
import '../../../../../locator.dart';
import '../notification_model/notification_model.dart';


class NotificationTeamRepo{

  final DioClient  _dioClient =  locator<DioClient>();

  Future<List<NotificationModel>> getNotificationsRepo() async {
    final response = await _dioClient.get(Endpoints.getNotificationsTeam);
    final List dataList = response.data["data"];
    final List<NotificationModel> notifications = dataList.map((notification) => NotificationModel.fromJson(notification)).toList();
    return notifications;

  }

}