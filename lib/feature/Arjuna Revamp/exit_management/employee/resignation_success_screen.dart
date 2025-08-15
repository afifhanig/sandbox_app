//part of './performance_pip.part.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/component/arjuna_appbar.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/exit_management/employee/emp_home_exit_management.dart';

class ResignationSuccessScreen extends StatelessWidget {
  const ResignationSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: ArjunaAppBar(
            label: "Review",
            centerTitle: false,
          ),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 38),
              Text(
                "Success!",
                style: TextStyle(fontWeight: FontWeight.bold)
              ),
              SizedBox(height: 76),
              Image.asset(
                "assets/images/epicc_big_icon_success.png",
                height: 150,
                width: 150,
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: _Message(),
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
            padding: EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {
                //Get.offAll(EmpHomeExitManagement());
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12),
                backgroundColor: Colors.red.shade900,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Back to Home",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            )),
      ),
    );
  }
}

class _Message extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String message = "Your Request has been processed successfully!";
    return Text(message);
  }
}
