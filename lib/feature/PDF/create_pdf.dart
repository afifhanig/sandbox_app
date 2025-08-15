// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:path_provider/path_provider.dart';
// import 'package:get/get.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:sandbox_flutter_3/feature/PDF/open_pdf.dart';

// class CreatePdfFile extends StatefulWidget {
//   const CreatePdfFile({super.key});

//   @override
//   State<CreatePdfFile> createState() => _CreatePdfFileState();
// }

// class _CreatePdfFileState extends State<CreatePdfFile> {
//   // late File file;
//   String error = 'error';
//   String thePath = '';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Center(
//             child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text('Create PDF Page'),
//             ElevatedButton(
//               onPressed: () {
//                 debugPrint('tertambah');
//                 save();
//                 //getPdf();
//               },
//               child: const Text('PDF Download'),
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 Get.to(OpenPdfFile(filePath: thePath));
//               },
//               child: const Text('Open File'),
//             ),
//             Text(error),
//             Text(thePath),
//           ],
//         )),
//       ),
//     );
//   }

//   getPdf() async {
//     final bytes = await rootBundle.load('assets/images/test_pdf.pdf');
//     final list = bytes.buffer.asUint8List();
//     print(list);

//     final tempDir = await getTemporaryDirectory();
//     final file = await File('${tempDir.path}/pdf1.pdf').create();
//     file.writeAsBytesSync(list);
//     setState(() {
//       thePath = file.path;
//     });
//   }

//   save() async {
//     final pdf = pw.Document();
//     Directory? directory;
//     try {
//       // debugPrint('disini');
//       // pdf.addPage(
//       //   pw.Page(build: (pw.Context context) {
//       //     return pw.Column(
//       //       mainAxisAlignment: pw.MainAxisAlignment.start,
//       //       children: [
//       //         // pw.Align(
//       //         //   alignment: pw.Alignment.topLeft,
//       //         //   child: pw.Text('Hello World! Dunia!!!'),
//       //         // ),
//       //         pw.Text('Hello World! Dunia!!!'),
//       //         pw.Text('The PDF '),
//       //       ],
//       //     );
//       //   }),
//       // );
//       // debugPrint('disina');
//       // final output = await getApplicationDocumentsDirectory();
//       // final another = await getExternalStorageDirectory();
//       // file = File("${output.path}/example.pdf");
//       // await file.writeAsBytes(await pdf.save());
//       // setState(() {
//       //   thePath = file.path;
//       // });
//       // debugPrint(file.path);
//       // debugPrint(another.toString());
//       final bytes = await rootBundle.load('assets/images/test_pdf.pdf');
//       final list = bytes.buffer.asUint8List();
//       print(list);

//       if (Platform.isAndroid) {
//         if (await _requestPermission(Permission.storage)) {
//           directory = await getExternalStorageDirectory();
//           String newPath = "";
//           print(directory);
//           List<String> paths = directory!.path.split("/");
//           for (int x = 1; x < paths.length; x++) {
//             String folder = paths[x];
//             if (folder != "Android") {
//               newPath += "/" + folder;
//             } else {
//               break;
//             }
//           }
//           print(newPath);
//           newPath = newPath + "/DCIM/SandboxApp";
//           directory = Directory(newPath);
//           print(directory);
//         } else {
//           return false;
//         }
//       } else {
//         if (await _requestPermission(Permission.photos)) {
//           directory = await getTemporaryDirectory();
//         } else {
//           return false;
//         }
//       }

//       if (!await directory.exists()) {
//         await directory.create(recursive: true);
//       }
//       if (await directory.exists()) {
//         final x = await File('${directory.path}/pdf1.pdf').create();
//         x.writeAsBytes(list);
//         // File saveFile = File(directory.path + "/image.jpg");
//         // await saveFile.writeAsBytes(list /*await pdf.save()*/);
//         setState(() {
//           thePath = x.path;
//         });
//       }
//     } catch (e) {
//       debugPrint('newak');
//       setState(() {
//         error = e.toString();
//       });
//       //debugPrint(e.toString());
//     }
//   }

//   Future<bool> _requestPermission(Permission permission) async {
//     if (await permission.isGranted) {
//       return true;
//     } else {
//       var result = await permission.request();
//       if (result == PermissionStatus.granted) {
//         return true;
//       }
//     }
//     return false;
//   }
// }
