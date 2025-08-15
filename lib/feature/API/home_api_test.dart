import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sandbox_flutter_3/feature/API/api_ninjass_random_user.dart';

class HomeAPITesting extends StatefulWidget {
  const HomeAPITesting({super.key});

  @override
  State<HomeAPITesting> createState() => _HomeAPITestingState();
}

class _HomeAPITestingState extends State<HomeAPITesting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Testing API'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: GridView.count(
            crossAxisCount: 3,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(const ApiNinjasRandomUser());
                },
                child: const Card(
                  elevation: 10,
                  child: Align(alignment: Alignment.center, child: Text('API Ninjas')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
