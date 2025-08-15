import 'dart:async';
import 'dart:io';
import 'package:edge_detection/edge_detection.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:path/path.dart';
//import 'package:flutter_ml_kit_try/result_screen.dart';
//import 'package:image/image.dart' as IMG;

class EdgeDetectorOCR extends StatefulWidget {
  const EdgeDetectorOCR({super.key});
  @override
  EdgeDetectorOCRState createState() => EdgeDetectorOCRState();
}

class EdgeDetectorOCRState extends State<EdgeDetectorOCR> {
  //String _newImage = '';

  String? _imagePath;
  final textRecognizer = TextRecognizer();
  String recogText = '';
  

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    //textRecognizer.close();
    super.dispose();
  }

  Future<void> getImage() async {
    bool isCameraGranted = await Permission.camera.request().isGranted;
    if (!isCameraGranted) {
      isCameraGranted = await Permission.camera.request() == PermissionStatus.granted;
    }

    if (!isCameraGranted) {
      // Have not permission to camera
      return;
    }

// Generate filepath for saving
    String imagePath = join((await getApplicationSupportDirectory()).path,
        "${(DateTime.now().millisecondsSinceEpoch / 1000).round()}.jpeg");

    try {
      //Make sure to await the call to detectEdge.
      bool success = await EdgeDetection.detectEdge(
        imagePath,
        canUseGallery: true,
        androidScanTitle: 'Scanning', // use custom localizations for android
        androidCropTitle: 'Crop',
        androidCropBlackWhiteTitle: 'Black White',
        androidCropReset: 'Reset',
      );
    } catch (e) {
      print(e);
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    //await imageContrastProcessing(imagePath, imagePath);
    setState(() {
      _imagePath = imagePath;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Camera Testing'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: ElevatedButton(
                  onPressed: getImage,
                  child: const Text('Scan'),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Cropped image path:'),
              Padding(
                padding: const EdgeInsets.only(top: 0, left: 0, right: 0),
                child: Text(
                  _imagePath.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              Visibility(
                visible: _imagePath != null,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image.file(
                        File(_imagePath ?? ''),
                      ),
                      //-- Optional --
                      // ElevatedButton(
                      //   onPressed: () {
                      //     _scanImage(context, _imagePath ?? '');
                      //   },
                      //   child: const Text('Scan Image'),
                      // ),
                      // ElevatedButton(
                      //   onPressed: () async {

                      //     await cropSquare(_imagePath!, _imagePath!, false);
                      //     setState(() {});
                      //   },
                      //   child: const Text('Filetered Image'),
                      // ),
                    ],
                  ),
                ),
              ),
              //-- Optional --
              //Text(typeCard(recogText)),
              // recogText.contains('NIK')
              //     ? Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: Text(recogText),
              //       )
              //     : const Text('recognized_text'),
              // _newImage != ''
              //     ? Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: Image.file(File(_newImage)),
              //       )
              //     : const Text('22'),
            ],
          ),
        ),
      ),
    );
  }

  //Optional Feature --Read Text From Picture--
  // Future<void> _scanImage(BuildContext context, String imagePath) async {
  //   if (imagePath == '') return;
  //   final navigator = Navigator.of(context);
  //   try {
  //     //final pictureFile = await _cameraController!.takePicture();
  //     final file = File(imagePath);
  //     final inputImage = InputImage.fromFile(file);
  //     final recognizedText = await textRecognizer.processImage(inputImage);
  //     setState(() {
  //       recogText = recognizedText.text;
  //     });
  //     // await navigator.push(
  //     //   MaterialPageRoute(
  //     //     builder: (BuildContext context) => ResultScreen(text: recognizedText.text),
  //     //   ),
  //     // );
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text('An error occurred when scanning text'),
  //       ),
  //     );
  //   }
  // }

  //Optional Feature -- Increase Image Contrast --
  // Future imageContrastProcessing(String from, String destination) async {
  //   var imgPath = await File(from).readAsBytes();
  //   IMG.Image scr = IMG.decodeImage(imgPath)!;
  //   IMG.Image destImage = IMG.contrast(scr, contrast: 115);
  //   var jpg = IMG.encodeJpg(destImage);
  //   await File(destination).writeAsBytes(jpg);
  // }

  // String typeCard(String recognationText) {
  //   if (recognationText.contains('NIK')) {
  //     return 'KTP';
  //   } else {
  //     return 'Bukan KTP';
  //   }
  // }
}
