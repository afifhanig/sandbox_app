import 'package:flutter/material.dart';
import 'package:sandbox_flutter_3/feature/sqflite/database_1/first_database.dart';
import 'package:sandbox_flutter_3/feature/sqflite/model/user_model.dart';

class SqfliteTest1 extends StatefulWidget {
  const SqfliteTest1({super.key});

  @override
  State<SqfliteTest1> createState() => _SqfliteTest1State();
}

class _SqfliteTest1State extends State<SqfliteTest1> {
  List<User> _users = [];

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    final userMaps = await DatabaseHelper.instance.queryAllDiaries();
    // setState(() {
    //   _users = userMaps.map((userMap) => User.fromMap(userMap)).toList();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text('GFG User List'),
              ElevatedButton(
                  onPressed: () async {
                    await DatabaseHelper.instance.debugPrintDiaries();
                  },
                  child: Text('TAP')),
            ],
          ),
          backgroundColor: Colors.lightGreen,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: 100, // Maximum height
            width: double.infinity,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 100, // Ensures it doesn't exceed this height
                ),
                child: TextField(
                  controller: TextEditingController(),
                  maxLines: null, // Allows the text to wrap
                  keyboardType: TextInputType.multiline,
                  style: TextStyle(color: Colors.amber),
                  decoration: InputDecoration(
                    hintText: 'Type something...',
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    errorText: '',
                    hintStyle: TextStyle(color: Colors.amber),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.amber),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.amber),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.amber),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
