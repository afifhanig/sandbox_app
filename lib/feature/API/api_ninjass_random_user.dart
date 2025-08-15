import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sandbox_flutter_3/controller/another_controller.dart';

class ApiNinjasRandomUser extends StatefulWidget {
  const ApiNinjasRandomUser({super.key});

  @override
  State<ApiNinjasRandomUser> createState() => _ApiNinjasRandomUserState();
}

class _ApiNinjasRandomUserState extends State<ApiNinjasRandomUser> {
  late AnotherController _anotherController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _anotherController = Get.put(AnotherController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Ninjas Random User'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _anotherController.ambilData();
          },
          child: const Text('Ambil Data'),
        ),
      ),
    );
  }
}
