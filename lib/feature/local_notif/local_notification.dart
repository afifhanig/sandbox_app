import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:sandbox_flutter_3/feature/local_notif/local_notif_screen.dart';

class LocalNotificationService {
  // Instance of Flutternotification plugin
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  initLocalNotifServier() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings initializationSettingsIOS = DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );
    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: ((details) {
        debugPrint('disini rayy ${details.payload}');
        if (details.payload != null) {
          Get.to(ShowNotification());
        }
      }),
      // onDidReceiveBackgroundNotificationResponse: (details) {
      //   debugPrint('disini bbrayy ${details.payload}');
      // },
    );
  }

  showNotification(RemoteMessage rmtMsg) async {
    AndroidNotificationChannel channel = const AndroidNotificationChannel(
      'high channel',
      'Very important notification!!',
      description: 'the first notification',
      importance: Importance.max,
    );

    await flutterLocalNotificationsPlugin.show(
        1,
        '${rmtMsg.notification!.title}',
        '${rmtMsg.notification!.body}',
        NotificationDetails(
          android: AndroidNotificationDetails(channel.id, channel.name, channelDescription: channel.description),
        ),
        payload: 'from firebase');
  }
}
