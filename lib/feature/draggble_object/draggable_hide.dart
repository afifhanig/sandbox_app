import 'package:flutter/material.dart';

class DraggableHide extends StatefulWidget {
  @override
  State<DraggableHide> createState() => _DraggableHideState();
}

class _DraggableHideState extends State<DraggableHide> {
  bool isObjectVisible = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Container(
                color: Colors.grey[300],
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              top: 0,
              bottom: 0,
              right: isObjectVisible ? 0 : -50,
              width: 100,
              child: Container(
                color: Colors.blue,
                width: 50,
                height: 50,
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              top: MediaQuery.of(context).size.height / 2,
              right: isObjectVisible ? 75 : 25,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isObjectVisible = !isObjectVisible;
                  });
                },
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     home: Scaffold(
  //       body: Center(
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             ElevatedButton(
  //               onPressed: () {
  //                 setState(() {
  //                   // Toggle the visibility of the object
  //                   isObjectVisible = !isObjectVisible;
  //                 });
  //               },
  //               child: Text('Toggle Object'),
  //             ),
  //             SizedBox(height: 16),
  //             Stack(
  //               children: [
  //                 Container(
  //                   color: Colors.grey[300],
  //                   height: 200,
  //                   width: 200,
  //                 ),
  //                 AnimatedPositioned(
  //                   duration: Duration(milliseconds: 500),
  //                   left: isObjectVisible ? 0 : -50,
  //                   child: Container(
  //                     color: Colors.blue,
  //                     height: 200,
  //                     width: 100,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}

// class DraggableObject extends StatefulWidget {
//   @override
//   _DraggableObjectState createState() => _DraggableObjectState();
// }

// class _DraggableObjectState extends State<DraggableObject> {
//   Color _boxColor = Colors.blue;
//   double _x = 0.0;
//   double _y = 0.0;
//   double _screenWidth = 0.0;
//   double _screenHeight = 0.0;

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _screenWidth = MediaQuery.of(context).size.width;
//       _screenHeight = MediaQuery.of(context).size.height;

//       // Set initial position to middle right
//       setState(() {
//         _x = _screenWidth - 100;
//         _y = (_screenHeight - 100) / 2;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Positioned(
//           left: _x,
//           top: _y,
//           child: Draggable(
//             feedback: Container(
//               width: 100,
//               height: 100,
//               color: _boxColor.withOpacity(0.5),
//             ),
//             childWhenDragging: Container(),
//             child: Container(
//               width: 100,
//               height: 100,
//               color: _boxColor,
//             ),
//             onDragStarted: () {
//               setState(() {
//                 _boxColor = Colors.red;
//               });
//             },
//             onDraggableCanceled: (_, __) {
//               setState(() {
//                 _boxColor = Colors.blue;
//               });
//             },
//             onDragUpdate: (details) {
//               setState(() {
//                 // Calculate the new position while respecting boundaries
//                 _x = details.localPosition.dx.clamp(0, _screenWidth - 100);
//                 _y = details.localPosition.dy.clamp(0, _screenHeight - 100);

//                 // Adjust the position to hide half of the body at screen boundaries
//                 if (_x < 0) {
//                   _x = -50;
//                 } else if (_x > _screenWidth - 100) {
//                   _x = _screenWidth - 50;
//                 }

//                 if (_y < 0) {
//                   _y = -50;
//                 } else if (_y > _screenHeight - 100) {
//                   _y = _screenHeight - 50;
//                 }
//               });
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
