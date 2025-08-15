import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:get/get.dart';
import 'package:sandbox_flutter_3/controller/app_controller.dart';
import 'package:sandbox_flutter_3/feature/save_to_local/open_from_local.dart';
import 'package:shimmer/shimmer.dart';

class SaveToLocal extends StatefulWidget {
  const SaveToLocal({super.key});

  @override
  State<SaveToLocal> createState() => _SaveToLocalState();
}

class _SaveToLocalState extends State<SaveToLocal> {
  String saveFileDir = 'saved file directory';
  String errorNotif = 'error';
  final AppController _appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Save to Local'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Image.network(
              'https://picsum.photos/200',
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Shimmer.fromColors(
                    child: SizedBox(
                      height: 200,
                      width: 200,
                      child: Card(),
                    ),
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.white);
              },
              errorBuilder: (context, error, stackTrace) {
                return SizedBox(
                  height: 200,
                  width: 200,
                  child: Card(
                    child: Center(
                        child: Text(
                      'No Image to Display. Network Error',
                      textAlign: TextAlign.center,
                    )),
                  ),
                );
              },
            ),
            Image.asset('assets/images/city.png'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                save();
              },
              child: const Text('Save the image above'),
            ),
            ElevatedButton(
              onPressed: () {
                _appController.getImages();
              },
              child: const Text('Get Images'),
            ),
            const SizedBox(height: 10),
            Text(saveFileDir),
            saveFileDir != 'saved file directory'
                ? ElevatedButton(
                    onPressed: () {
                      Get.to(OpenFromLocal(imagePath: saveFileDir));
                      //showDialog(false);
                    },
                    child: const Text('Preview File'),
                  )
                : Container(),
            errorNotif != 'error' ? Text(errorNotif) : Container()
          ],
        ),
      ),
    );
  }

  save() async {
    int num = 1;
    try {
      Directory? directory;
      final bytes = await rootBundle.load('assets/images/test_pdf.pdf');
      final list = bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
      print(list);

      if (Platform.isAndroid) {
        if (await _requestPermission(Permission.storage)) {
          directory = await getExternalStorageDirectory();
          String newPath = "";
          print(directory);
          List<String> paths = directory!.path.split("/");
          for (int x = 1; x < paths.length; x++) {
            String folder = paths[x];
            if (folder != "Android") {
              newPath += "/$folder";
            } else {
              break;
            }
          }
          print(newPath);
          newPath = "$newPath/Download/Sandbox App";
          directory = Directory(newPath);
          print(directory);
        } else {
          return false;
        }
      } else {
        if (await _requestPermission(Permission.photos)) {
          directory = await getDownloadsDirectory();
        } else {
          return false;
        }
      }

      if (!await directory!.exists()) {
        await directory.create(recursive: true);
      }
      if (await directory.exists()) {
        if (Platform.isAndroid) {
          File saveFile = File('${directory.path}/savedFile.pdf');
          while (await saveFile.exists()) {
            saveFile = File('${directory.path}/savedFile (${num++}).pdf');
          }
          await saveFile.writeAsBytes(list /*await pdf.save()*/);
          setState(() {
            saveFileDir = saveFile.path;
            errorNotif = 'error';
          });
          showDialog(true);
        } else {
          File saveFile =
              File('${directory.path}/Sandbox App/${(DateTime.now().millisecondsSinceEpoch / 1000).round()}.pdf');
          await saveFile.writeAsBytes(list /*await pdf.save()*/);
          setState(() {
            saveFileDir = saveFile.path;
            errorNotif = 'error';
          });
        }
      }
    } catch (e) {
      setState(() {
        errorNotif = e.toString();
      });
      showDialog(false);
    }
  }

  showDialog(bool isSuccess) {
    Get.dialog(
      AlertDialog(
        icon: Icon(
          isSuccess ? Icons.check_circle_rounded : Icons.close_rounded,
          color: isSuccess ? Colors.green : Colors.red,
        ),
        title: isSuccess ? Text('Success') : Text('Failed'),
      ),
    );
    Future.delayed(const Duration(seconds: 2), () {
      Get.back();
    });
  }

  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    }
    return false;
  }
}
