import 'dart:async';
import 'dart:io';
import 'package:image/image.dart' as IMG;

class ImageFilter {
  Future imageContrastProcessing(String from, String destination) async {
    var imgPath = await File(from).readAsBytes();
    IMG.Image scr = IMG.decodeImage(imgPath)!;
    IMG.Image destImage = IMG.contrast(scr, contrast: 115);
    var jpg = IMG.encodeJpg(destImage);
    await File(destination).writeAsBytes(jpg);
  }
}
