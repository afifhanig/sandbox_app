import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sandbox_flutter_3/feature/local_notif/local_notif_screen.dart';
import 'package:sandbox_flutter_3/feature/local_notif/local_notification.dart';
import 'package:sandbox_flutter_3/feature/push_notif/push_notification_screen.dart';
import 'package:sandbox_flutter_3/feature/push_notif/test_page_notif_1.dart';
import 'package:sandbox_flutter_3/main.dart';

class PushNotifController {
  final FirebaseMessaging _firebaseMessaging;
  PushNotifController(this._firebaseMessaging);

  initialize() async {
    if (Platform.isIOS) {
      _firebaseMessaging.requestPermission(
          alert: true,
          announcement: false,
          badge: true,
          carPlay: false,
          criticalAlert: false,
          provisional: false,
          sound: true);
    }
    final fcmToken = await _firebaseMessaging.getToken();
    print('fcm tokennya : $fcmToken');

    final deviceInfo = await DeviceInfoPlugin().androidInfo;
    if (deviceInfo.version.sdkInt! > 32) {
      print('masuk1');
      if (await Permission.notification.isDenied) {
        await Permission.notification.request();
        print('masuk44');
      }
    } else {
      print('masuk2');
      if (await Permission.notification.isDenied) {
        await Permission.notification.request();
      }
    }

    _firebaseMessaging.onTokenRefresh.listen((fcmToken) {
      // TODO: If necessary send token to application server.
      // Note: This callback is fired at each app startup and whenever a new
      // token is generated.
    }).onError((err) {
      // Error getting token.
    });

    // FirebaseMessaging.instance.getInitialMessage().then((message) {
    //   if (message != null) {
    //     // Get.offAll(PushNotificationScreen(
    //     //   x: message.notification!.body,
    //     // ));
    //     Get.offAll(TestPageNotifLanding());
    //   }
    // });

    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      print("message recieved");
      print(event.notification!.body);
      print(event.notification != null ? 'yes' : 'no');
      // Get.to(PushNotificationScreen(
      //   x: event.notification!.body,
      // ));
      if (event.notification != null) {
        LocalNotificationService().showNotification(event);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('Message clicked!');
      // Get.offAll(PushNotificationScreen(
      //   x: message.notification!.body,
      // ));
      //Get.offAll(TestPageNotifLanding());
      //print(message.)
    });
  }
}
