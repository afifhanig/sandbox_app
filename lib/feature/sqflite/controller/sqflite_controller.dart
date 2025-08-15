import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:sandbox_flutter_3/feature/sqflite/database_1/first_database.dart';
import 'package:sandbox_flutter_3/feature/sqflite/model/diary_data_model.dart';
import 'package:sandbox_flutter_3/feature/sqflite/screen/add_diary_data.dart';
import 'package:sandbox_flutter_3/feature/table_calendar/utils_calendar.dart';
import 'package:sqflite/sqflite.dart';

class SQFLiteContoller extends GetxController {
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;
  var isUpdated = false.obs;
  var dataDiary = <DiaryDataModel>[].obs;
  var diaryByDate = <DiaryDataModel>[].obs;
  var diaryByID = <DiaryDataModel>[].obs;
  var diaryTitle = '';
  var diaryMessage = '';

  @override
  void onInit() async {
    await DatabaseHelper.instance.initializeDiary();
    _fetchDiaries();
    fetchDiariesDaily(DateTime.now());
    super.onInit();
  }

  Future<void> _fetchDiaries() async {
    try {
      final diariesMaps = await DatabaseHelper.instance.queryAllDiaries();
      if (diariesMaps.isNotEmpty) {
        final diaries = diariesMaps.map((e) {
          return DiaryDataModel(
            id: e['id'] as int,
            date: e['date'] as String,
            message: e['message'] as String,
            title: e['title'] as String,
          );
        }).toList();
        dataDiary.assignAll(diaries);
        print('data lenght ${dataDiary.length}');
      } else {
        if (dataDiary.isNotEmpty) {
          dataDiary.clear();
        }
        debugPrint('table is empty');
      }
    } catch (e) {
      debugPrint('error $e');
    }
  }

  Future<void> fetchDiariesDaily(DateTime date) async {
    var fDate = formattingDate(date);
    try {
      final diariesMaps = await DatabaseHelper.instance.fetchDiariesByDate(fDate);
      final diaries = diariesMaps.map((e) {
        return DiaryDataModel(
          id: e['id'] as int,
          date: e['date'] as String,
          message: e['message'] as String,
          title: e['title'] as String,
        );
      }).toList();
      diaryByDate.assignAll(diaries);
    } catch (e) {
      debugPrint('error $e');
    }
  }

  bool hasDiaryEntriesForDate(DateTime date) {
    return dataDiary.any((entry) {
      // final entryDate = DateTime.parse(entry.date); // Parse the date from the string
      // return entryDate.year == date.year && entryDate.month == date.month && entryDate.day == date.day;
      final entryDate = DateTime.parse(entry.date); // Parse the stored date
      final normalizedEntryDate = DateTime.utc(entryDate.year, entryDate.month, entryDate.day);
      final normalizedDate = DateTime.utc(date.year, date.month, date.day);
      return normalizedEntryDate == normalizedDate;
    });
  }

  setDiaryTitle(String title) {
    diaryTitle = title;
  }

  setDiaryMessage(String message) {
    diaryMessage = message;
  }

  Future<void> addDataDiary() async {
    var fDate = formattingDate(selectedDay ?? focusedDay);
    var data = DiaryDataModel(date: fDate, message: diaryMessage, title: diaryTitle);
    try {
      int result = await DatabaseHelper.instance.insertDiary(data);
      if (result != -1) {
        Get.back();
        fetchDiariesDaily(focusedDay);
        _fetchDiaries();
      } else {
        debugPrint('Failed to insert diary.');
      }
    } catch (e) {
      debugPrint('Error in addDataDiary: $e');
    }
  }

  Future<void> removeDataDiary(int id, int index) async {
    try {
      await DatabaseHelper.instance.deleteDiary(id);
      diaryByDate.removeAt(index);
      await _fetchDiaries();
      dataDiary.refresh();
    } catch (e) {
      debugPrint('error $e');
    }
  }

  Future<void> getDiaryByID(int id) async {
    try {
      final result = await DatabaseHelper.instance.fetchDiariesByID(id);
      debugPrint('data nyahh : $result');
      final diaries = result.map((e) {
        return DiaryDataModel(
          id: e['id'] as int,
          date: e['date'] as String,
          message: e['message'] as String,
          title: e['title'] as String,
        );
      }).toList();
      diaryByID.assignAll(diaries);
      isUpdated.value = true;
      //Get.to(const AddDiaryData(), arguments: diaryByID);
    } catch (e) {
      debugPrint('error $e');
    }
  }

  Future<void> updateDataDiary() async {
    try {
      if (diaryByID.isNotEmpty) {
        final fetchedDiary = diaryByID.first;
        final updatedData = DiaryDataModel(
          id: fetchedDiary.id,
          date: fetchedDiary.date,
          message: diaryMessage.isNotEmpty ? diaryMessage : fetchedDiary.message,
          title: diaryTitle.isNotEmpty ? diaryTitle : fetchedDiary.title,
        );
        int result = await DatabaseHelper.instance.updateDiary(updatedData);
        if (result != -1) {
          Get.back();
          fetchDiariesDaily(focusedDay);
          _fetchDiaries();
        } else {
          debugPrint('Failed to update diary.');
        }
      }
    } catch (e) {
      debugPrint('Error in addDataDiary: $e');
    }
  }

  goToAddDiary() {
    Get.to(const AddDiaryData());
  }
}
