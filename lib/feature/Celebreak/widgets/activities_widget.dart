import 'package:flutter/material.dart';
import 'package:sandbox_flutter_3/feature/Celebreak/util/responsive.dart';
import 'package:sandbox_flutter_3/feature/Celebreak/widgets/activity_details_card.dart';
import 'package:sandbox_flutter_3/feature/Celebreak/widgets/header_widget.dart';
import 'package:sandbox_flutter_3/feature/Celebreak/widgets/general_info_widget.dart';

class ActivitiesWidget extends StatelessWidget {
  const ActivitiesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 7,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 18),
                  const HeaderWidget(),
                  const SizedBox(height: 18),
                  const ActivityDetailsCard(),
                  const SizedBox(height: 18),
                  if (Responsive.isTablet(context)) const GeneralInformationWidget(),
                ],
              ),
            ),
          ),
        ),
        if (Responsive.isDesktop(context))
          Expanded(
            flex: 3,
            child: GeneralInformationWidget(),
          ),
      ],
    );
  }
}
