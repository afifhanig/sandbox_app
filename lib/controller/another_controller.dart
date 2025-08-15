import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AnotherController extends GetxController {
  final dio = Dio()
    ..interceptors.add(
      LogInterceptor(
        request: false,
        responseBody: true,
        requestBody: false,
        requestHeader: false,
      ),
    )
    ..options.headers['X-Api-Key'] = '0KUUn73fz8o2RAZpulN9ug==M4Dm7jWHZYu5XFJp'
    ..options.connectTimeout = const Duration(seconds: 4)
    ..options.receiveTimeout = const Duration(seconds: 4);

  Future<void> ambilData() async {
    print('AMBIL DATA');
    //var url = "https://randomuser.me/api/?page=0&results=20&seed=abc";
    var url = "https://api.api-ninjas.com/v1/randomuser";
    try {
      final response = await dio.get(url);
      if (response.data != null) {
        debugPrint('sukses hit BE');
      }
    } on DioError catch (e) {
      debugPrint('gagal hit BE, errornya : $e');
      //error = e.message.toString();
    }
  }
}
