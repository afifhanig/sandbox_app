// import 'dart:io';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:share_plus/share_plus.dart';

// class ShareFiles extends StatefulWidget {
//   const ShareFiles({super.key});

//   @override
//   State<ShareFiles> createState() => _ShareFilesState();
// }

// class _ShareFilesState extends State<ShareFiles> {
//   var imageString = '';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             Container(
//               height: 200,
//               width: 200,
//               decoration: const BoxDecoration(
//                 image: DecorationImage(image: AssetImage('assets/images/city.png')),
//               ),
//             ),
//             ElevatedButton(
//               onPressed: (() async {
//                 final bytes = await rootBundle.load('assets/images/city.png');
//                 final list = bytes.buffer.asUint8List();
//                 print(list);

//                 final tempDir = await getTemporaryDirectory();
//                 final file = await File('${tempDir.path}/image.jpg').create();
//                 file.writeAsBytesSync(list);
//                 setState(() {
//                   imageString = file.path;
//                 });
//               }),
//               child: const Text('Directory'),
//             ),
//             const Divider(
//               thickness: 5,
//               color: Colors.black,
//             ),
//             imageString != ''
//                 ? Column(
//                     children: [
//                       Container(
//                         height: 200,
//                         width: 200,
//                         child: Image.file(
//                           File(imageString),
//                         ),
//                       ),
//                       ElevatedButton(
//                           onPressed: (() async {
//                             print('share file');
//                             await Share.shareXFiles([XFile(imageString)], text: 'City Picture');
//                             // try {} catch (e) {
//                             //   print(e);
//                             // }
//                           }),
//                           child: const Text('Share Images Above'))
//                     ],
//                   )
//                 : Container(),
//           ],
//         ),
//       ),
//     );
//   }
// }
