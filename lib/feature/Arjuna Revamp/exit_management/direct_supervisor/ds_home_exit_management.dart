import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/component/arjuna_appbar.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/exit_management/direct_supervisor/ds_emp_under_supervision_detail.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/exit_management/direct_supervisor/ds_resignation_application_form.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/exit_management/direct_supervisor/ds_review_resignation_detail.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/exit_management/direct_supervisor/ds_view_resignation_detail.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/exit_management/direct_supervisor/my_direct_report_resignation.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/exit_management/employee/create_resignation.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/exit_management/employee/resignation_application.dart';
import 'package:sandbox_flutter_3/global_component/main_menu_component.dart';

class DSHomeExitManagement extends StatefulWidget {
  const DSHomeExitManagement({super.key});

  @override
  State<DSHomeExitManagement> createState() => _DSHomeExitManagementState();
}

class _DSHomeExitManagementState extends State<DSHomeExitManagement> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
              MainMenuComponent(toDo: () => Get.to(const MyDirectReportResignation()), nameMenu: 'My Direct Report - Resignation'),
              MainMenuComponent(toDo: () => Get.to(const DSEmpUnderSupervisionDetail()), nameMenu: 'Emp Undersupervision detail (temporary page)'),
              MainMenuComponent(toDo: () => Get.to(const DSReviewResignation()), nameMenu: 'DS Review'),
              MainMenuComponent(toDo: () => Get.to(const DSViewResignation()), nameMenu: 'DS View'),
              MainMenuComponent(toDo: () => Get.to(const DSResignationApplicationForm()), nameMenu: 'Form Application'),
            ],
          ),
        ),
      ),
    );
  }
}
