import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
//import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:pdfx/pdfx.dart';

class OpenPdfFile extends StatefulWidget {
  //final String filePath = ;
  OpenPdfFile({super.key});

  @override
  State<OpenPdfFile> createState() => _OpenPdfFileState();
}

class _OpenPdfFileState extends State<OpenPdfFile> {
  late PdfController pdfController;
  Uint8List? thePDFlist;
  String assetsPDF = 'assets/images/hr_info_img.pdf';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getPDF();
    pdfController = PdfController(document: PdfDocument.openAsset('assets/images/test_pdf.pdf'));
  }

  Future<Uint8List> getPDF() async {
    final bytes = await rootBundle.load('assets/images/hr_info_img.pdf');
    final list = bytes.buffer.asUint8List();
    setState(() {
      thePDFlist = list;
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF VIEW'),
      ),
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Text(widget.filePath),
            ElevatedButton(
                onPressed: () async {
                  var directory = '/storage/emulated/0/';
                  print(directory);
                  // pdfController.dispose();
                  // pdfController = PdfController(document: PdfDocument.openAsset('assets/images/hr_info_img.pdf'));
                  // final bytes = await rootBundle.load('assets/images/hr_info_img.pdf');
                  // final list = bytes.buffer.asUint8List();
                  // setState(() {
                  //   thePDFlist = list;
                  // });
                  // setState(() {
                  //   assetsPDF = 'assets/images/hr_info_img.pdf';
                  // });
                },
                child: Text('Change PDF')),
            Expanded(
              child: PdfView(
                  onDocumentLoaded: (document) {
                    print('object11 $document');
                  },
                  controller: pdfController
                  // PdfController(
                  //   document: PdfDocument.openAsset(assetsPDF),
                  // ),
                  ),
              // child: PDFView(
              //   filePath: widget.filePath,
              //   enableSwipe: true,
              //   swipeHorizontal: true,
              //   autoSpacing: false,
              //   pageFling: false,
              //   onRender: (_pages) {},
              //   onError: (error) {
              //     debugPrint(error.toString());
              //   },
              //   onPageError: (page, error) {
              //     debugPrint('$page: ${error.toString()}');
              //   },
              //   onViewCreated: (PDFViewController pdfViewController) {
              //     _controller.complete(pdfViewController);
              //   },
              //   onPageChanged: (page, total) {
              //     debugPrint('page change: $page/$total');
              //   },
              // ),
            )
          ],
        ),
      ),
    );
  }
}
