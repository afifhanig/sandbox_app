import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandbox_flutter_3/feature/firestore_example/controller/firestore_controller.dart';
import 'package:sandbox_flutter_3/feature/firestore_example/model/bintarang_model.dart';
import 'package:sandbox_flutter_3/feature/firestore_example/model/diary_model.dart';
import 'package:sandbox_flutter_3/feature/firestore_example/screen/firestore_add_diary_data.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:sandbox_flutter_3/feature/table_calendar/utils_calendar.dart';

class FirestoreDiaryExample extends StatefulWidget {
  const FirestoreDiaryExample({super.key});

  @override
  State<FirestoreDiaryExample> createState() => _FirestoreMainHomeState();
}

class _FirestoreMainHomeState extends State<FirestoreDiaryExample> {
  final FirestoreController firestoreController = Get.put(FirestoreController());
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Diary")),
      body: Column(
        children: [
          Obx(() {
            if (firestoreController.isLoadingFetchingAllData.value) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TableCalendar(
                      firstDay: kFirstDay,
                      lastDay: kLastDay,
                      focusedDay: _focusedDay,
                      calendarFormat: _calendarFormat,
                      headerStyle: const HeaderStyle(
                        formatButtonVisible: false,
                      ),
                      selectedDayPredicate: (day) {
                        return isSameDay(_selectedDay, day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        if (!isSameDay(_selectedDay, selectedDay)) {
                          setState(() {
                            _selectedDay = selectedDay;
                            _focusedDay = focusedDay;
                          });
                          firestoreController.fetchDiary(selectedDay);
                        }
                      },
                      onFormatChanged: (format) {
                        if (_calendarFormat != format) {
                          setState(() {
                            _calendarFormat = format;
                          });
                        }
                      },
                      onPageChanged: (focusedDay) {
                        _focusedDay = focusedDay;
                      },
                      calendarBuilders: CalendarBuilders(
                        defaultBuilder: (context, date, events) {
                          bool hasDiaryEntries = firestoreController.allDiaryEntries.any(
                            (entry) => entry.date.year == date.year && entry.date.month == date.month && entry.date.day == date.day,
                          );

                          return Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: (hasDiaryEntries ? Colors.green : Colors.transparent),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                '${date.day}',
                                style: TextStyle(
                                  color: (hasDiaryEntries ? Colors.white : Colors.black),
                                ), // Change color for weekends),
                              ),
                            ),
                          );
                        },
                        todayBuilder: (context, date, focusedDay) {
                          bool hasDiaryEntries = firestoreController.allDiaryEntries.any(
                            (entry) => entry.date.year == date.year && entry.date.month == date.month && entry.date.day == date.day,
                          );

                          return Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: (hasDiaryEntries ? Colors.green : Colors.transparent),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                '${date.day}',
                                style: TextStyle(
                                  color: (hasDiaryEntries ? Colors.white : Colors.black),
                                ), //
                              ),
                            ),
                          );
                        },
                        outsideBuilder: (context, date, focusedDay) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _focusedDay = date;
                                _selectedDay = date;
                              });
                              firestoreController.fetchDiary(date);
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  '${date.day}',
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                          );
                        },
                        selectedBuilder: (context, date, focusedDay) {
                          // Get whether the selected date has diary entries
                          bool hasDiaryEntries = firestoreController.allDiaryEntries.any(
                            (entry) => entry.date.year == date.year && entry.date.month == date.month && entry.date.day == date.day,
                          );
                          return Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: hasDiaryEntries ? Colors.green : Colors.transparent, // Use green if there are entries
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                '${date.day}',
                                style: TextStyle(
                                  color: (hasDiaryEntries ? Colors.white : Colors.black),
                                  fontWeight: FontWeight.bold,
                                ), //r
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              );
            }
          }),
          Obx(() {
            if (firestoreController.isLoading.value) {
              return const Center(child: CircularProgressIndicator()); // Show loading indicator while fetching data
            } else if (firestoreController.diaryList.isEmpty) {
              return Center(
                child: RichText(
                  text: TextSpan(
                    text: "Data is empty, ",
                    style: TextStyle(color: Colors.black, fontSize: 16), // Default text style
                    children: [
                      TextSpan(
                        text: "add",
                        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Handle the click event here
                            print("Add button clicked");
                            var arguments = _selectedDay ?? _focusedDay;
                            Get.to(const FirestoreAddDataDiary(), arguments: arguments);
                            // You could navigate to another page, open a dialog, etc.
                          },
                      ),
                      const TextSpan(
                        text: " some?",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ); // Show 'Data is empty' when no data
            } else {
              return Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: firestoreController.diaryList.length,
                  itemBuilder: (context, index) {
                    DiaryModel data = firestoreController.diaryList[index];
                    DateTime now = DateTime.now();
                    DateTime diaryDate = data.date;
                    bool isToday = diaryDate.year == now.year && diaryDate.month == now.month && diaryDate.day == now.day;
                    return Column(
                      children: data.dataDiary.map((e) {
                        return Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          child: ListTile(
                            title: Text(e.title),
                            subtitle: Text(e.message),
                            trailing: Text(isToday.toString()),
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              );
            }
          }),
        ],
      ),
    );
  }
}
