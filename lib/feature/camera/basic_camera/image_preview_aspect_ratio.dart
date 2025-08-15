import 'dart:io';
import 'dart:math';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;

var checkSize = Size.zero;

class ImagePreviewAspectRatio extends StatefulWidget {
  const ImagePreviewAspectRatio({Key? key, required this.picture, required this.borderSize, required this.borderOffset})
      : super(key: key);

  final XFile picture;
  final Size borderSize;
  final Offset borderOffset;

  @override
  State<ImagePreviewAspectRatio> createState() => _ImagePreviewAspectRatioState();
}

class _ImagePreviewAspectRatioState extends State<ImagePreviewAspectRatio> {
  File? gambar;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //croppingAnImage(widget.picture);
  }

  Future<File> croppingAnImage(XFile images) async {
    var decodedImage = await decodeImageFromList(File(images.path).readAsBytesSync());
    print(decodedImage.width);
    print(decodedImage.height);

    var cropSize = min(decodedImage.width, decodedImage.height);
    int offsetX = (decodedImage.width - min(decodedImage.width, decodedImage.height)) ~/ 2;
    int offsetY = (decodedImage.height - min(decodedImage.width, decodedImage.height)) ~/ 2;

    print(offsetX);
    print(offsetY);

    final imageBytes =
        img.decodeImage(File(images.path).readAsBytesSync())!; //decodedImage(File(images.path).readAsBytesSync())!;

    img.Image cropOne = img.copyCrop(
      imageBytes,
      x: offsetX,
      y: offsetY,
      width: cropSize,
      height: cropSize,
    );
    // x: widget.borderOffset.dx.toInt(),
    // y: widget.borderOffset.dy.toInt(),
    // width: widget.borderSize.width.toInt(),
    // height: widget.borderSize.height.toInt());
    print(cropOne.height);
    print(cropOne.width);

    return File(images.path).writeAsBytes(img.encodePng(cropOne));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //extendBodyBehindAppBar: true,
        //appBar: AppBar(title: const Text('Preview Page')),
        body: SingleChildScrollView(
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Image.file(File(widget.picture.path), fit: BoxFit.cover, width: double.infinity),
              gambar != null
                  ? Image.file(File(gambar!.path), fit: BoxFit.cover, width: double.infinity)
                  : const Text('no pic to display'),
              ElevatedButton(
                onPressed: () async {
                  var x = await croppingAnImage(widget.picture);
                  setState(() {
                    gambar = x;
                  });
                  print(widget.borderOffset.dy);
                  print(widget.borderOffset.dx);
                  print(widget.borderSize.height);
                  print(widget.borderSize.width);
                },
                child: const Text('crop'),
              ),
              //Image.file(File(widget.picture.path), fit: BoxFit.cover, width: double.infinity),
              // Align(
              //   alignment: Alignment.center,
              //   child: Image.file(File(picture.path), fit: BoxFit.cover, width: double.infinity),
              //   // AspectRatio(
              //   //   aspectRatio: borderSize.width / borderSize.height,
              //   //   child: Image.file(
              //   //     File(picture.path),
              //   //     fit: BoxFit.cover,
              //   //   ),
              //   // ),
              // ),
              //ktpOverlay(context, picture)
              // Align(
              //   alignment: Alignment.center,
              //   child: ktpOverlay(context, widget.picture),
              // ),
              //Image.file(File(picture.path), fit: BoxFit.cover, width: double.infinity),
              // const SizedBox(height: 24),
              // Text(picture.name),
              // ElevatedButton(
              //     onPressed: () {
              //       print(borderSize.width);
              //       print(borderSize.height);
              //     },
              //     child: const Text('Size'))
            ],
          ),
        ),
      ),
    );
  }

  Widget ktpOverlay(BuildContext context, XFile pic) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3.7,
      width: MediaQuery.of(context).size.height / 2.3,
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: Colors.grey.shade300,
            width: 4,
          ),
        ),
      ),
    );
  }
}
