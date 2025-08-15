import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandbox_flutter_3/feature/image_mapping/painter_draw/try_painter_draw_1.dart';
import 'package:sandbox_flutter_3/feature/image_mapping/painter_draw/try_painter_draw_2.dart';
import 'package:sandbox_flutter_3/feature/image_mapping/painter_draw/try_painter_draw_3.dart';
import 'package:sandbox_flutter_3/feature/image_mapping/painter_draw/try_painter_draw_4.dart';

class MainImageMappingScreen extends StatefulWidget {
  const MainImageMappingScreen({super.key});

  @override
  State<MainImageMappingScreen> createState() => _MainImageMappingScreenState();
}

class _MainImageMappingScreenState extends State<MainImageMappingScreen> {
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
                  Get.to(TryPainterDrawOne());
                },
                child: const Card(
                  elevation: 10,
                  child: Align(alignment: Alignment.center, child: Text('TryPainter 1')),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(TryPainterDrawTwo());
                },
                child: const Card(
                  elevation: 10,
                  child: Align(alignment: Alignment.center, child: Text('TryPainter 2')),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(TryPainterDrawThird());
                },
                child: Card(
                  //color: Colors.green[100],
                  elevation: 10,
                  child: Align(alignment: Alignment.center, child: Text('TryPainter 3')),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(TryPainterDrawFour());
                },
                child: Card(
                  //color: Colors.green[100],
                  elevation: 10,
                  child: Align(alignment: Alignment.center, child: Text('TryPainter 4')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
