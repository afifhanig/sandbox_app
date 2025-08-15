import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/lms/arjuna_all_training_catalog.dart';
import 'package:sandbox_flutter_3/model/arjuna/lms/getAllCatalog_model.dart';
import 'package:sandbox_flutter_3/model/arjuna/lms/getMandatoryCatalog_model.dart';
import 'package:sandbox_flutter_3/model/arjuna/lms/getNearestTraining_model.dart';
import 'package:sandbox_flutter_3/model/arjuna/lms/getmyjourney_model.dart';
import 'package:sandbox_flutter_3/model/arjuna/lms/getmytask_model.dart';

class Request {
  Future<GetMyTaskModel?> apiGetMyTask() async {
    GetMyTaskModel? getMyTaskModel;
    // try {
    //   Dio _dio = await HttpUtils().initDio(timeout: 60000);
    //   Response response = await _dio.get(ApiConfig().baseUrlDevBooking(ApiConfig.employeeProfilePicture));
    //   if (response.statusCode == 200 && response.data != null) {
    //     getMyTaskModel = GetMyTaskModel.fromJson(response.data);
    //   }
    // } catch (e) {
    //   print(e);
    // }
    try {
      var getMytasksResponds = await rootBundle.loadString('assets/pdf/MyTask/getMyTask.json');
      if (getMytasksResponds.isNotEmpty) {
        print('success');
        var data = await json.decode(getMytasksResponds);
        getMyTaskModel = GetMyTaskModel.fromJson(data);

        return getMyTaskModel;
      }
    } catch (e) {
      print(e);
    }
    return getMyTaskModel;
  }

  Future<GetMyJourneyModel?> apiGetMyJourney() async {
    GetMyJourneyModel? getMyJourneyModel;
    try {
      var getMytasksResponds = await rootBundle.loadString('assets/pdf/MyJourney/getMyJourney.json');
      if (getMytasksResponds.isNotEmpty) {
        var data = await json.decode(getMytasksResponds);
        getMyJourneyModel = GetMyJourneyModel.fromJson(data);

        return getMyJourneyModel;
      }
    } catch (e) {
      print(e);
    }
    return getMyJourneyModel;
  }

  Future<List<MandatoryCatalogModel>> apiGetMandatoryCatalog() async {
    List<MandatoryCatalogModel> catalogList = [];
    try {
      var getMandatoryCatalogResponds = await rootBundle.loadString("assets/pdf/MyKatalog/getMandatoryKatalog.json");
      if (getMandatoryCatalogResponds.isNotEmpty) {
        var data = await jsonDecode(getMandatoryCatalogResponds) as List;
        catalogList = data.map((data) => MandatoryCatalogModel.fromJson(data)).toList();
      }
    } catch (e) {
      print(e);
    }
    return catalogList;
  }

  Future<List<NearestTraining>> apiGetNearestTraining() async {
    List<NearestTraining> nearestTraining = [];
    try {
      var getNearestTraining = await rootBundle.loadString("assets/pdf/MyKatalog/getNearestTraining.json");
      if (getNearestTraining.isNotEmpty) {
        var data = await jsonDecode(getNearestTraining) as List;
        nearestTraining = data.map((data) => NearestTraining.fromJson(data)).toList();
      }
    } catch (e) {
      print(e);
    }
    return nearestTraining;
  }

  Future<AllCatalogTrainingModel?> apiGetAllTrainingCatalog() async {
    AllCatalogTrainingModel? getAllCatalog;
    try {
      var getAllCatalogTraining = await rootBundle.loadString("assets/pdf/MyKatalog/getAllCatalog.json");
      if (getAllCatalogTraining.isNotEmpty) {
        var data = await jsonDecode(getAllCatalogTraining);
        getAllCatalog = AllCatalogTrainingModel.fromJson(data);
      }
    } catch (e) {
      print(e);
    }

    return getAllCatalog;
  }
}
