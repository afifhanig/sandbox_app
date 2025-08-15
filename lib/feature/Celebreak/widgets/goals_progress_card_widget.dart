import 'package:flutter/material.dart';

class GoalProgressCardWidget extends StatelessWidget {
  final int currentPoints;
  final int targetPoints;

  GoalProgressCardWidget({required this.currentPoints, required this.targetPoints});

  @override
  Widget build(BuildContext context) {
    double progress = currentPoints / targetPoints;

    return Card(
      margin: EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Color(0xFFB2E0F9), // Light blue color
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "You’re close to your goal!",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(child: x()),
                SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(
                    value: progress,
                    strokeWidth: 7,
                    backgroundColor: Colors.white,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                ),
                // Expanded(
                //   child: Container(
                //     color: Colors.amber,
                //     child: Stack(
                //       alignment: Alignment.center,
                //       children: [
                //         CircularProgressIndicator(
                //           value: progress,
                //           strokeWidth: 6,
                //           backgroundColor: Colors.white,
                //           valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                //         ),
                //         Text(
                //           '$currentPoints',
                //           style: TextStyle(
                //             fontSize: 20,
                //             fontWeight: FontWeight.bold,
                //             color: Colors.black,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
            //SizedBox(height: 16),
            // Row(
            //   children: [
            //     CircularProgressIndicator(
            //       value: progress,
            //       strokeWidth: 6,
            //       backgroundColor: Colors.white,
            //       valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            //     ),
            //     SizedBox(width: 16),
            //     Text(
            //       '$currentPoints',
            //       style: TextStyle(
            //         fontSize: 36,
            //         fontWeight: FontWeight.bold,
            //         color: Colors.black,
            //       ),
            //     ),
            //     SizedBox(width: 8),
            //     Text(
            //       '/ $targetPoints',
            //       style: TextStyle(
            //         fontSize: 14,
            //         color: Colors.black.withOpacity(0.6),
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  x() {
    return Column(
      children: [
        Text(
          "Join more sport activities to collect more points",
          style: TextStyle(
            fontSize: 12,
            color: Colors.black.withOpacity(0.6),
          ),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: [
        //     ElevatedButton(
        //       onPressed: () {},
        //       style: ElevatedButton.styleFrom(
        //         primary: Colors.black,
        //         onPrimary: Colors.white,
        //         padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        //       ),
        //       child: Text("Join now"),
        //     ),
        //     ElevatedButton(
        //       onPressed: () {},
        //       style: ElevatedButton.styleFrom(
        //         primary: Colors.white,
        //         onPrimary: Colors.black,
        //         padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        //         side: BorderSide(color: Colors.black),
        //       ),
        //       child: Text("My points"),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
