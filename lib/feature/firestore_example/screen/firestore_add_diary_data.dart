import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FirestoreAddDataDiary extends StatefulWidget {
  const FirestoreAddDataDiary({super.key});

  @override
  State<FirestoreAddDataDiary> createState() => _FirestoreAddDataDiaryState();
}

class _FirestoreAddDataDiaryState extends State<FirestoreAddDataDiary> {
  var date = Get.arguments;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            CustomTextfieldWidget(label: 'Title', controller: _titleController),
            const SizedBox(height: 10),
            CustomTextfieldWidget(label: 'Message', controller: _messageController),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () {
                  print(_titleController.text);
                  print(_messageController.text);
                  print(date);
                },
                child: const Text('Save'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomTextfieldWidget extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  const CustomTextfieldWidget({super.key, required this.label, this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 5.0),
          child: Text(label, style: TextStyle(fontSize: 16)),
        ),
        TextField(
          controller: controller,
          maxLines: null,
          decoration: InputDecoration(
            hintText: 'Enter text here',
            contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Colors.grey, // You can adjust the border color
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.grey, // Border color when not focused
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Colors.blue, // Border color when focused
              ),
            ),
          ),
        ),
      ],
    );
  }
}
