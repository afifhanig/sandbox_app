import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/arjuna_banner.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/arjuna_change_wfh_address.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/arjuna_new_home.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/arjuna_notification_revamp_screen.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/exit_management/direct_supervisor/ds_home_exit_management.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/exit_management/employee/emp_home_exit_management.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/lms/arjuna_lms.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/lms/arjuna_training_detail_shimmer.dart';
import 'package:sandbox_flutter_3/global_component/main_menu_component.dart';

class ArjunaFeature extends StatefulWidget {
  const ArjunaFeature({super.key});

  @override
  State<ArjunaFeature> createState() => _ArjunaFeatureState();
}

class _ArjunaFeatureState extends State<ArjunaFeature> {
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
              MainMenuComponent(toDo: () => Get.to(const ArjunaNotificationRevampScreen()), nameMenu: 'Arjuna Notification Revamps'),
              MainMenuComponent(toDo: () => Get.to(const ArjunaBannerRevamp()), nameMenu: 'Arjuna Banner Revamp'),
              MainMenuComponent(toDo: () => Get.to(const ArjunaNewHome()), nameMenu: 'Arjuna Home Revamps'),
              MainMenuComponent(toDo: () => Get.to(const ChangeWfhAddress()), nameMenu: 'Arjuna New Change WFH Address'),
              MainMenuComponent(toDo: () => Get.to(const ArjunaLMS()), nameMenu: 'Arjuna LMS'),
              MainMenuComponent(toDo: () => Get.to(const TrainingDetailShimmer()), nameMenu: 'Traning Detail Shimmer'),
              MainMenuComponent(toDo: () => Get.to(const EmpHomeExitManagement()), nameMenu: 'Exit Management Employee'),
              MainMenuComponent(toDo: () => Get.to(const DSHomeExitManagement()), nameMenu: 'Exit Management DS')
            ],
          ),
        ),
      ),
    );
  }
}
