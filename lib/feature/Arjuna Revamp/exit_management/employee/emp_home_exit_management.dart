import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/component/arjuna_appbar.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/exit_management/employee/create_resignation.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/exit_management/employee/resignation_application.dart';
import 'package:sandbox_flutter_3/global_component/main_menu_component.dart';

class EmpHomeExitManagement extends StatefulWidget {
  const EmpHomeExitManagement({super.key});

  @override
  State<EmpHomeExitManagement> createState() => _EmpHomeExitManagementState();
}

class _EmpHomeExitManagementState extends State<EmpHomeExitManagement> {
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
              MainMenuComponent(toDo: () => Get.to(const CreateResignationEmp()), nameMenu: 'Create Resignation Employee'),
              MainMenuComponent(toDo: () => Get.to(const ResignationApplication()), nameMenu: 'Resignation Application'),
            ],
          ),
        ),
      ),
    );
  }
}
