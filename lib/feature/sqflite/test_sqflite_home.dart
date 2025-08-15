import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandbox_flutter_3/feature/sqflite/screen/test_sqflite_1.dart';
import 'package:sandbox_flutter_3/feature/sqflite/screen/test_sqflite_2.dart';
import 'package:sandbox_flutter_3/global_component/main_menu_component.dart';

class SqfliteTestHome extends StatefulWidget {
  const SqfliteTestHome({super.key});

  @override
  State<SqfliteTestHome> createState() => _SqfliteTestHomeState();
}

class _SqfliteTestHomeState extends State<SqfliteTestHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQFLite Home Testing'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: GridView.count(
            crossAxisCount: 3,
            children: [
              MainMenuComponent(toDo: () => {Get.to(const SqfliteTest1())}, nameMenu: 'Test SQFLite 1'),
              MainMenuComponent(toDo: () => {Get.to(const SqfliteTest2())}, nameMenu: 'Test SQFLite 2'),
              //MainMenuComponent(toDo: () => {DatabaseDiaryHelper.instance.deleteEntireDatabase()}, nameMenu: 'Delete DB'),
            ],
          ),
        ),
      ),
    );
  }
}
