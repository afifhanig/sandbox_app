import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:sandbox_flutter_3/feature/local_notif/local_notification.dart';

class ShowNotification extends StatelessWidget {
  const ShowNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification example'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('show notification'),
          onPressed: () async {
            //LocalNotificationService().showNotification();
          },
        ),
      ),
    );
  }
}
