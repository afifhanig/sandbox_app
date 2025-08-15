import 'package:flutter/material.dart';

class DSResignationApplicationWidget extends StatelessWidget {
  final bool isReadOnly;
  const DSResignationApplicationWidget({super.key, required this.isReadOnly});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.25), // border color
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 10),
            Text(
              'Resignation Application',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
            Spacer(),
            if (!isReadOnly) ...[
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red.shade900,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: EdgeInsets.zero,
                ),
                onPressed: () {},
                child: Text(
                  'Edit',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
              SizedBox(width: 3.0),
              Icon(Icons.edit_note_sharp, color: Colors.red.shade900, size: 20),
            ]
          ],
        ),

        //
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Row(
            children: [SizedBox(width: 20), Text('Resignation Notification Date'), Spacer(), Text('13/04/2024', style: TextStyle(color: Colors.grey))],
          ),
        ),

        //
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Row(
            children: [SizedBox(width: 20), Text('Effective Resignation Date'), Spacer(), Text('13/03/2024', style: TextStyle(color: Colors.grey))],
          ),
        ),

        //
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Row(
            children: [SizedBox(width: 20), Text('Phone Number'), Spacer(), Text('081267859876', style: TextStyle(color: Colors.grey))],
          ),
        ),

        //
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Row(
            children: [SizedBox(width: 20), Text('Personal Email Address'), Spacer(), Text('josh@gmail.com', style: TextStyle(color: Colors.grey))],
          ),
        ),

        //
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Row(
            children: [SizedBox(width: 20), Text('Leaving Reason'), Spacer(), Text('Normal Resignation', style: TextStyle(color: Colors.grey))],
          ),
        ),

        //
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Row(
            children: [SizedBox(width: 20), Text('Reason Detail'), Spacer(), Text('Personal Matters', style: TextStyle(color: Colors.grey))],
          ),
        ),

        //Padding(padding: const EdgeInsets.only(top: 12.0), child: LineDashWidget()),
      ],
    );
  }
}
