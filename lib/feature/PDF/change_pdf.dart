// import 'dart:async';
// import 'dart:io';

// import 'package:camera/camera.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'package:photo_view/photo_view.dart';
// import 'package:path/path.dart' as path;

// class UploadSertifikatEksternal extends StatefulWidget {
//   const UploadSertifikatEksternal({Key? key}) : super(key: key);

//   @override
//   State<UploadSertifikatEksternal> createState() => _UploadSertifikatEksternalState();
// }

// class _UploadSertifikatEksternalState extends State<UploadSertifikatEksternal> {
//   XFile? imageFile;
//   //PdfDocument? pdfDocument;
//   final Completer<PDFViewController> _controller = Completer<PDFViewController>();
//   String pdfPath = '';
//   String pilihan = 'pdf';
//   TextEditingController textEditingController = TextEditingController();
//   bool? isPass; // Initialize as null to have neither option selected initially
//   String? dropdownValue;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();

//     textEditingController.addListener(() {
//       setState(() {
//         //isPass = textEditingController.text.isNotEmpty && textEditingController.text.length >= 1;
//         if (textEditingController.text.isNotEmpty && textEditingController.text.length >= 1) {
//           // isPass = null;
//           dropdownValue = null;
//         } else {
//           // isPass = false;
//           dropdownValue = "Not Pass";
//         }
//       });
//     });

//     if (pilihan != 'pdf') {
//       //imageSelector(context, pilihan);
//     } else {
//       // pdfPath = '';
//       //_selectPdfFile();
//     }
//   }

//   Future<void> _selectPdfFile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['pdf'],
//     );
//     if (result != null) {
//       setState(() {
//         pdfPath = result.files.first.path!;
//       });
//       // PlatformFile file = result.files.first;
//       // try {
//       //   final selectedPdfPath = file.path;
//       //   if (selectedPdfPath != null) {
//       //     print("Selected PDF Path: $selectedPdfPath"); // Add this line for debugging
//       //     setState(() {
//       //       pdfPath = selectedPdfPath;
//       //     });
//       //   }
//       // } catch (e) {
//       //   print("Error opening PDF: $e");
//       // }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Change PDF'),
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             children: [
//               Container(
//                 margin: EdgeInsets.all(20),
//                 // width: 400,
//                 height: 300,
//                 decoration: BoxDecoration(boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.5),
//                     spreadRadius: 5,
//                     blurRadius: 7,
//                     offset: Offset(0, 3), // changes position of shadow
//                   ),
//                 ], borderRadius: BorderRadius.all(Radius.circular(20))),
//                 clipBehavior: Clip.hardEdge,
//                 child: (pdfPath.isNotEmpty)
//                     ? SizedBox(
//                         height: 200,
//                         child: PDFView(
//                           enableSwipe: true,
//                           swipeHorizontal: true,
//                           autoSpacing: false,
//                           pageFling: true,
//                           pageSnap: true,
//                           fitPolicy: FitPolicy.BOTH,
//                           filePath: pdfPath, // Set the filePath property to the selected PDF path
//                           onRender: (pages) {
//                             print('satudua');
//                             // When the PDF is rendered, you can use the pdfController here.
//                           },
//                           onViewCreated: (PDFViewController controller) {
//                             _controller.complete(controller);
//                           },
//                           onPageChanged: (page, total) {
//                             print('object $page');
//                           },
//                         ),
//                       )
//                     : (imageFile != null)
//                         ? InteractiveViewer(
//                             child: PhotoView(
//                             imageProvider: FileImage(
//                               File(imageFile!.path),
//                             ),
//                           ))
//                         : Image.asset(
//                             "assets/revamp/no_photo_available.jpg",
//                             fit: BoxFit.fill,
//                           ),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               (imageFile != null)
//                   ? Center(
//                       child: Text(
//                         path.basename(imageFile!.path),
//                         textAlign: TextAlign.center,
//                       ),
//                     )
//                   : Container(),
//               (pdfPath != null)
//                   ? Center(
//                       child: Text(
//                         'pdf name : $pdfPath',
//                         textAlign: TextAlign.center,
//                       ),
//                     )
//                   : Container(),
//               SizedBox(
//                 height: 13,
//               ),
//               SizedBox(
//                 height: 13,
//               ),
//               Container(
//                 child: Column(
//                   children: [
//                     Text(
//                       '* optional',
//                       style: TextStyle(
//                         color: Colors.grey, // You can customize the color
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//                       child: TextField(
//                         controller: textEditingController,
//                         keyboardType: TextInputType.number,
//                         inputFormatters: <TextInputFormatter>[
//                           FilteringTextInputFormatter.digitsOnly,
//                         ],
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(),
//                           hintText: 'Enter your test result in number',
//                         ),
//                       ),
//                     ),
//                     Visibility(
//                       visible: textEditingController.text.length >= 1,
//                       child: Column(
//                         children: [
//                           Text(
//                             "Are you pass the test?",
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           SizedBox(height: 10),
//                           // Row(
//                           //   mainAxisAlignment: MainAxisAlignment.center,
//                           //   children: [
//                           //     Row(
//                           //       children: [
//                           //         Radio(
//                           //           value: true, // Pass
//                           //           groupValue: isPass,
//                           //           onChanged: (value) {
//                           //             setState(() {
//                           //               isPass = value!;
//                           //             });
//                           //           },
//                           //         ),
//                           //         Text("Pass")
//                           //       ],
//                           //     ),
//                           //     Row(
//                           //       children: [
//                           //         Radio(
//                           //           value: false, // Not Pass
//                           //           groupValue: isPass,
//                           //           onChanged: (value) {
//                           //             setState(() {
//                           //               isPass = value!;
//                           //             });
//                           //           },
//                           //         ),
//                           //         Text("Not Pass")
//                           //       ],
//                           //     )
//                           //   ],
//                           // ),

//                           DropdownButtonFormField<String>(
//                             value: dropdownValue,
//                             onChanged: (String? newValue) {
//                               setState(() {
//                                 dropdownValue = newValue;
//                               });
//                             },
//                             items: <String?>[null, 'Pass', 'Not Pass'].map<DropdownMenuItem<String>>((String? value) {
//                               return DropdownMenuItem<String>(
//                                 value: value,
//                                 child: Text(value ?? 'Please choose'),
//                               );
//                             }).toList(),
//                             decoration: InputDecoration(
//                               labelText: 'Select an option', // Label for the dropdown
//                               border: OutlineInputBorder(),
//                               hintText: 'Please choose', // Hint text
//                             ),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       (pilihan == 'pdf')
//                           ? Container(
//                               width: 300,
//                               padding: EdgeInsets.all(15),
//                               decoration: BoxDecoration(
//                                   color: Colors.red.shade100,
//                                   border: Border.all(
//                                     color: Colors.red,
//                                   ),
//                                   borderRadius: BorderRadius.all(Radius.circular(20))),
//                               child: Text(
//                                 "Pastikan file anda terlihat dengan jelas sebelum anda submit",
//                                 style: TextStyle(color: Colors.red),
//                                 textAlign: TextAlign.center,
//                               ),
//                             )
//                           : (pilihan == 'camera')
//                               ? Container(
//                                   width: 300,
//                                   padding: EdgeInsets.all(15),
//                                   decoration: BoxDecoration(
//                                       color: Colors.red.shade100,
//                                       border: Border.all(
//                                         color: Colors.red,
//                                       ),
//                                       borderRadius: BorderRadius.all(Radius.circular(20))),
//                                   child: Text(
//                                     "Pastikan wajah anda terlihat dengan jelas di foto yang akan anda submit",
//                                     style: TextStyle(color: Colors.red),
//                                     textAlign: TextAlign.center,
//                                   ),
//                                 )
//                               : Container(
//                                   width: 300,
//                                   padding: EdgeInsets.all(15),
//                                   decoration: BoxDecoration(
//                                       color: Colors.red.shade100,
//                                       border: Border.all(
//                                         color: Colors.red,
//                                       ),
//                                       borderRadius: BorderRadius.all(Radius.circular(20))),
//                                   child: Text(
//                                     "Pastikan gambar anda terlihat dengan jelas sebelum anda submit",
//                                     style: TextStyle(color: Colors.red),
//                                     textAlign: TextAlign.center,
//                                   ),
//                                 ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       (pilihan == 'pdf')
//                           ? Column(
//                               children: [
//                                 Container(
//                                   width: 300,
//                                   child: ElevatedButton(
//                                     child: const Text(
//                                       'Change PDF',
//                                       style: TextStyle(color: Colors.red),
//                                     ),
//                                     style: ElevatedButton.styleFrom(
//                                       foregroundColor: const Color(0xFFFFFFFF),
//                                       backgroundColor: Colors.white,
//                                       minimumSize: const Size(0, 45),
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(8),
//                                         side: BorderSide(color: Colors.red),
//                                       ),
//                                     ),
//                                     onPressed: () {
//                                       _selectPdfFile();
//                                       // Navigator.pop(context);
//                                     },
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 15,
//                                 ),
//                               ],
//                             )
//                           : (pilihan == 'camera')
//                               ? Column(
//                                   children: [
//                                     Container(
//                                       width: 300,
//                                       child: ElevatedButton(
//                                         child: const Text(
//                                           'Retake',
//                                           style: TextStyle(color: Colors.red),
//                                         ),
//                                         style: ElevatedButton.styleFrom(
//                                           foregroundColor: const Color(0xFFFFFFFF),
//                                           backgroundColor: Colors.white,
//                                           minimumSize: const Size(0, 45),
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius: BorderRadius.circular(8),
//                                             side: BorderSide(color: Colors.red),
//                                           ),
//                                         ),
//                                         onPressed: () {
//                                           //imageSelector(context, pilihan);
//                                           // Navigator.pop(context);
//                                         },
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 15,
//                                     ),
//                                   ],
//                                 )
//                               : Column(
//                                   children: [
//                                     Container(
//                                       width: 300,
//                                       child: ElevatedButton(
//                                         child: const Text(
//                                           'Change Image',
//                                           style: TextStyle(color: Colors.red),
//                                         ),
//                                         style: ElevatedButton.styleFrom(
//                                           foregroundColor: const Color(0xFFFFFFFF),
//                                           backgroundColor: Colors.white,
//                                           minimumSize: const Size(0, 45),
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius: BorderRadius.circular(8),
//                                             side: BorderSide(color: Colors.red),
//                                           ),
//                                         ),
//                                         onPressed: () {
//                                           //imageSelector(context, pilihan);
//                                           // Navigator.pop(context);
//                                         },
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 15,
//                                     ),
//                                   ],
//                                 ),
//                       Container(
//                         width: 300,
//                         child: ElevatedButton(
//                             onPressed: () {
//                               //Get.to(SuksesUploadTestResult());
//                               print(pdfPath);
//                               setState(() {});
//                             },
//                             style: ElevatedButton.styleFrom(
//                               foregroundColor: const Color(0xFFFFFFFF),
//                               backgroundColor: Colors.red,
//                               minimumSize: const Size(0, 45),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                                 side: BorderSide(color: Colors.red),
//                               ),
//                             ),
//                             child: const Text('Submit')),
//                       )
//                     ],
//                   )),
//               SizedBox(height: 10)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
