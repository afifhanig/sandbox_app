import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandbox_flutter_3/controller/contoh_controller.dart';
import 'package:sandbox_flutter_3/feature/conton_screen_2.dart';

class ContohScreen extends StatefulWidget {
  const ContohScreen({super.key});

  @override
  State<ContohScreen> createState() => _ContohScreenState();
}

class _ContohScreenState extends State<ContohScreen> {
  late ContohController _contohController;
  final _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  @override
  void initState() {
    // TODO: implement initState
    _contohController = Get.put(ContohController());
    super.initState();
  }

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar'),
      ),
      body: Obx(
        (() {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_contohController.pesan.value),
                // _contohController.firstList.isNotEmpty
                //     ? Expanded(
                //         child: ListView.builder(
                //           itemCount: _contohController.firstList.length,
                //           itemBuilder: ((context, index) {
                //             return Text(_contohController.firstList[index].questionPage.toString());
                //           }),
                //         ),
                //       )
                //     : Text('Cannot load data 2'),
                ElevatedButton(
                    onPressed: () {
                      //_contohController.nama.value = getRandomString(5);
                      someFuntion();
                    },
                    child: Text('Adaaa'))
              ],
            ),
          );
        }),
      ),
    );
  }

  someFuntion(){
    _contohController.getData();
  }
}
