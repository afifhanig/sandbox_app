import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandbox_flutter_3/feature/webview/webview_chatbot.dart';
import 'package:sandbox_flutter_3/feature/webview/webview_dua.dart';


class RumahWebview extends StatefulWidget {
  const RumahWebview({super.key});

  @override
  State<RumahWebview> createState() => _RumahWebviewState();
}

class _RumahWebviewState extends State<RumahWebview> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arjuna main feature'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: GridView.count(
            crossAxisCount: 3,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(WebViewScreen());
                },
                child: const Card(
                  elevation: 10,
                  child: Align(alignment: Alignment.center, child: Text('Webview Chatbot')),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(WebviewDua());
                },
                child: const Card(
                  elevation: 10,
                  child: Align(alignment: Alignment.center, child: Text('Webview Video')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}