import 'package:flutter/material.dart';

class DSResignationActionWidget extends StatelessWidget {
  const DSResignationActionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              side: BorderSide(
                color: Colors.red.shade900,
              ),
            ),
            child: Text(
              'Reject',
              style: TextStyle(color: Colors.red.shade900),
            ),
          ),
        ),
        SizedBox(width: 18),
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade900,
              side: BorderSide(
                color: Colors.red.shade900,
              ),
            ),
            child: Text(
              'Submit',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
