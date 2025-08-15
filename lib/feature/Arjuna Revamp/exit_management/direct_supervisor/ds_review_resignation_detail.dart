import 'package:flutter/material.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/component/arjuna_appbar.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/component/dashed_line.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/exit_management/direct_supervisor/widgets/resignation_detail/ds_resignation_action.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/exit_management/direct_supervisor/widgets/resignation_detail/ds_resignation_application.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/exit_management/direct_supervisor/widgets/resignation_detail/ds_resignation_document.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/exit_management/direct_supervisor/widgets/resignation_detail/ds_resignation_notes.dart';

class DSReviewResignation extends StatefulWidget {
  const DSReviewResignation({super.key});

  @override
  State<DSReviewResignation> createState() => _DSReviewResignationState();
}

class _DSReviewResignationState extends State<DSReviewResignation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: ArjunaAppBar(
          label: "Resignation",
          centerTitle: false,
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.red.shade100,
              height: MediaQuery.of(context).size.height / 5,
              width: double.infinity,
              child: const Padding(
                padding: EdgeInsets.only(left: 25.0, bottom: 16.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Termination',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: Divider(
                color: Colors.red[900],
                height: 0,
                thickness: 2,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.0, top: 16.0, right: 30.0),
              child: DSResignationApplicationWidget(isReadOnly: false),
            ),
            Padding(padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 12.0), child: LineDashWidget()),

            //
            Padding(
              padding: EdgeInsets.only(left: 30.0, top: 16.0, right: 30.0),
              child: DSResignationDocumentWidget(isReadOnly: false),
            ),
            Padding(padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 12.0), child: LineDashWidget()),

            //
            Padding(
              padding: EdgeInsets.only(left: 30.0, top: 16.0, right: 30.0),
              child: DSResignationNotesWidget(isReadOnly: false),
            ),

            Spacer(),
            Padding(
              padding: EdgeInsets.only(left: 30.0, top: 16.0, right: 30.0, bottom: 20.0),
              child: DSResignationActionWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
