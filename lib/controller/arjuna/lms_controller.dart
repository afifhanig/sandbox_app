import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sandbox_flutter_3/api/arjuna/api_request.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/lms/arjuna_all_training_catalog.dart';
import 'package:sandbox_flutter_3/model/arjuna/lms/getAllCatalog_model.dart' as all_catalog_model;
import 'package:sandbox_flutter_3/model/arjuna/lms/getMandatoryCatalog_model.dart';
import 'package:sandbox_flutter_3/model/arjuna/lms/getNearestTraining_model.dart';

class LMSController extends GetxController {
  //Get My Task
  RxString pendingApproval = ''.obs;
  RxString pendingRequest = ''.obs;
  RxString trainingInvitation = ''.obs;
  //Get My Journey
  RxString journeyCompleted = ''.obs;
  RxString journeyNotCompleted = ''.obs;
  RxString journeyOnScheduled = ''.obs;
  //Mandatory Catalog
  RxList<MandatoryCatalogModel> mandatoryCatalog = <MandatoryCatalogModel>[].obs;
  //Nearest Training
  RxList<NearestTraining> nearestTraining = <NearestTraining>[].obs;
  //
  RxList<all_catalog_model.Content> allTrainingCatalogList = <all_catalog_model.Content>[].obs;

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        getMyTask();
        getMyJourney();
        getMandatoryCatalog();
        getNearestTraining();
      },
    );
    super.onInit();
  }

  getMyTask() async {
    var response = await Request().apiGetMyTask();
    if (response != null) {
      pendingApproval.value = response.pendingApproval.toString();
      pendingRequest.value = response.pendingRequest.toString();
      trainingInvitation.value = response.trainingInvitation.toString();
    }
  }

  getMyJourney() async {
    var response = await Request().apiGetMyJourney();
    if (response != null) {
      journeyCompleted.value = response.completed.toString();
      journeyNotCompleted.value = response.notComplete.toString();
      journeyOnScheduled.value = response.onSchedule.toString();
    }
  }

  getMandatoryCatalog() async {
    var response = await Request().apiGetMandatoryCatalog();
    if (response.isNotEmpty) {
      mandatoryCatalog.assignAll(response);
    }
  }

  getNearestTraining() async {
    var response = await Request().apiGetNearestTraining();
    if (response.isNotEmpty) {
      nearestTraining.assignAll(response);
    }
  }

  getAllCatalogTraining() async {
    var response = await Request().apiGetAllTrainingCatalog();
    if (response != null) {
      allTrainingCatalogList.assignAll(response.content);
      Get.to(AllCatalogTrainingScreen());
    }
  }
}
