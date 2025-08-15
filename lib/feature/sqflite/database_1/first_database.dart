import 'package:flutter/foundation.dart';
import 'package:sandbox_flutter_3/feature/sqflite/model/diary_data_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const String tableMyDiary = 'my_diary';
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database? _database;

  DatabaseHelper._instance();

  Future<Database> get db async {
    _database ??= await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'my_database.db');
    final database = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
    return database;
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableMyDiary (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        date TEXT NOT NULL,
        message TEXT NOT NULL,
        title TEXT NOT NULL
      )
    ''');
  }

  Future<void> initializeDiary() async {
    List<DiaryDataModel> diariesToAdd = [
      DiaryDataModel(
        date: DiaryDataModel.formatDateTime(DateTime.now()), // Format date
        message: 'Good live.',
        title: 'Story',
      ),
      DiaryDataModel(
        date: DiaryDataModel.formatDateTime(DateTime.now()), // Format date
        message: 'Had a productive day.',
        title: 'Productivity',
      ),
      DiaryDataModel(
        date: DiaryDataModel.formatDateTime(DateTime.now().subtract(Duration(days: 1))), // Format date
        message: 'XXX tencation Had a productive day.',
        title: 'Productivityxxx',
      ),
    ];

    for (DiaryDataModel diary_d in diariesToAdd) {
      await insertDiary(diary_d);
    }
  }

  Future<List<Map<String, dynamic>>> queryAllDiaries() async {
    try {
      Database db = await instance.db;
      return await db.query('$tableMyDiary');
    } catch (e) {
      debugPrint('Database error in insertDiary: $e');
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> fetchDiariesByDate(String date) async {
    Database db = await instance.db;
    return await db.query(
      '$tableMyDiary',
      where: 'date LIKE ?',
      whereArgs: ['$date%'],
    );
  }

  Future<List<Map<String, dynamic>>> fetchDiariesByID(int id) async {
    Database db = await instance.db;
    return await db.query(
      '$tableMyDiary',
      where: 'id = ?',
      whereArgs: ['$id'],
    );
  }

  Future<int> insertDiary(DiaryDataModel diary) async {
    try {
      Database db = await instance.db;
      return await db.insert('$tableMyDiary', diary.toJson());
    } catch (e) {
      debugPrint('Database error in insertDiary: $e');
      return -1;
    }
  }

  Future<int> updateDiary(DiaryDataModel diary) async {
    try {
      Database db = await instance.db;
      return await db.update('$tableMyDiary', diary.toJson(), where: 'id = ?', whereArgs: [diary.id]);
    } catch (e) {
      debugPrint('Database error in updateDiary: $e');
      return -1;
    }
  }

  Future<int> deleteDiary(int id) async {
    try {
      Database db = await instance.db;
      return await db.delete('$tableMyDiary', where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      debugPrint('Database error in deleteDiaryr: $e');
      return -1;
    }
  }

  Future<void> debugPrintDiaries() async {
    Database db = await instance.db;
    final allRows = await db.query('$tableMyDiary');
    debugPrint('All diary entries: $allRows');
  }

  Future<void> deleteEntireDatabase() async {
    try {
      String databasePath = await getDatabasesPath();
      String dbPath = join(databasePath, 'my_database.db'); // Replace with your database name
      await deleteDatabase(dbPath);
      debugPrint("Database deleted successfully!");
    } catch (e) {
      debugPrint("Error deleting database: $e");
    }
  }
}
