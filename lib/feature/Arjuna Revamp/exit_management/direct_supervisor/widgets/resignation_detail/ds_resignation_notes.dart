import 'package:flutter/material.dart';

class DSResignationNotesWidget extends StatelessWidget {
  final bool isReadOnly;
  const DSResignationNotesWidget({super.key, required this.isReadOnly});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
              'Notes (Optional)',
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
              Icon(Icons.edit_note_sharp, color: Colors.red.shade900, size: 20)
            ]
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Row(
            children: [SizedBox(width: 20), Text('Resign dilakukan tanpa paksaan')],
          ),
        ),
      ],
    );
  }
}
