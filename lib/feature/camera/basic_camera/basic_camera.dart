// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';

// class CameraDua extends StatefulWidget {
//   const CameraDua({super.key});

//   @override
//   State<CameraDua> createState() => _CameraDuaState();
// }

// class _CameraDuaState extends State<CameraDua> {
//   late CameraController controller;
//   int _pointers = 0;
//   double _currentScale = 1.0;
//   double _baseScale = 1.0;
//   double _minAvailableZoom = 1.0;
//   double _maxAvailableZoom = 1.0;
//   XFile? imageFile;

//   void _logError(String code, String? message) {
//     // ignore: avoid_print
//     print('Error: $code${message == null ? '' : '\nError Message: $message'}');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Camera example'),
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.black,
//                 border: Border.all(
//                   color: controller != null && controller!.value.isRecordingVideo ? Colors.redAccent : Colors.grey,
//                   width: 3.0,
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(1.0),
//                 child: Center(
//                   child: _cameraPreviewWidget(),
//                 ),
//               ),
//             ),
//           ),
//           _captureControlRowWidget(),
//           //_modeControlRowWidget(),
//           Padding(
//             padding: const EdgeInsets.all(5.0),
//             child: Row(
//               children: <Widget>[
//                 _cameraTogglesRowWidget(),
//                 _thumbnailWidget(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _cameraPreviewWidget() {
//     final CameraController? cameraController = controller;

//     if (cameraController == null || !cameraController.value.isInitialized) {
//       return const Text(
//         'Tap a camera',
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 24.0,
//           fontWeight: FontWeight.w900,
//         ),
//       );
//     } else {
//       return Listener(
//         onPointerDown: (_) => _pointers++,
//         onPointerUp: (_) => _pointers--,
//         child: CameraPreview(
//           controller!,
//           child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
//             return GestureDetector(
//               behavior: HitTestBehavior.opaque,
//               onScaleStart: _handleScaleStart,
//               onScaleUpdate: _handleScaleUpdate,
//               onTapDown: (TapDownDetails details) => onViewFinderTap(details, constraints),
//             );
//           }),
//         ),
//       );
//     }
//   }

//   void _handleScaleStart(ScaleStartDetails details) {
//     _baseScale = _currentScale;
//   }

//   Future<void> _handleScaleUpdate(ScaleUpdateDetails details) async {
//     // When there are not exactly two fingers on screen don't scale
//     if (controller == null || _pointers != 2) {
//       return;
//     }

//     _currentScale = (_baseScale * details.scale).clamp(_minAvailableZoom, _maxAvailableZoom);

//     await controller!.setZoomLevel(_currentScale);
//   }

//   Widget _captureControlRowWidget() {
//     final CameraController? cameraController = controller;

//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: <Widget>[
//         IconButton(
//           icon: const Icon(Icons.camera_alt),
//           color: Colors.blue,
//           onPressed: cameraController != null &&
//                   cameraController.value.isInitialized &&
//                   !cameraController.value.isRecordingVideo
//               ? onTakePictureButtonPressed
//               : null,
//         ),
//         // IconButton(
//         //   icon: const Icon(Icons.videocam),
//         //   color: Colors.blue,
//         //   onPressed: cameraController != null &&
//         //           cameraController.value.isInitialized &&
//         //           !cameraController.value.isRecordingVideo
//         //       ? onVideoRecordButtonPressed
//         //       : null,
//         // ),
//         // IconButton(
//         //   icon: cameraController != null && cameraController.value.isRecordingPaused
//         //       ? const Icon(Icons.play_arrow)
//         //       : const Icon(Icons.pause),
//         //   color: Colors.blue,
//         //   onPressed: cameraController != null &&
//         //           cameraController.value.isInitialized &&
//         //           cameraController.value.isRecordingVideo
//         //       ? (cameraController.value.isRecordingPaused)
//         //           ? onResumeButtonPressed
//         //           : onPauseButtonPressed
//         //       : null,
//         // ),
//         // IconButton(
//         //   icon: const Icon(Icons.stop),
//         //   color: Colors.red,
//         //   onPressed: cameraController != null &&
//         //           cameraController.value.isInitialized &&
//         //           cameraController.value.isRecordingVideo
//         //       ? onStopButtonPressed
//         //       : null,
//         // ),
//         // IconButton(
//         //   icon: const Icon(Icons.pause_presentation),
//         //   color: cameraController != null && cameraController.value.isPreviewPaused ? Colors.red : Colors.blue,
//         //   onPressed: cameraController == null ? null : onPausePreviewButtonPressed,
//         // ),
//       ],
//     );
//   }

//   Future<XFile?> takePicture() async {
//     final CameraController? cameraController = controller;
//     if (cameraController == null || !cameraController.value.isInitialized) {
//       showInSnackBar('Error: select a camera first.');
//       return null;
//     }

//     if (cameraController.value.isTakingPicture) {
//       // A capture is already pending, do nothing.
//       return null;
//     }

//     try {
//       final XFile file = await cameraController.takePicture();
//       return file;
//     } on CameraException catch (e) {
//       _showCameraException(e);
//       return null;
//     }
//   }

//   void showInSnackBar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
//   }

//   void _showCameraException(CameraException e) {
//     _logError(e.code, e.description);
//     showInSnackBar('Error: ${e.code}\n${e.description}');
//   }

//   void onTakePictureButtonPressed() {
//     takePicture().then((XFile? file) {
//       if (mounted) {
//         setState(() {
//           imageFile = file;
//           // videoController?.dispose();
//           // videoController = null;
//         });
//         if (file != null) {
//           showInSnackBar('Picture saved to ${file.path}');
//         }
//       }
//     });
//   }

//   void onViewFinderTap(TapDownDetails details, BoxConstraints constraints) {
//     if (controller == null) {
//       return;
//     }

//     final CameraController cameraController = controller!;

//     final Offset offset = Offset(
//       details.localPosition.dx / constraints.maxWidth,
//       details.localPosition.dy / constraints.maxHeight,
//     );
//     cameraController.setExposurePoint(offset);
//     cameraController.setFocusPoint(offset);
//   }

//   Widget _cameraTogglesRowWidget() {
//     final List<Widget> toggles = <Widget>[];

//     void onChanged(CameraDescription? description) {
//       if (description == null) {
//         return;
//       }

//       onNewCameraSelected(description);
//     }

//     if (_cameras.isEmpty) {
//       SchedulerBinding.instance.addPostFrameCallback((_) async {
//         showInSnackBar('No camera found.');
//       });
//       return const Text('None');
//     } else {
//       for (final CameraDescription cameraDescription in _cameras) {
//         toggles.add(
//           SizedBox(
//             width: 90.0,
//             child: RadioListTile<CameraDescription>(
//               title: Icon(getCameraLensIcon(cameraDescription.lensDirection)),
//               groupValue: controller?.description,
//               value: cameraDescription,
//               onChanged:
//                   controller != null && controller!.value.isRecordingVideo
//                       ? null
//                       : onChanged,
//             ),
//           ),
//         );
//       }
//     }

//     return Row(children: toggles);
//   }

//    Future<void> onNewCameraSelected(CameraDescription cameraDescription) async {
//     final CameraController? oldController = controller;
//     if (oldController != null) {
//       // `controller` needs to be set to null before getting disposed,
//       // to avoid a race condition when we use the controller that is being
//       // disposed. This happens when camera permission dialog shows up,
//       // which triggers `didChangeAppLifecycleState`, which disposes and
//       // re-creates the controller.
//       controller = null;
//       await oldController.dispose();
//     }

//     final CameraController cameraController = CameraController(
//       cameraDescription,
//       kIsWeb ? ResolutionPreset.max : ResolutionPreset.medium,
//       enableAudio: enableAudio,
//       imageFormatGroup: ImageFormatGroup.jpeg,
//     );

//     controller = cameraController;

//     // If the controller is updated then update the UI.
//     cameraController.addListener(() {
//       if (mounted) {
//         setState(() {});
//       }
//       if (cameraController.value.hasError) {
//         showInSnackBar(
//             'Camera error ${cameraController.value.errorDescription}');
//       }
//     });

//     try {
//       await cameraController.initialize();
//       await Future.wait(<Future<Object?>>[
//         // The exposure mode is currently not supported on the web.
//         ...!kIsWeb
//             ? <Future<Object?>>[
//                 cameraController.getMinExposureOffset().then(
//                     (double value) => _minAvailableExposureOffset = value),
//                 cameraController
//                     .getMaxExposureOffset()
//                     .then((double value) => _maxAvailableExposureOffset = value)
//               ]
//             : <Future<Object?>>[],
//         cameraController
//             .getMaxZoomLevel()
//             .then((double value) => _maxAvailableZoom = value),
//         cameraController
//             .getMinZoomLevel()
//             .then((double value) => _minAvailableZoom = value),
//       ]);
//     } on CameraException catch (e) {
//       switch (e.code) {
//         case 'CameraAccessDenied':
//           showInSnackBar('You have denied camera access.');
//           break;
//         case 'CameraAccessDeniedWithoutPrompt':
//           // iOS only
//           showInSnackBar('Please go to Settings app to enable camera access.');
//           break;
//         case 'CameraAccessRestricted':
//           // iOS only
//           showInSnackBar('Camera access is restricted.');
//           break;
//         case 'AudioAccessDenied':
//           showInSnackBar('You have denied audio access.');
//           break;
//         case 'AudioAccessDeniedWithoutPrompt':
//           // iOS only
//           showInSnackBar('Please go to Settings app to enable audio access.');
//           break;
//         case 'AudioAccessRestricted':
//           // iOS only
//           showInSnackBar('Audio access is restricted.');
//           break;
//         default:
//           _showCameraException(e);
//           break;
//       }
//     }

//     if (mounted) {
//       setState(() {});
//     }
//   }

// }
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandbox_flutter_3/controller/contoh_controller.dart';
import 'package:sandbox_flutter_3/feature/camera/image_processing/text_recognition.dart';
import 'package:sandbox_flutter_3/feature/other/crop_image/crop_image.dart';
import 'image_preview.dart';
//import 'package:flutter_camera_practice/preview_page.dart';

class BasicCamera extends StatefulWidget {
  const BasicCamera({Key? key, required this.cameras}) : super(key: key);

  final List<CameraDescription>? cameras;

  @override
  State<BasicCamera> createState() => _BasicCameraState();
}

class _BasicCameraState extends State<BasicCamera> {
  late CameraController _cameraController;
  late ContohController _c;
  bool _isRearCameraSelected = true;
  var myChildSize = Size.zero;
  // double x = 1;
  // double y = 0;

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _c = Get.put(ContohController());
    initCamera(widget.cameras![0]);
  }

  Future takePicture() async {
    _c.getData();
    // if (!_cameraController.value.isInitialized) {
    //   return null;
    // }
    // if (_cameraController.value.isTakingPicture) {
    //   return null;
    // }
    // try {
    //   await _cameraController.setFlashMode(FlashMode.off);

    //   XFile picture = await _cameraController.takePicture();
    //   //await ImageProcessor.cropSquare(picture.path, picture.path, false, myChildSize);
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) =>
    //           PreviewPage(
    //         picture: picture,
    //         //theSize: myChildSize,
    //       ),
    //     ),
    //   );
    // } on CameraException catch (e) {
    //   debugPrint('Error occured while taking picture: $e');
    //   return null;
    // }
  }

  Future initCamera(CameraDescription cameraDescription) async {
    _cameraController = CameraController(cameraDescription, ResolutionPreset.high);
    try {
      await _cameraController.initialize().then((_) {
        if (!mounted) return;
        setState(() {});
      });
    } on CameraException catch (e) {
      debugPrint("camera error $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            (_cameraController.value.isInitialized)
                ? CameraPreview(_cameraController)
                : Container(color: Colors.black, child: const Center(child: CircularProgressIndicator())),
            cameraOverlay(padding: 20, aspectRatio: 1.5, color: Color(0x55000000)),
            captureButton(),
          ],
        ),
      ),
    );
    // return AspectRatio(
    //   aspectRatio: _cameraController.value.aspectRatio,
    //   child: Stack(
    //     fit: StackFit.expand,
    //     children: [
    //       CameraPreview(_cameraController),
    //       cameraOverlay(padding: 20, aspectRatio: 1.5, color: Colors.transparent),
    //       Material(color: Colors.transparent, child: captureButton()),
    //     ],
    //   ),
    // );
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
        // MeasureSize(
        //     onChange: (size) {
        //       setState(() {
        //         myChildSize = size;
        //       });
        //     },
        //     child: Container(
        //       margin: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
        //       decoration: BoxDecoration(border: Border.all(color: Colors.cyan)),
        //       child: Text('height : ${myChildSize.height} &&  width : ${myChildSize.width}'),
        //     )),
      ]);
    });
  }

  Widget captureButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.20,
        decoration:
            const BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(24)), color: Colors.black),
        child:
            Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
          // Expanded(
          //     child: IconButton(
          //   padding: EdgeInsets.zero,
          //   iconSize: 30,
          //   icon: Icon(_isRearCameraSelected ? CupertinoIcons.switch_camera : CupertinoIcons.switch_camera_solid,
          //       color: Colors.white),
          //   onPressed: () {
          //     setState(() => _isRearCameraSelected = !_isRearCameraSelected);
          //     initCamera(widget.cameras![_isRearCameraSelected ? 0 : 1]);
          //   },
          // )),
          IconButton(
            onPressed: takePicture,
            //     () {
            //   //print('bray ${_cameraController.value.previewSize}');
            //   print(' bray $myChildSize');
            //   print(' bray ${myChildSize.height} dan ${myChildSize.width}');
            // },
            iconSize: 50,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: const Icon(Icons.circle, color: Colors.white),
          ),
          //const Spacer(),
        ]),
      ),
    );
  }
}
