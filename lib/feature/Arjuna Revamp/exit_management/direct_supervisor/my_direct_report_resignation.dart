import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/component/arjuna_appbar.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/exit_management/direct_supervisor/ds_emp_under_supervision_detail.dart';

class MyDirectReportResignation extends StatelessWidget {
  const MyDirectReportResignation({super.key});

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              // alignment: Alignment.center,
              children: <Widget>[
                //Background
                Container(
                  height: 200.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: Image.asset("assets/images/group.png").image,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
                ),

                Container(
                  margin: EdgeInsets.symmetric(vertical: 30),
                  child: Column(
                    children: [
                      widgetMyTeamResignation('My Team Resignation'),
                      SizedBox(height: 30),
                      widgetMyTeamResignation('My HR Transaction'),
                      SizedBox(height: 30),
                      widgetEmpUnderSupervision(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  widgetMyTeamResignation(String title) {
    return Container(
      height: 120,
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
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
                        title,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    child: Text(
                      "See Detail",
                      style: TextStyle(
                        color: Colors.red,
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "0",
                        style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 80,
                          child: Text(
                            "In Progress",
                            overflow: TextOverflow.visible,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: VerticalDivider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "0",
                      style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 80,
                        child: Text(
                          "Completed",
                          overflow: TextOverflow.visible,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                  child: VerticalDivider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "0",
                      style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        color: Colors.transparent,
                        width: 80,
                        child: Text(
                          "Pending Approval",
                          overflow: TextOverflow.visible,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  widgetEmpUnderSupervision() {
    return Container(
      height: 175,
      margin: EdgeInsets.symmetric(horizontal: 15),
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
                GestureDetector(
                  onTap: () {
                    Get.to(DSEmpUnderSupervisionDetail());
                  },
                  child: Container(
                    child: Text(
                      "See Detail",
                      style: TextStyle(
                        color: Colors.red,
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                )
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
}
