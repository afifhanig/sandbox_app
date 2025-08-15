import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ContohScreenDua extends StatefulWidget {
  const ContohScreenDua({super.key});

  @override
  State<ContohScreenDua> createState() => _ContohScreenDuaState();
}

class _ContohScreenDuaState extends State<ContohScreenDua> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('Back'))
          ],
        ),
      ),
    );
  }
}
