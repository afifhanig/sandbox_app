import 'package:flutter/material.dart';

class DSResignationDocumentWidget extends StatelessWidget {
  final bool isReadOnly;
  const DSResignationDocumentWidget({super.key, required this.isReadOnly});

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
              'Resignation Document',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
            Spacer(),
            if(!isReadOnly)...[
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

        //
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Row(
            children: [
              SizedBox(width: 20),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red.shade900,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: EdgeInsets.zero,
                ),
                onPressed: () {},
                child: Text(
                  'document_name.pdf',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
              Spacer(),
              Icon(Icons.download_rounded, color: Colors.red.shade900, size: 20)
            ],
          ),
        ),

        //Padding(padding: const EdgeInsets.only(top: 12.0), child: LineDashWidget()),
      ],
    );
  }
}
