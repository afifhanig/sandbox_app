import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandbox_flutter_3/feature/try_getx_worker/tryworker_controller.dart';

class TryWorkerScreen extends StatefulWidget {
  const TryWorkerScreen({super.key});

  @override
  State<TryWorkerScreen> createState() => _TryWorkerScreenState();
}

class _TryWorkerScreenState extends State<TryWorkerScreen> {
  var controller = Get.put(TryWorkerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Try Worker'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                controller.increment();
              },
              child: const Text('Count'),
            ),
            const SizedBox(height: 10),
            _IDPWidget(),
          ],
        ),
      ),
    );
  }

  Widget tableTest() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      child: DataTable(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        //headingRowColor: MaterialStateProperty.all(Colors.red.shade900),
        columnSpacing: 16.0,
        columns: <DataColumn>[
          DataColumn(
            label: Container(
              alignment: Alignment.center,
              child: const Text(
                'Grade',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
            numeric: false,
          ),
          DataColumn(
            label: Container(
              alignment: Alignment.center,
              child: const Text(
                'Status',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
            numeric: false,
          ),
          DataColumn(
            label: Container(
              alignment: Alignment.center,
              child: const Text(
                'Age',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
            numeric: false,
          ),
        ],
        rows: <DataRow>[
          const DataRow(
            cells: <DataCell>[
              DataCell(Text('A')),
              DataCell(Text('Active')),
              DataCell(Text('25')),
            ],
          ),
          const DataRow(
            cells: <DataCell>[
              DataCell(Text('B')),
              DataCell(Text('Inactive')),
              DataCell(Text('30')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('C')),
              DataCell(Text('Active')),
              //DataCell(Text('35')),
              DataCell(controller.action ? dropDownData() : noDropDown()),
            ],
          ),
        ],
      ),
    );
  }

  Widget dropDownData() {
    return Obx(
      (() => Container(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.red.shade100,
              border: Border.all(color: Colors.red.shade100, style: BorderStyle.solid, width: 0.80),
            ),
            child: DropdownButton<String>(
              value: controller.selectedValue.value,
              items: controller.dropdownItems,
              borderRadius: BorderRadius.circular(20),
              onChanged: (value) {
                if (value != null) controller.selectedValue.value = value;
              },
            ),
          )),
    );
  }

  Widget noDropDown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.red.shade100,
        border: Border.all(color: Colors.red.shade100, style: BorderStyle.solid, width: 0.80),
      ),
      child: Text(controller.selectedValue.value),
    );
  }
}

class _IDPWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const selfAsessmentHeaders = ["Status", "Realization", "Completion Date"];
    const managerEvaluationHeaders = ["Status", "Comments", "Completion Date"];
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Competency : ",
              //style: ArjunaThemeData.contentStyle,
            ),
            Text(
              "Replace your competency",
              // style: ArjunaThemeData.contentStyle
              //     .copyWith(fontWeight: FontWeight.bold),
            )
          ],
        ),
        SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            dataRowMaxHeight: double.infinity,
            headingRowHeight: 110,
            dividerThickness: 1.0,
            border: const TableBorder(
              verticalInside: BorderSide(
                width: 1,
                style: BorderStyle.solid,
                color: Colors.white,
              ),
            ),
            headingRowColor: MaterialStateColor.resolveWith(
              (states) {
                return Color(0xFFC4161C);
              },
            ),
            columns: [
              DataColumn(
                label: Text(
                  'No',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Category',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Development Activity',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Description',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: _ColSpanHeaders(
                    title: "Employee Self Assessment",
                    headers: selfAsessmentHeaders,
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: _ColSpanHeaders(
                    title: "Manager Evaluation",
                    headers: managerEvaluationHeaders,
                  ),
                ),
              ),
            ],
            rows: [
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('1')),
                  DataCell(
                    Container(
                      constraints: BoxConstraints(minWidth: 80, maxWidth: 200),
                      padding: EdgeInsets.all(8),
                      child: Text("{{category}}"),
                    ),
                  ),
                  DataCell(
                    Container(
                      constraints: BoxConstraints(minWidth: 80, maxWidth: 200),
                      padding: EdgeInsets.all(8),
                      child: Text("{{development_activity}}"),
                    ),
                  ),
                  DataCell(
                    Container(
                      constraints: BoxConstraints(minWidth: 80, maxWidth: 200),
                      padding: EdgeInsets.all(8),
                      child: Text("{{description}}"),
                    ),
                  ),
                  DataCell(_ColSpanRow(
                    headers: selfAsessmentHeaders,
                    values: ["Completed", "Mengikuti kegiatan training", "30 Jun 2024"],
                  )),
                  DataCell(_ColSpanRow(
                    headers: managerEvaluationHeaders,
                    values: ["Completed", "Testing", "Testing"],
                  )),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('2')),
                  DataCell(
                    Container(
                      constraints: BoxConstraints(minWidth: 80, maxWidth: 200),
                      padding: EdgeInsets.all(8),
                      child: Text("{{category}}"),
                    ),
                  ),
                  DataCell(
                    Container(
                      constraints: BoxConstraints(minWidth: 80, maxWidth: 200),
                      padding: EdgeInsets.all(8),
                      child: Text("{{development_activity}}"),
                    ),
                  ),
                  DataCell(
                    Container(
                      constraints: BoxConstraints(minWidth: 80, maxWidth: 200),
                      padding: EdgeInsets.all(8),
                      child: Text("{{description}}"),
                    ),
                  ),
                  DataCell(_ColSpanRow(
                    headers: selfAsessmentHeaders,
                    values: ["Completed", "Mengikuti kegiatan berenang", "29 Jun 2024"],
                  )),
                  DataCell(_ColSpanRow(
                    headers: managerEvaluationHeaders,
                    values: ["Completed", "", ""],
                  )),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 20)
      ],
    );
  }
}

class _ColSpanHeaders extends StatelessWidget {
  final String title;
  final List<String> headers;
  const _ColSpanHeaders({
    required this.title,
    required this.headers,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text(
            "Employee Self Assessment",
            style: TextStyle(color: Colors.white),
          ),
        ),
        Container(color: Colors.white, height: 1),
        DataTable(
          dataRowMaxHeight: double.infinity,
          headingRowColor: MaterialStateColor.resolveWith(
            (states) {
              return Color(0xFFC4161C);
            },
          ),
          columns: headers
              .map(
                (item) => DataColumn(
                  label: Container(
                    width: 200,
                    child: Text(
                      item,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
              .toList(),
          rows: [],
        ),
      ],
    );
  }
}

class _ColSpanRow extends StatelessWidget {
  final List<String> headers;
  final List<String> values;

  const _ColSpanRow({
    required this.headers,
    required this.values,
  });

  @override
  Widget build(BuildContext context) {
    return DataTable(
      dataRowMaxHeight: double.infinity,
      headingRowHeight: 0,
      dividerThickness: 0,
      headingRowColor: MaterialStateColor.resolveWith(
        (states) {
          return Color(0x00C4161C);
        },
      ),
      columns: headers
          .map(
            (item) => DataColumn(
              label: Container(
                width: 200,
                child: Text(
                  item,
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
          .toList(),
      rows: [
        DataRow(
          cells: values.map((item) => DataCell(Container(width: 200, child: Text(item)))).toList(),
        )
      ],
    );
  }
}
