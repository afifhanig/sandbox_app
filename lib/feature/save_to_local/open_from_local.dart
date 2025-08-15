import 'dart:io';

import 'package:flutter/material.dart';

class OpenFromLocal extends StatefulWidget {
  final String imagePath;
  const OpenFromLocal({super.key, required this.imagePath});

  @override
  State<OpenFromLocal> createState() => _OpenFromLocalState();
}

class _OpenFromLocalState extends State<OpenFromLocal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Open From Local'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Image.file(
              File(widget.imagePath),
            ),
            const SizedBox(height: 10),
            Text(widget.imagePath),
          ],
        ),
      ),
    );
  }
}
