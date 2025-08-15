import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandbox_flutter_3/home/rumah.dart';

class PushNotificationScreen extends StatefulWidget {
  String? x;
  PushNotificationScreen({super.key, this.x});

  @override
  State<PushNotificationScreen> createState() => _PushNotificationScreenState();
}

class _PushNotificationScreenState extends State<PushNotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Get.offAll(Rumah());
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Push'),
          leading: new IconButton(
            icon: new Icon(Icons.keyboard_arrow_left_rounded),
            onPressed: () {
              Get.offAll(Rumah());
            },
          ),
        ),
        body: Container(
          child: Center(
            child: Text('1. the message is : ${widget.x}'),
          ),
        ),
      ),
    );
  }
}
