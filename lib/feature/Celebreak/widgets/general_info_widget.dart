import 'package:flutter/material.dart';
import 'package:sandbox_flutter_3/feature/Celebreak/const/constant.dart';
import 'package:sandbox_flutter_3/feature/Celebreak/widgets/goals_progress_card_widget.dart';
import 'package:sandbox_flutter_3/feature/Celebreak/widgets/pie_chart_widget.dart';
import 'package:sandbox_flutter_3/feature/Celebreak/widgets/scheduled_widget.dart';
import 'package:sandbox_flutter_3/feature/Celebreak/widgets/summary_details.dart';

class GeneralInformationWidget extends StatelessWidget {
  const GeneralInformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            GoalProgressCardWidget(currentPoints: 27, targetPoints: 50)
            // Chart(),
            // Text(
            //   'Summary',
            //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            // ),
            // SizedBox(height: 16),
            // SummaryDetails(),
            // SizedBox(height: 40),
            // Scheduled(),
          ],
        ),
      ),
    );
  }
}
