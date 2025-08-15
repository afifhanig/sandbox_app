import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sandbox_flutter_3/api/api_request.dart';
import 'package:sandbox_flutter_3/feature/conton_screen_2.dart';
import 'package:sandbox_flutter_3/model/contoh_model.dart';

class ContohController extends GetxController {
  RxString nama = ''.obs;
  RxString pesan = ''.obs;
  RxInt angka = 0.obs;
  RxList<Questions> firstList = <Questions>[].obs;

  @override
  void onInit() {
    //await readJson();
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   await getData();
    // });
    super.onInit();
  }

  //-------------- biasanya di API file------?//
  Future<ContohModel?> readJson() async {
    ContohModel? contohModel;
    try {
      var response = await rootBundle.loadString('assets/images/test.json');
      if (response.isNotEmpty) {
        var data = await json.decode(response);
        print(data);
        contohModel = ContohModel.fromJson(data);
        return contohModel;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return contohModel;
  }
  //-------------- biasanya di API file------?//

  //-------------- biasanya di controller------?//
  Future<void> getData() async {
    Get.dialog(const Center(child: CircularProgressIndicator(color: Colors.red)), barrierDismissible: false);
    var response = await ApiRequest().getAllAvailableDesk();
    if (response != null) {
      pesan.value = response.message;
      print('object ${response.data.deskListDto.length}');
      Get.back();
      Get.off(const ContohScreenDua());
    }   
    // var response = await readJson();
    // if (response != null) {
    //   debugPrint("data ==> ${response.minimumScore.toString()}");
    //   nama.value = response.testName;
    //   firstList.assignAll(response.questions);
    //   Get.back();
    // } else {
    //   print('object');
    //   Get.back();
    // }
  }
  //-------------- biasanya di controller------?//

}
