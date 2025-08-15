import 'dart:convert' as convert;
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:sandbox_flutter_3/feature/lazy_load/user_model.dart';
import 'package:sandbox_flutter_3/model/all_available_desk_response.dart';

class ApiRequest {
  final dio = Dio()
    ..interceptors.add(
      LogInterceptor(
        request: true,
        // responseBody: true,
        // requestBody: true,
        // requestHeader: true,
      ),
    )
    ..options.connectTimeout = const Duration(seconds: 4)
    ..options.receiveTimeout = const Duration(seconds: 4);

  Future<UserModel?> getUserApi() async {
    List<UserModel> userModel;
    //UserModel userModel;
    try {
      var url = "https://randomuser.me/api/?page=0&results=20&seed=abc";
      var response = await dio.get(url);
      if (response.statusCode == 200) {
        return null;
      } else {
        print('Request failed with status: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      throw 'error getting data $e';
    }
  }

  Future<AllAvailableDeskResponse?> getAllAvailableDesk() async {
    AllAvailableDeskResponse? allAvailableDeskResponse;
    try {
      final String response = await rootBundle.loadString('assets/images/get-all-available-desk-response.json');
      final data = await convert.json.decode(response);
      allAvailableDeskResponse = AllAvailableDeskResponse.fromJson(data);
    } catch (e) {
      debugPrint(e.toString());
    }
    return allAvailableDeskResponse;
  }
}
