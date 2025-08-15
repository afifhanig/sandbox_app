import 'package:cloud_firestore/cloud_firestore.dart';

class DiaryModel {
  final DateTime date;
  final String message;
  final String title;
  final List<DiaryEntry> dataDiary;

  DiaryModel({
    required this.date,
    required this.message,
    required this.title,
    required this.dataDiary,
  });

  factory DiaryModel.fromJson(Map<String, dynamic> json) {
    var entries = (json['datadiary'] as List).map((entry) => DiaryEntry.fromJson(entry)).toList();
    return DiaryModel(
      date: (json['date'] as Timestamp).toDate(),
      message: json['message'] as String,
      title: json['title'] as String,
      dataDiary: entries,
    );
  }

  // Serializing to Firestore
  Map<String, dynamic> toJson() {
    return {
      'date': Timestamp.fromDate(date),
      'message': message,
      'title': title,
      'datadiary': dataDiary.map((entry) => entry.toJson()).toList(),
    };
  }
}

class DiaryEntry {
  final String title;
  final String message;

  DiaryEntry({
    required this.title,
    required this.message,
  });

  // From JSON
  factory DiaryEntry.fromJson(Map<String, dynamic> json) {
    return DiaryEntry(
      title: json['title'] as String,
      message: json['message'] as String,
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'message': message,
    };
  }
}
