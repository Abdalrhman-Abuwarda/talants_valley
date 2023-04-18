import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:talants_valley/routing/router.dart';

import '../../../../routing/navigations.dart';
import 'local_notification_service.dart';
class OneSignalService {
  static OneSignal? _instance;
  oneSignalSService() {
    getInstance();
    _instance!.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    _instance!.setAppId("7f811b94-c90f-480e-9d8e-dcaaabdf1289");
// The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
    _instance!.promptUserForPushNotificationPermission().then((accepted) {
      debugPrint("Accepted permission: $accepted");
    });
    _instance!.setNotificationWillShowInForegroundHandler(
            (OSNotificationReceivedEvent event) {
              createLocalNotification;
// Will be called whenever a notification is received in foreground
// Display Notification, pass null param for not displaying the notification
          event.complete(event.notification);
        });
    _instance!
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      // createLocalNotification;
      debugPrint("This is data notification =====>>>>> \n${result.notification.additionalData}");
      ServiceNavigation.serviceNavi.pushNamedWidget(RouteGenerator.notificationDetailsPage);

      // Navigator.push(
      //     Helpers.scaffoldKey.currentState!.context,
      //     MaterialPageRoute(
      //         builder: (context) => NotificationDetailsPage(
      //             data: result.notification.additionalData)));

// Will be called whenever a notification is opened/button pressed.
    });
//     _instance!.setPermissionObserver((OSPermissionStateChanges changes) {
// // Will be called whenever the permission changes
// // (ie. user taps Allow on the permission prompt in iOS)
//     });

  }
  static OneSignal? getInstance() {
    _instance ??= OneSignal.shared;
    return _instance;
  }

  Future<void> getUserTokenId() async {
    var deviceState = await _instance!.getDeviceState();
    if (deviceState != null || deviceState?.userId != null) {
      String tokenId = deviceState!.userId!;
      debugPrint("TOKEN ID: $tokenId");
    }
  }

  void handleSendNotification(
      {required String tokenId,
        required String title,
        required String desc}) async {
    var notification = OSCreateNotification(
        playerIds: [tokenId], content: desc, heading: title);
    await _instance!.postNotification(notification);
  }

}