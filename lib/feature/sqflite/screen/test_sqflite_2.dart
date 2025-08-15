import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sandbox_flutter_3/feature/sqflite/controller/sqflite_controller.dart';
import 'package:sandbox_flutter_3/feature/sqflite/model/diary_data_model.dart';
import 'package:sandbox_flutter_3/feature/sqflite/screen/add_diary_data.dart';
import 'package:sandbox_flutter_3/feature/table_calendar/utils_calendar.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

const whiteColor = Color(0xFFFFFFFF);
const primaryColor = Color(0xFF212529);
const accentColor = Color(0xFFB7FF57);
const monthTitleColor = Color(0xFFC4C3C2);

class SqfliteTest2 extends StatefulWidget {
  const SqfliteTest2({super.key});

  @override
  State<SqfliteTest2> createState() => _SqfliteTest2State();
}

class _SqfliteTest2State extends State<SqfliteTest2> {
  final controller = Get.put(SQFLiteContoller());
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  String displayedMonth = DateFormat.MMMM().format(DateTime.now());
  GlobalKey _widgetKey = GlobalKey();
  double he = 0.0;
  List<String> fruits = ["Apple", "Banana", "Orange", "Mango", "Grapes", "Pineapple", "Strawberry", "Cherry", "Watermelon", "Kiwi", "Blueberry", "Peach", "Lemon", "Papaya", "Coconut", "Pomegranate", "Pear", "Guava", "Dragonfruit", "Plum"];

  void _getCalendarHeight() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox? renderBox = _widgetKey.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        Future.delayed(Duration.zero, () {
          setState(() {
            he = renderBox.size.height; // Ensure updated height is used
          });
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getCalendarHeight();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(textTheme: GoogleFonts.plusJakartaSansTextTheme(Theme.of(context).textTheme)),
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text('SQFLite tes 1'),
        //   backgroundColor: accentColor,
        // ),
        body: SafeArea(
          child: Obx(
            () => CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: whiteColor,
                  expandedHeight: MediaQuery.of(context).size.height / 1.76,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            color: Colors.transparent,
                            child: Text(
                              'Sqlite ${controller.dataDiary.length}',
                              style: const TextStyle(color: Colors.transparent, fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 18, left: 14),
                            child: Text(
                              '$displayedMonth',
                              style: const TextStyle(color: monthTitleColor, fontSize: 62),
                            ),
                          ),
                          TableCalendar(
                            key: _widgetKey,
                            firstDay: kFirstDay,
                            lastDay: kLastDay,
                            focusedDay: controller.focusedDay,
                            calendarFormat: _calendarFormat,
                            headerVisible: false,
                            headerStyle: const HeaderStyle(
                              formatButtonVisible: false,
                            ),
                            selectedDayPredicate: (day) {
                              return isSameDay(controller.selectedDay, day);
                            },
                            onDaySelected: (selectedDay, focusedDay) {
                              if (!isSameDay(controller.selectedDay, selectedDay)) {
                                setState(() {
                                  controller.selectedDay = selectedDay;
                                  controller.focusedDay = focusedDay;
                                });
                                controller.fetchDiariesDaily(selectedDay);
                              }
                            },
                            onPageChanged: (focusedDay) {
                              controller.focusedDay = focusedDay;
                              setState(() {
                                displayedMonth = DateFormat.MMMM().format(focusedDay);
                              });
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                _getCalendarHeight();
                              });
                            },
                            calendarBuilders: CalendarBuilders(
                              defaultBuilder: (context, date, events) {
                                return Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: (controller.hasDiaryEntriesForDate(date) ? accentColor : Colors.transparent),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${date.day}',
                                      style: TextStyle(
                                        color: (controller.hasDiaryEntriesForDate(date) ? primaryColor : primaryColor),
                                      ), // Change color for weekends),
                                    ),
                                  ),
                                );
                              },
                              todayBuilder: (context, date, focusedDay) {
                                return Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: (controller.hasDiaryEntriesForDate(date) ? accentColor : Colors.transparent),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${date.day}',
                                      style: TextStyle(
                                        color: (controller.hasDiaryEntriesForDate(date) ? primaryColor : primaryColor),
                                      ), //
                                    ),
                                  ),
                                );
                              },
                              outsideBuilder: (context, date, focusedDay) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      controller.focusedDay = date;
                                      controller.selectedDay = date;
                                    });
                                    controller.fetchDiariesDaily(date);
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
                                return Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: controller.hasDiaryEntriesForDate(date) ? accentColor : primaryColor, // Use green if there are entries
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${date.day}',
                                      style: TextStyle(
                                        color: (controller.hasDiaryEntriesForDate(date) ? primaryColor : whiteColor),
                                        fontWeight: FontWeight.bold,
                                      ), //r
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Container(
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 22, right: 22, top: 10),
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            ...controller.diaryByDate.mapIndexed((index, e) {
                              bool isEven = index % 2 == 0;
                              return Column(
                                children: [
                                  const SizedBox(height: 8.0),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 100,
                                    child: Card(
                                      color: isEven ? primaryColor : accentColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: const BorderSide(
                                          color: accentColor,
                                          width: 1.5,
                                        ),
                                      ),
                                      elevation: 10,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text('${e.title}', style: TextStyle(color: isEven ? accentColor : primaryColor)),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: PopupMenuButton(
                                              elevation: 8.0,
                                              color: isEven ? accentColor : primaryColor,
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                              itemBuilder: (BuildContext context) {
                                                return [
                                                  PopupMenuItem(
                                                    padding: EdgeInsets.zero,
                                                    textStyle: TextStyle(color: isEven ? primaryColor : accentColor),
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(left: 12.0),
                                                      child: Row(
                                                        children: [
                                                          Icon(Icons.mode_edit_rounded, color: isEven ? primaryColor : accentColor),
                                                          SizedBox(width: 8),
                                                          Text('Edit'),
                                                        ],
                                                      ),
                                                    ),
                                                    onTap: () async {
                                                      if (e.id != null) {
                                                        print('executed');
                                                        await controller.getDiaryByID(e.id ?? 0);
                                                        Get.bottomSheet(
                                                          ModalAddorUpdateDiary(controller: controller, diaryData: controller.diaryByID),
                                                          elevation: 10,
                                                        );
                                                      }
                                                    },
                                                  ),
                                                  PopupMenuItem(
                                                    padding: EdgeInsets.zero,
                                                    textStyle: TextStyle(color: isEven ? primaryColor : accentColor),
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(left: 12.0),
                                                      child: Row(
                                                        children: [
                                                          Icon(Icons.delete_rounded, color: isEven ? primaryColor : accentColor),
                                                          SizedBox(width: 8),
                                                          Text('Delete'),
                                                        ],
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      if (e.id != null) {
                                                        controller.removeDataDiary(e.id ?? 0, index);
                                                      }
                                                    },
                                                  ),
                                                ];
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            })
                          ],
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.small(
          backgroundColor: accentColor,
          child: Icon(Icons.add, color: primaryColor),
          onPressed: () {
            Get.bottomSheet(
              ModalAddorUpdateDiary(controller: controller),
              elevation: 10,
            );
          },
        ),
      ),
    );
  }
}

class CustomTextfieldWidget extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final Function(String)? onChange;
  final String? errorText;
  final int? maximumLines;
  final double maximumInputHeight;
  final TextInputType inputType;
  const CustomTextfieldWidget({
    super.key,
    required this.label,
    this.controller,
    this.onChange,
    this.errorText,
    required this.maximumInputHeight,
    required this.maximumLines,
    required this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 5.0),
          child: Text(label, style: TextStyle(fontSize: 16, color: accentColor, fontWeight: FontWeight.w500)),
        ),
        SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: maximumInputHeight,
            ),
            child: TextField(
              controller: controller,
              maxLines: maximumLines,
              keyboardType: inputType,
              style: TextStyle(
                color: accentColor,
              ),
              decoration: InputDecoration(
                hintText: 'Type something...',
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                errorText: errorText,
                hintStyle: TextStyle(color: monthTitleColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: accentColor, // You can adjust the border color
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: accentColor, // Border color when not focused
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: accentColor, // Border color when focused
                  ),
                ),
              ),
              onChanged: onChange ?? (_) {},
            ),
          ),
        ),
      ],
    );
  }
}

class ModalAddorUpdateDiary extends StatefulWidget {
  final SQFLiteContoller controller;
  final List<DiaryDataModel>? diaryData;
  const ModalAddorUpdateDiary({super.key, required this.controller, this.diaryData});

  @override
  State<ModalAddorUpdateDiary> createState() => _ModalAddorUpdateDiaryState();
}

class _ModalAddorUpdateDiaryState extends State<ModalAddorUpdateDiary> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  String? _titleErrorMessage;
  String? _messageErrorMessage;

  @override
  void initState() {
    if (widget.diaryData != null) {
      _titleController.text = widget.diaryData![0].title;
      _messageController.text = widget.diaryData![0].message;
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
      print(widget.controller.isUpdated.value);
      !widget.controller.isUpdated.value ? await widget.controller.addDataDiary() : await widget.controller.updateDataDiary();
      widget.controller.isUpdated.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            CustomTextfieldWidget(
              maximumInputHeight: 75,
              label: 'Title',
              controller: _titleController,
              onChange: (_) {
                if (_titleErrorMessage != null) {
                  setState(() {
                    _titleErrorMessage = null; // Clear error when user starts typing
                  });
                }
                widget.controller.setDiaryTitle(_titleController.text);
              },
              errorText: _titleErrorMessage,
              maximumLines: 1,
              inputType: TextInputType.text,
            ),
            SizedBox(height: 20),
            CustomTextfieldWidget(
              maximumInputHeight: 60,
              label: 'Message',
              controller: _messageController,
              onChange: (_) {
                if (_messageErrorMessage != null) {
                  setState(() {
                    _messageErrorMessage = null; // Clear error when user starts typing
                  });
                }
                widget.controller.setDiaryMessage(_messageController.text);
              },
              errorText: _messageErrorMessage,
              maximumLines: null,
              inputType: TextInputType.multiline,
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: accentColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () async {
                  _validateAndSubmit();
                  //await controller.addDataDiary();
                },
                child: const Text(
                  'Save',
                  style: TextStyle(color: primaryColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
