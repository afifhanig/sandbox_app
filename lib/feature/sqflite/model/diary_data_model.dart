import 'package:intl/intl.dart';

class DiaryDataModel {
  final int? id;
  final String date;
  final String message;
  final String title;

  DiaryDataModel({
    this.id,
    required this.date,
    required this.message,
    required this.title,
  });

  factory DiaryDataModel.fromJson(Map<String, dynamic> json) {
    return DiaryDataModel(
      id: json['id'] as int,
      date: json['id'] as String,
      message: json['message'] as String,
      title: json['title'] as String,
    );
  }

  // Serializing to Firestore
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'message': message,
      'title': title,
    };
  }

  static String formatDateTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat("yyyy-MM-dd HH:mm:ss.SSS'Z'");
    return formatter.format(dateTime);
  }

  static DateTime parseDateTime(String date) => DateTime.parse(date);
}

class DiaryEntryModel {
  final String title;
  final String message;

  DiaryEntryModel({
    required this.title,
    required this.message,
  });

  // From JSON
  factory DiaryEntryModel.fromJson(Map<String, dynamic> json) {
    return DiaryEntryModel(
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
