import 'package:flutter/material.dart';

import '../../../../../locator.dart';
import '../notification_model/notification_model.dart';
import '../notification_team_data/notification_team_repo.dart';
class NotificationTeamProvider extends ChangeNotifier{

  final NotificationTeamRepo  _activityRepo =  locator<NotificationTeamRepo>();


  List<NotificationModel> notifications =  [];
  bool isLoading = false;
  Future<dynamic> getNotifications() async {
    isLoading = true;
    notifications = await _activityRepo.getNotificationsRepo();
    notifyListeners();
  }
}