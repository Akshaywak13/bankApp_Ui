import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    AwesomeNotifications().initialize(
      'resource://drawable/icon',
      [
        NotificationChannel(
          channelGroupKey: "high_importance_channel",
          channelKey: 'high_importance_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic notifications',
          defaultColor: Color(0xFF9D50DD),
          ledColor: Colors.white,
          importance: NotificationImportance.Max,
          onlyAlertOnce: true,
          playSound: true,
          enableVibration: true,
          criticalAlerts: true,
        ),
      ],
    );

    await AwesomeNotifications().setListeners(
      onActionReceivedMethod: onActionReceivedMethod,
      onNotificationDisplayedMethod: (receivedNotification) async {
        print('Notification Displayed: ${receivedNotification}');
      },
    );
  }

  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    print('Action Received: ${receivedAction}');
    print('Button Pressed: ${receivedAction.buttonKeyPressed}');
  }

  void showNotification() async {
    AwesomeNotifications().createNotification(
      actionButtons: [
        NotificationActionButton(
          key: "reject",
          label: "Reject",
        ),
        NotificationActionButton(
          key: "accept",
          label: "accept",
        ),
      ],
      content: NotificationContent(
        id: 10,
        channelKey: 'high_importance_channel',
        title: 'Notification Title',
        body: 'Notification Body',
        badge: 3,
        color: Colors.green,
        // displayOnForeground: true,
        // displayOnBackground: true,
         notificationLayout: NotificationLayout.Default,
        // wakeUpScreen: true,
        // showWhen: true,
      ),
    );
  }
}
