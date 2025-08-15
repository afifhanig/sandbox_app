import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandbox_flutter_3/api/api_request.dart';
import 'package:sandbox_flutter_3/model/all_available_desk_response.dart';

class DeskController extends GetxController {
  RxString pesan = ''.obs, imageFile = ''.obs, objectName = 'obj_name'.obs;
  RxDouble imageFileHeight = 0.0.obs, imageFileWidth = 0.0.obs;
  RxInt counter = 0.obs;
  //
  RxList<Map<String, dynamic>> regionsData = <Map<String, dynamic>>[].obs;
  RxList selectedRegionTaps = <String>[].obs;
  //
  RxBool canScroll = true.obs, isSkrolling = false.obs;

  @override
  void onInit() {
    //await readJson();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getData();
    });
    super.onInit();
  }

  Future<void> getData() async {
    Get.dialog(const Center(child: CircularProgressIndicator(color: Colors.red)), barrierDismissible: false);
    var response = await ApiRequest().getAllAvailableDesk();
    if (response != null) {
      pesan.value = response.message;
      imageFile.value = response.data.layout;
      getImageSize(response.data.layout);
      setCoordinate(response.data.deskListDto);
    }
    Get.back();
  }

  getImageSize(String source) async {
    var imgStr = const Base64Decoder().convert(source);
    var decImg = await decodeImageFromList(imgStr);
    imageFileHeight.value = decImg.height.toDouble();
    imageFileWidth.value = decImg.width.toDouble();
  }

  setCoordinate(List<DeskListDto> data) {
    for (final dataItem in data) {
      final String regionTap = dataItem.number;
      final String status = dataItem.status;
      final String coordinate0 = dataItem.coordinate0;
      final String coordinate1 = dataItem.coordinate1;
      final String coordinate2 = dataItem.coordinate2;
      final String coordinate3 = dataItem.coordinate3;
      final Rect regionRect = getAreaFromCoordinateString(coordinate0, coordinate1, coordinate2, coordinate3);

      regionsData.add({
        'path': regionRect,
        'regionTap': regionTap,
        'status': status,
        'selected': false, // Initialize selected state as false
      });
    }
  }

  Rect getAreaFromCoordinateString(String coordinate0, String coordinate1, String coordinate2, String coordinate3) {
    // final List<String> coordinateValues = coordinateString.split(',');

    // if (coordinateValues.length != 4) {
    //   throw ArgumentError('Invalid number of coordinates for Rect');
    // }

    final double left = double.parse(coordinate0);
    final double top = double.parse(coordinate1);
    final double right = double.parse(coordinate2);
    final double bottom = double.parse(coordinate3);

    return Rect.fromLTRB(left, top, right, bottom);
  }
}
