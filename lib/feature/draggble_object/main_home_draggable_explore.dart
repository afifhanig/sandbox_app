import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandbox_flutter_3/controller/another_controller.dart';
import 'package:sandbox_flutter_3/feature/draggble_object/another_draggable.dart';
import 'package:sandbox_flutter_3/feature/draggble_object/another_draggable_two.dart';
import 'package:sandbox_flutter_3/feature/draggble_object/draggable_hide.dart';
import 'package:sandbox_flutter_3/feature/draggble_object/draggable_try.dart';
import 'package:sandbox_flutter_3/feature/draggble_object/new_hiding_icon.dart';

class MainHomeDraggableExplore extends StatefulWidget {
  const MainHomeDraggableExplore({super.key});

  @override
  State<MainHomeDraggableExplore> createState() => _MainHomeDraggableExploreState();
}

class _MainHomeDraggableExploreState extends State<MainHomeDraggableExplore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arjuna main feature'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: GridView.count(
            crossAxisCount: 3,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(DraggableApp());
                },
                child: const Card(
                  elevation: 10,
                  child: Align(alignment: Alignment.center, child: Text('Draggable def')),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(DraggableHide());
                },
                child: const Card(
                  elevation: 10,
                  child: Align(alignment: Alignment.center, child: Text('Draggable Hide')),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(AnotherDraggableScreen());
                },
                child: Card(
                  color: Colors.green[100],
                  elevation: 10,
                  child: Align(alignment: Alignment.center, child: Text('Fixed Draggable')),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(AnotherDraggableDua());
                },
                child: const Card(
                  elevation: 10,
                  child: Align(alignment: Alignment.center, child: Text('Another Draggable')),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(NewHidingIcon());
                },
                child: const Card(
                  elevation: 10,
                  child: Align(alignment: Alignment.center, child: Text('New Hiding Icon')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
