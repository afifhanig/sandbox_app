import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:sandbox_flutter_3/feature/camera/image_processing/text_recognition.dart';

//import 'package:flutter_camera/measure_size.dart';

// var checkSize = Size.zero;

// class PreviewPage extends StatelessWidget {
//   const PreviewPage({Key? key, required this.picture}) : super(key: key);

//   final XFile picture;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Preview Page')),
//       body: Center(
//         child: Column(mainAxisSize: MainAxisSize.min, children: [
//           MeasureSize(
//               onChange: (size) {}, child: Image.file(File(picture.path), fit: BoxFit.cover, width: double.infinity)),
//           const SizedBox(height: 24),
//           Text(picture.name),
//           ElevatedButton(
//               onPressed: () {
//                 print(checkSize);
//               },
//               child: Text('checkSize'))
//         ]),
//       ),
//     );
//   }
// }

class PreviewPage extends StatefulWidget {
  final XFile picture;
  //final String picture;
  const PreviewPage({super.key, required this.picture});

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  var checkSize = Size.zero;
  final textRecognizer = TextRecognizer();
  String textRecogResult = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textRecognitionFunc();
  }

  textRecognitionFunc() async {
    textRecogResult = await TextRecognition().scanImage(context, widget.picture.path, textRecognizer);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(title: const Text('Preview Page')),
        body: Stack(
          //fit: StackFit.expand,
          children: [
            Image.file(File(widget.picture.path), fit: BoxFit.cover, width: double.infinity),
            // cameraOverlay(padding: 20, aspectRatio: 1.5, color: Colors.white),
            // Positioned(
            //   bottom: 200,
            //   left: 50,
            //   right: 50,
            //   child: Column(
            //     children: [
            //       Text(
            //         widget.picture.name,
            //         textAlign: TextAlign.center,
            //       ),
            //       Text(
            //         textRecogResult.contains('NIK') || textRecogResult.contains('nik') ? 'KTP' : 'type',
            //         textAlign: TextAlign.center,
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
        // SingleChildScrollView(
        //   child: Padding(
        //       padding: EdgeInsets.zero, //EdgeInsets.all(20),
        //       child:
        //       Stack(
        //         children: [
        //           Image.file(File(widget.picture.path), fit: BoxFit.cover, width: double.infinity),
        //           cameraOverlay(padding: 20, aspectRatio: 1.5, color: Colors.grey)
        //         ],
        //       )
        //       // Column(
        //       //   mainAxisSize: MainAxisSize.min,
        //       //   children: [
        //       //     Image.file(File(widget.picture.path), fit: BoxFit.cover, width: double.infinity),
        //       //     // const SizedBox(height: 24),
        //       //     // Text(widget.picture.name),
        //       //     // ElevatedButton(
        //       //     //   onPressed: () {
        //       //     //     print(checkSize.height.toInt());
        //       //     //     print(checkSize.width.toInt());
        //       //     //   },
        //       //     //   child: Text('checkSize'),
        //       //     // ),
        //       //     // MeasureSize(
        //       //     //   onChange: (size) {
        //       //     //     setState(() {
        //       //     //       checkSize = size;
        //       //     //     });
        //       //     //   },
        //       //     //   child: Container(
        //       //     //     height: 411,
        //       //     //     width: 300,
        //       //     //     color: Colors.red,
        //       //     //   ),
        //       //     // )
        //       //   ],
        //       // ),
        //       ),
        // ),
      ),
    );
  }

  Widget cameraOverlay({required double padding, required double aspectRatio, required Color color}) {
    return LayoutBuilder(builder: (context, constraints) {
      double parentAspectRatio = constraints.maxWidth / constraints.maxHeight;
      double horizontalPadding;
      double verticalPadding;

      if (parentAspectRatio < aspectRatio) {
        horizontalPadding = padding;
        verticalPadding = (constraints.maxHeight - ((constraints.maxWidth - 2 * padding) / aspectRatio)) / 2;
      } else {
        verticalPadding = padding;
        horizontalPadding = (constraints.maxWidth - ((constraints.maxHeight - 2 * padding) * aspectRatio)) / 2;
      }
      return Stack(fit: StackFit.expand, children: [
        Align(alignment: Alignment.centerLeft, child: Container(width: horizontalPadding, color: color)),
        Align(alignment: Alignment.centerRight, child: Container(width: horizontalPadding, color: color)),
        Align(
            alignment: Alignment.topCenter,
            child: Container(
                margin: EdgeInsets.only(left: horizontalPadding, right: horizontalPadding),
                height: verticalPadding,
                color: color)),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                margin: EdgeInsets.only(left: horizontalPadding, right: horizontalPadding),
                height: verticalPadding,
                color: color)),
        Container(
          margin: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
          decoration: BoxDecoration(border: Border.all(color: Colors.cyan)),
          //child: Text('height : ${myChildSize.height} &&  width : ${myChildSize.width}'),
        ),
      ]);
    });
  }
}
