import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/get.dart';

class TakeScreenshotsController {
  static const platform = MethodChannel('com.example.screenshot/prevention');

  // Future<void> disable() async {
  //   debugPrint('screenshot disabled');
  //   if (Platform.isAndroid) {
  //     await _disableScreenshotsAndroid();
  //   } else if (Platform.isIOS) {
  //     await _disableScreenshotsIOS();
  //   }
  // }

  // Future<void> enable() async {
  //   debugPrint('screenshot enable');
  //   if (Platform.isAndroid) {
  //     await _enableScreenshotsAndroid();
  //   } else if (Platform.isIOS) {
  //     await _enableScreenshotsIOS();
  //   }
  // }

  // Future<void> _enableScreenshotsAndroid() async {
  //   debugPrint('enable android');
  //   try {
  //     await FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
  //     snackbarToast('info!', 'Screenshot is enabled');
  //   } on PlatformException catch (e) {
  //     debugPrint("Error disabling screenshots on Android: ${e.message}");
  //   }
  // }

  // Future<void> _enableScreenshotsIOS() async {
  //   debugPrint('enable IOS');
  //   try {
  //     await platform.invokeMethod('disableScreenshotPrevention');
  //     snackbarToast('info!', 'Screenshot is enabled');
  //   } on PlatformException catch (e) {
  //     debugPrint("Error disabling screenshots on Android: ${e.message}");
  //   }
  // }

  // Future<void> _disableScreenshotsAndroid() async {
  //   debugPrint('disable android');
  //   try {
  //     await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  //     snackbarToast('info!', 'Screenshot is disabled');
  //   } on PlatformException catch (e) {
  //     debugPrint("Error disabling screenshots on Android: ${e.message}");
  //   }
  // }

  // Future<void> _disableScreenshotsIOS() async {
  //   debugPrint('disable IOS');
  //   try {
  //     await platform.invokeMethod('enableScreenshotPrevention');
  //     snackbarToast('info!', 'Screenshot is disabled');
  //   } on PlatformException catch (e) {
  //     debugPrint("Error disabling screenshots on iOS: ${e.message}");
  //   }
  // }

  Future<void> enable() async {
    if (Platform.isAndroid) {
      try {
        await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
        //debugPrint("Success enabling screenshoot prevention");
        snackbarToast('info!', 'Screenshot prevention is enabled');
      } on PlatformException catch (e) {
        debugPrint("Error enabling screenshoot prevention screenshots on Android: ${e.message}");
      }
    } else if (Platform.isIOS) {
      // try {
      //   await platform.invokeMethod('enableScreenshotPrevention');
      // } on PlatformException catch (e) {
      //   debugPrint("Error disabling screenshots on iOS: ${e.message}");
      // }
    }
  }

  Future<void> disable() async {
    if (Platform.isAndroid) {
      try {
        await FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
        //debugPrint("Success disabling screenshoot prevention");
        snackbarToast('info!', 'Screenshot prevention is disabled');
      } on PlatformException catch (e) {
        debugPrint("Error disabling screenshots prevention on Android: ${e.message}");
      }
    } else if (Platform.isIOS) {
      // try {
      //   await platform.invokeMethod('disableScreenshotPrevention');
      // } on PlatformException catch (e) {
      //   debugPrint("Error disabling screenshots on Android: ${e.message}");
      // }
    }
  }

  void snackbarToast(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(20),
    );
  }
}
