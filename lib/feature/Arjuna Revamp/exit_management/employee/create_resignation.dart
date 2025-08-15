import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/component/arjuna_appbar.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/exit_management/employee/resignation_application.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/exit_management/employee/resignation_workflow_status.dart';
import 'package:collection/collection.dart';

class CreateResignationEmp extends StatefulWidget {
  const CreateResignationEmp({super.key});

  @override
  State<CreateResignationEmp> createState() => _CreateResignationEmpState();
}

class _CreateResignationEmpState extends State<CreateResignationEmp> {
  List<WorkflowStatusDummyData> workflowStatusData = [
    WorkflowStatusDummyData(statusName: 'Completed', reviewerName: 'Vili', reviewDate: '04/02/2023 13:00'),
    WorkflowStatusDummyData(statusName: 'Manager Review', reviewerName: 'Nina', reviewDate: '04/02/2023 13:00'),
    WorkflowStatusDummyData(statusName: 'Task Exit Clearance', reviewerName: 'Vili', reviewDate: '29/01/2023'),
    WorkflowStatusDummyData(statusName: 'HREM Review', reviewerName: 'Vili', reviewDate: '25/01/2023'),
    WorkflowStatusDummyData(statusName: 'Manager Review', reviewerName: 'Nina', reviewDate: '25/01/2023'),
    WorkflowStatusDummyData(statusName: 'Employee Submit', reviewerName: 'Jacob', reviewDate: '21/01/2023'),
  ];

  bool doneSubmit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: ArjunaAppBar(
          label: "Resignation",
          centerTitle: false,
          onClick: () => Get.offAllNamed("/home"),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 4.2,
                child: Card(
                  //color: Colors.red,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text('Resignation', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)), Icon(Icons.info_rounded, color: Colors.red[900])],
                        ),
                        SizedBox(height: 10),
                        Text('Register your person fund'),
                        Expanded(
                          child: Container(
                            //color: Colors.green,
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.to(const ResignationApplication());
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red[900],
                                    //padding: EdgeInsets.only(top: 5, bottom: 5),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    )),
                                child: const Text('Create Form'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              doneSubmit
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0, bottom: 10.0),
                          child: Text(
                            'Workflow Status',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        ...workflowStatusData.mapIndexed((index, element) {
                          return ResignationWorkflowStatus(
                            data: element,
                            isLast: index == workflowStatusData.length - 1,
                          );
                        }),
                      ],
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}

class WorkflowStatusDummyData {
  String? statusName;
  String? reviewerName;
  String? reviewDate;

  WorkflowStatusDummyData({this.statusName, this.reviewerName, this.reviewDate});
}
