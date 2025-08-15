import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandbox_flutter_3/feature/camera/basic_camera/basic_camera.dart';
import 'package:sandbox_flutter_3/feature/camera/basic_camera/basic_camera_with_aspect_ratio.dart';
import 'package:sandbox_flutter_3/feature/camera/edge_detector_plus_ocr/edge_detector_ocr.dart';
import 'package:sandbox_flutter_3/feature/camera/mobile_vision_ocr/mobile_vision_ocr.dart';
import 'package:sandbox_flutter_3/feature/other/crop_image/testing_offset.dart';

class MainHomeExploreCamera extends StatefulWidget {
  const MainHomeExploreCamera({super.key});

  @override
  State<MainHomeExploreCamera> createState() => _MainHomeExploreCameraState();
}

class _MainHomeExploreCameraState extends State<MainHomeExploreCamera> {
  late List<CameraDescription> cameras;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      cameras = await availableCameras();
    });
  }

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
                  Get.to(BasicCamera(
                    cameras: cameras,
                  ));
                },
                child: const Card(
                  elevation: 10,
                  child: Align(alignment: Alignment.center, child: Text('Basic Camera')),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(BasicCameraWithAspectRatio(
                    cameras: cameras,
                  ));
                },
                child: const Card(
                  elevation: 10,
                  child: Align(alignment: Alignment.center, child: Text('Basic Camera w/ Aspect Ratio')),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(const EdgeDetectorOCR());
                },
                child: Card(
                  color: Colors.green[100],
                  elevation: 10,
                  child: Align(alignment: Alignment.center, child: Text('Edge Detector OCR')),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(const MobileVisionPackage());
                },
                child: const Card(
                  elevation: 10,
                  child: Align(alignment: Alignment.center, child: Text('Mobile Vision Package')),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(const TestingOffset());
                },
                child: const Card(
                  elevation: 10,
                  child: Align(alignment: Alignment.center, child: Text('Offset Overlay Border Test')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
