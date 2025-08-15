import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/component/arjuna_appbar.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/exit_management/direct_supervisor/ds_review_resignation_detail.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/exit_management/direct_supervisor/ds_view_resignation_detail.dart';

class DSEmpUnderSupervisionDetail extends StatefulWidget {
  const DSEmpUnderSupervisionDetail({super.key});

  @override
  State<DSEmpUnderSupervisionDetail> createState() => _DSEmpUnderSupervisionDetailState();
}

class _DSEmpUnderSupervisionDetailState extends State<DSEmpUnderSupervisionDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: ArjunaAppBar(
          label: "Resignation",
          centerTitle: false,
        ),
      ),
      body: DefaultTabController(
        length: 3,
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
                    padding: EdgeInsets.all(10.0),
                    child: widgetEmpUnderSupervision(),
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
                      Tab(text: "In Progress"),
                      Tab(text: "Completed"),
                      Tab(text: "Pending"),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [
              widgetItemList('in-progress'),
              widgetItemList('completed'),
              widgetItemList('pending'),
            ],
          ),
        ),
      ),
    );
  }

  widgetEmpUnderSupervision() {
    return Container(
      height: 175,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20)), boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(2, 3), // changes position of shadow
        ),
      ]),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Text(
                        "Employee Under Supervision",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "0",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35, color: Colors.redAccent),
                      ),
                      Text("Total", style: TextStyle(fontSize: 14, color: Colors.redAccent)),
                      Text("Employee", style: TextStyle(fontSize: 14, color: Colors.redAccent))
                    ],
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  child: PieChart(
                    dataMap: {
                      "In Progress": 5,
                      "Complete": 3,
                      "Pending": 2,
                    },
                    chartLegendSpacing: 20,
                    ringStrokeWidth: 200,
                    colorList: [
                      //Colors.green.shade200,
                      Color(0xFFffeaa7),
                      Color(0xFF54efc3),
                      Color(0xFFff766f),
                    ],
                    chartValuesOptions: ChartValuesOptions(
                      decimalPlaces: 0,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  widgetItemList(String tag) {
    return ListView.builder(
      itemCount: 8,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.all(8.0),
        child: EmployeeCard(tag: tag),
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

class EmployeeCard extends StatelessWidget {
  final String? tag;
  const EmployeeCard({super.key, this.tag});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
          padding: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.red[900],
              ),
              SizedBox(width: 12),
              Expanded(
                child: Container(
                  height: 75,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'employee_name',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5.0),
                      Expanded(child: Text('employee_job_postition')),
                      tag != null
                          ? Align(
                              alignment: Alignment.bottomRight,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.red.shade900,
                                  minimumSize: Size.zero,
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  padding: EdgeInsets.zero,
                                ),
                                onPressed: () {
                                  switch (tag) {
                                    case 'pending':
                                      Get.to(DSReviewResignation());
                                      break;
                                    case 'in-progress':
                                      Get.to(DSViewResignation());
                                      break;
                                    default:
                                  }
                                },
                                child: Text(tag == 'completed' || tag == 'in-progress' ? 'View' : 'Review', style: TextStyle(fontStyle: FontStyle.italic, decoration: TextDecoration.underline)),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
