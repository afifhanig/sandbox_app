import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sandbox_flutter_3/feature/sqflite/controller/sqflite_controller.dart';
import 'package:sandbox_flutter_3/feature/sqflite/model/diary_data_model.dart';
import 'package:sandbox_flutter_3/feature/sqflite/screen/test_sqflite_2.dart';

class AddDiaryData extends StatefulWidget {
  const AddDiaryData({super.key});

  @override
  State<AddDiaryData> createState() => _AddDiaryDataState();
}

class _AddDiaryDataState extends State<AddDiaryData> {
  var controller = Get.find<SQFLiteContoller>();
  List<DiaryDataModel> diaryData = Get.arguments ?? [];
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  String? _titleErrorMessage;
  String? _messageErrorMessage;

  @override
  void initState() {
    if (diaryData.isNotEmpty) {
      _titleController.text = diaryData[0].title;
      _messageController.text = diaryData[0].message;
    }
    super.initState();
  }

  void _validateAndSubmit() async {
    bool isValid = true;

    setState(() {
      if (_titleController.text.trim().isEmpty) {
        _titleErrorMessage = 'Title cannot be empty!';
        isValid = false;
      } else {
        _titleErrorMessage = null;
      }

      if (_messageController.text.trim().isEmpty) {
        _messageErrorMessage = 'Message cannot be empty!';
        isValid = false;
      } else {
        _messageErrorMessage = null;
      }
    });

    if (isValid) {
      // Handle valid inputs
      print(controller.isUpdated.value);
      !controller.isUpdated.value ? await controller.addDataDiary() : await controller.updateDataDiary();
      controller.isUpdated.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            CustomTextfieldWidget(
              maximumInputHeight: 200,
              label: 'Title',
              controller: _titleController,
              onChange: (_) {
                if (_titleErrorMessage != null) {
                  setState(() {
                    _titleErrorMessage = null; // Clear error when user starts typing
                  });
                }
                controller.setDiaryTitle(_titleController.text);
              },
              errorText: _titleErrorMessage,
              maximumLines: null,
              inputType: TextInputType.text,
            ),
            const SizedBox(height: 10),
            CustomTextfieldWidget(
              maximumInputHeight: 200,
              label: 'Message',
              controller: _messageController,
              onChange: (_) {
                if (_messageErrorMessage != null) {
                  setState(() {
                    _messageErrorMessage = null; // Clear error when user starts typing
                  });
                }
                controller.setDiaryMessage(_messageController.text);
              },
              errorText: _messageErrorMessage,
              maximumLines: null,
              inputType: TextInputType.multiline,
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () async {
                  _validateAndSubmit();
                  //await controller.addDataDiary();
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
