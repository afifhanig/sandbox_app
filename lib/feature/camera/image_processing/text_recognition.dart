import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:sandbox_flutter_3/feature/camera/image_processing/text_recog_result.dart';

class TextRecognition {
  Future<String> scanImage(BuildContext context, String imagePath, TextRecognizer textRecognizer) async {
    if (imagePath == '') return '';
    //final navigator = Navigator.of(context);
    try {
      //final pictureFile = await _cameraController!.takePicture();
      final file = File(imagePath);
      final inputImage = InputImage.fromFile(file);
      final recognizedText = await textRecognizer.processImage(inputImage);
      return recognizedText.text;
      // setState(() {
      //   recogText = recognizedText.text;
      // });
      // await navigator.push(
      //   MaterialPageRoute(
      //     builder: (BuildContext context) => ResultScreen(text: recognizedText.text),
      //   ),
      // );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred when scanning text'),
        ),
      );
      return '';
    }
  }
}
