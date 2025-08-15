import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandbox_flutter_3/feature/push_notif/push_notification_screen.dart';

class TestPageNotifLanding extends StatelessWidget {
  const TestPageNotifLanding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.keyboard_arrow_left_rounded),
          onPressed: () => null//Navigator.of(context).pop(),
        ),
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.offAll(PushNotificationScreen());
                },
                child: Text('Go to'))
          ],
        ),
      ),
    );
  }
}
