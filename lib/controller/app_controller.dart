import 'dart:io';
import 'dart:typed_data';

import 'package:dio/io.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sandbox_flutter_3/api/api_request.dart';
import 'package:sandbox_flutter_3/feature/conton_screen_2.dart';
import 'package:sandbox_flutter_3/feature/lazy_load/user_model.dart';
import 'package:http/http.dart' as http;

class AppController extends GetxController {
  //dio
  final dio = Dio()
    // ..interceptors.add(
    //   LogInterceptor(
    //     request: true,
    //     responseBody: true,
    //     requestBody: true,
    //     requestHeader: true,
    //   ),
    // )
    ..options.connectTimeout = const Duration(seconds: 4)
    ..options.receiveTimeout = const Duration(seconds: 4);

  static int page = 0;
  final ScrollController sc = ScrollController();
  bool isLoading = false;
  List users = [];
  List tList = [];
  String error = '';
  //
  int halaman = 0; // default page to 0
  final int perHalaman = 10;
  late List dataToShow = [];
  final List<int> _data = List.generate(100, (i) => i);
  List dataPerpage = [];
  bool isAllDataLoaded = false;
  //
  List<TheObject> objectPerPage = [];
  List<TheObject> objectCard = [];
  List<TheObject> objectToSHow = [];
  //
  List userPerPage = [];
  List userToShow = [];
  @override
  void onInit() async {
    super.onInit();
    await _getMoreData(page);
    //_getMoreData2();
    //await addData();
    //_getMoreData3();
    // await _getMoreData4();
    // voidLanjutanGetMoreData4();
    // sc.addListener(() async {
    //   if (sc.position.pixels == sc.position.maxScrollExtent) {
    //     await _getMoreData(page);
    //     //_getMoreData2();
    //     //_getMoreData3();
    //     //await _getMoreData4();
    //     //voidLanjutanGetMoreData4();
    //   }
    // });
  }

  addData() {
    debugPrint('adding data');
    objectCard.add(TheObject(nama: 'afif', alamat: 'bandung'));
    objectCard.add(TheObject(nama: 'afif', alamat: 'bandung'));
    objectCard.add(TheObject(nama: 'afif', alamat: 'bandung'));
    objectCard.add(TheObject(nama: 'afif', alamat: 'bandung'));
    objectCard.add(TheObject(nama: 'afif', alamat: 'bandung'));
    objectCard.add(TheObject(nama: 'afif', alamat: 'bandung'));
    objectCard.add(TheObject(nama: 'afif', alamat: 'bandung'));
    objectCard.add(TheObject(nama: 'afif', alamat: 'bandung'));
    objectCard.add(TheObject(nama: 'afif', alamat: 'bandung'));
    objectCard.add(TheObject(nama: 'afif', alamat: 'bandung'));
    objectCard.add(TheObject(nama: 'afif', alamat: 'bandung'));
    objectCard.add(TheObject(nama: 'afif', alamat: 'bandung'));
    objectCard.add(TheObject(nama: 'afif', alamat: 'bandung'));
    objectCard.add(TheObject(nama: 'afif', alamat: 'bandung'));
    objectCard.add(TheObject(nama: 'afif', alamat: 'bandung'));
    objectCard.add(TheObject(nama: 'afif', alamat: 'bandung'));
    objectCard.add(TheObject(nama: 'afif', alamat: 'bandung'));
    objectCard.add(TheObject(nama: 'afif', alamat: 'bandung'));
    objectCard.add(TheObject(nama: 'afif', alamat: 'bandung'));
    objectCard.add(TheObject(nama: 'afif', alamat: 'bandung'));
  }

  Future<void> _getMoreData(int index) async {
    ByteData bytes = await rootBundle.load('assets/images/leaf_cert.pem');
    if (!isLoading) {
      isLoading = true;
      update();
      var url = "https://randomuser.me/api/?page=$index&results=20&seed=abc";
      try {
        (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate = (client) {
          return HttpClient();
        };
        // (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate = (client) {
        //   SecurityContext securityContext = SecurityContext();
        //   securityContext.setTrustedCertificatesBytes(bytes.buffer.asUint8List());
        //   return HttpClient(context: securityContext);
        // };
        // (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate = (client) {
        //   SecurityContext securityContext = SecurityContext.defaultContext;
        //   return HttpClient(context: securityContext)..badCertificateCallback = (X509Certificate cert, String host, int port) {
        //     debugPrint('masih adalah ${cert.toString()}');
        //     return false;
        //   }; // Ensure invalid certificates are rejected
        // };
        print('here');
        final response = await dio.get(url);
        print('get the data');
        // if (response. != null) {
        //   print('get the data');
        //   if (page == 0) {
        //     tList.clear();
        //     users.clear();
        //     for (int i = 0; i < response.data['results'].length; i++) {
        //       tList.add(response.data['results'][i]);
        //     }
        //     isLoading = false;
        //     users.addAll(tList);
        //     page++;
        //     update();
        //   } else {
        //     for (int i = 0; i < response.data['results'].length; i++) {
        //       tList.add(response.data['results'][i]);
        //     }
        //     isLoading = false;
        //     users.addAll(tList);
        //     page++;
        //     update();
        //   }

        //   //Get.off(const ContohScreenDua());
        // }
      } catch (e) {
        print('error $e');
      }
    }
  }

  navigate() {
    Get.off(ContohScreenDua());
  }

  Future<void> refreshData() async {
    page = 0;
    update();
    print('dsini : $page');
    await _getMoreData(page);
  }

  _getMoreData2() {
    if (!isLoading) {
      isLoading = true;
      isAllDataLoaded = false;
      update();
      Future.delayed(const Duration(seconds: 5), () {
        try {
          debugPrint('jumlah 1 : ${halaman * perHalaman}');
          debugPrint('jumlah 2 : ${(halaman * perHalaman) + perHalaman}');
          if (dataToShow.length <= _data.length) {
            dataPerpage = _data.sublist((halaman * perHalaman), ((halaman * perHalaman) + perHalaman)); // extract a list of items to show on per page basis
            dataToShow.addAll(dataPerpage);
            halaman += 1;
            isLoading = false;
            update();
          }
          halaman += 1;
        } catch (e) {
          isAllDataLoaded = true;
          isLoading = false;
          update();
          debugPrint('Data sudah ter-load semua');
        }
      });
    }
  }

  _getMoreData3() {
    if (!isLoading) {
      isLoading = true;
      isAllDataLoaded = false;
      update();
      Future.delayed(const Duration(seconds: 5), () {
        try {
          objectPerPage = objectCard.sublist((halaman * perHalaman), ((halaman * perHalaman) + perHalaman));
          objectToSHow.addAll(objectPerPage);
          halaman += 1;
          isLoading = false;
          update();
        } catch (e) {
          isAllDataLoaded = true;
          isLoading = false;
          update();
          debugPrint('Data sudah ter-load semua');
        }
      });
    }
  }

  Future _getMoreData4() async {
    print('first from api');
    if (!isLoading) {
      isLoading = true;
      update();
      var url = "https://randomuser.me/api/?page=0&results=20&seed=abc";
      try {
        final response = await dio.get(url);
        print('first from api');
        if (response.data != null) {
          for (int i = 0; i < response.data['results'].length; i++) {
            tList.add(response.data['results'][i]);
          }
          if (users.isEmpty) {
            users.addAll(tList);
          }
          isLoading = false;
          update();
        }
      } catch (e) {
        isLoading = false;
        print(e);
        error = e.toString();
      }
    }
  }

  voidLanjutanGetMoreData4() {
    print('then to this');
    if (!isLoading) {
      isLoading = true;
      isAllDataLoaded = false;
      update();
      Future.delayed(const Duration(seconds: 3), () {
        try {
          if (users.length >= perHalaman) {
            userPerPage = users.sublist((halaman * perHalaman), ((halaman * perHalaman) + perHalaman));
            userToShow.addAll(userPerPage);
            halaman += 1;
          } else {
            if (userToShow.isEmpty) {
              userToShow.addAll(users);
            } else {
              isAllDataLoaded = true;
            }
          }
          isLoading = false;
          update();
        } catch (e) {
          isAllDataLoaded = true;
          isLoading = false;
          update();
          debugPrint('Data sudah ter-load semua');
        }
      });
    }
  }

  getImages() async {
    try {
      var response = await dio.get('https://picsum.photos/200');
      print(response.data.runtimeType);
    } catch (e) {}
  }
}

class TheObject {
  late String nama;
  late String alamat;

  TheObject({required this.nama, required this.alamat});
}
