import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandbox_flutter_3/feature/firestore_example/screen/firestore_example_animal.dart';
import 'package:sandbox_flutter_3/feature/firestore_example/screen/firestore_example_diary.dart';
import 'package:sandbox_flutter_3/global_component/main_menu_component.dart';

class FirestoreMainHome extends StatefulWidget {
  const FirestoreMainHome({super.key});

  @override
  State<FirestoreMainHome> createState() => _FirestoreMainHomeState();
}

class _FirestoreMainHomeState extends State<FirestoreMainHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firestore Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: GridView.count(
            crossAxisCount: 3,
            children: [
              //MainMenuComponent(toDo: () => Get.to(const FirestoreAnimalExample()), nameMenu: 'Firestore Animal'),
              MainMenuComponent(toDo: () => Get.to(const FirestoreDiaryExample()), nameMenu: 'Firestore DIary'),
            ],
          ),
        ),
      ),
    );
  }
}
