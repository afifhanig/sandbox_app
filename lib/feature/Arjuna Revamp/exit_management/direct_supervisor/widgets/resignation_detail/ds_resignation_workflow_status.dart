import 'package:flutter/material.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/exit_management/employee/create_resignation.dart';

class DSResignationWorkflowStatusWidget extends StatelessWidget {
  final WorkflowStatusDummyData? data;
  final bool isLast;
  const DSResignationWorkflowStatusWidget({super.key, this.isLast = false, this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 64,
          child: Column(
            children: [
              Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  color: data!.statusName!.contains('Waiting') ? Colors.amber[400] : Colors.green,
                  borderRadius: BorderRadius.circular(999),
                ),
                // child: Icon(
                //   Icons.check_rounded,
                //   color: Colors.white,
                // ),
              ),
              if (!isLast)
                Column(
                  children: List.generate(
                    300 ~/ 20,
                    (index) => Container(
                      color: index % 2 == 0 ? Colors.transparent : Colors.green,
                      width: 2,
                      height: 5,
                    ),
                  ),
                ),
            ],
          ),
        ),
        SizedBox(
          width: 140,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(data?.statusName ?? '-', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Reviewed by - ',
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: data?.reviewerName ?? '-',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Text('${data?.reviewDate}')
            ],
          ),
        ),
      ],
    );
  }

  // String actionByName() {
  //   final employee = Get.arguments["employee"] as EmployeeDetail?;
  //   final ds = Get.arguments["ds"];

  //   if (status.actionBy != null) {
  //     if (employee?.nip == status.actionBy) {
  //       return employee?.employeeName ?? "-";
  //     } else if (status.actionBy == ds["nik"]) {
  //       return ds["name"];
  //     }
  //   }

  //   return status.actionBy ?? "-";
  // }
}
