import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TryWorkerController extends GetxController {
  final count = 0.obs;
  Worker? worker;
  var selectedValue = 'USA'.obs;

  get action => false;

  void onInit() {
    worker = ever(count, (value) {
      print('counter changed to: $value');
      if (value == 10) worker!.dispose();
    }, condition: () => count > 5);
  }

  void increment() => count + 1;

  List<DropdownMenuItem<String>> get dropdownItems {
    const List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("USA"), value: "USA"),
      DropdownMenuItem(child: Text("Canada"), value: "Canada"),
      DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
      DropdownMenuItem(child: Text("England"), value: "England"),
    ];
    return menuItems;
  }
}
