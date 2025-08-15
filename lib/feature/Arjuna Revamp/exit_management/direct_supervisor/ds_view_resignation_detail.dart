import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/component/arjuna_appbar.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/component/dashed_line.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/exit_management/direct_supervisor/ds_emp_under_supervision_detail.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/exit_management/direct_supervisor/widgets/resignation_detail/ds_resignation_application.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/exit_management/direct_supervisor/widgets/resignation_detail/ds_resignation_document.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/exit_management/direct_supervisor/widgets/resignation_detail/ds_resignation_notes.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/exit_management/direct_supervisor/widgets/resignation_detail/ds_resignation_workflow_status.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/exit_management/employee/create_resignation.dart';

class DSViewResignation extends StatefulWidget {
  const DSViewResignation({super.key});

  @override
  State<DSViewResignation> createState() => _DSViewResignationState();
}

class _DSViewResignationState extends State<DSViewResignation> {
  List<WorkflowStatusDummyData> workflowStatusData = [
    WorkflowStatusDummyData(statusName: 'Waiting for Approval Manager', reviewerName: 'Vili', reviewDate: '04/02/2023 13:00'),
    WorkflowStatusDummyData(statusName: 'Task Exit Clearance', reviewerName: 'Vili', reviewDate: '29/01/2023'),
    WorkflowStatusDummyData(statusName: 'HREM Review', reviewerName: 'Vili', reviewDate: '25/01/2023'),
    WorkflowStatusDummyData(statusName: 'Manager Review', reviewerName: 'Nina', reviewDate: '25/01/2023'),
    WorkflowStatusDummyData(statusName: 'Employee Submit', reviewerName: 'Jacob', reviewDate: '21/01/2023'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: ArjunaAppBar(
          label: 'Resignation',
          centerTitle: false,
          onClick: () {
            Get.back();
          },
        ),
        preferredSize: Size.fromHeight(60),
      ),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                expandedHeight: 200.0,
                floating: false,
                pinned: false,
                backgroundColor: Colors.transparent,
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    padding: EdgeInsets.symmetric(vertical: 32, horizontal: 18),
                    child: Container(color: Colors.transparent, child: EmployeeCard()),
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    labelColor: Colors.black87,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.red.shade900,
                    tabs: [
                      Tab(text: "Summary"),
                      Tab(text: "Approval Logs"),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
                  child: Column(
                    children: [widgetTerminationDetail(), Expanded(child: Container())],
                  )),
              Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, bottom: 12.0),
                          child: Text(
                            'Workflow Status',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        ...workflowStatusData.mapIndexed((index, element) {
                          return DSResignationWorkflowStatusWidget(
                            data: element,
                            isLast: index == workflowStatusData.length - 1,
                          );
                        }),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  widgetTerminationDetail() {
    return const Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 30.0, top: 16.0, right: 30.0),
            child: DSResignationApplicationWidget(isReadOnly: true),
          ),
          Padding(padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 12.0), child: LineDashWidget()),

          //
          Padding(
            padding: EdgeInsets.only(left: 30.0, top: 16.0, right: 30.0),
            child: DSResignationDocumentWidget(isReadOnly: true),
          ),
          Padding(padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 12.0), child: LineDashWidget()),

          //
          Padding(
            padding: EdgeInsets.only(left: 30.0, top: 16.0, right: 30.0, bottom: 16.0),
            child: DSResignationNotesWidget(isReadOnly: true),
          ),
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white, // ADD THE COLOR YOU WANT AS BACKGROUND.
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
