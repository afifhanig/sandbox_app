import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandbox_flutter_3/feature/other/Trying_Variable/trying_variable.dart';

class MainHomeOtherExplore extends StatefulWidget {
  const MainHomeOtherExplore({super.key});

  @override
  State<MainHomeOtherExplore> createState() => _MainHomeOtherExploreState();
}

class _MainHomeOtherExploreState extends State<MainHomeOtherExplore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arjuna main feature'),
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
                  Get.to(const TryingVariable());
                },
                child: const Card(
                  elevation: 10,
                  child: Align(alignment: Alignment.center, child: Text('Variable Testing')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
