import 'package:flutter/material.dart';

class TestingOffsetPageTwo extends StatefulWidget {
  final Offset boxOffset;
  final Size boxSize;
  const TestingOffsetPageTwo({super.key, required this.boxOffset, required this.boxSize});

  @override
  State<TestingOffsetPageTwo> createState() => _TestingOffsetPageTwoState();
}

class _TestingOffsetPageTwoState extends State<TestingOffsetPageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child:
            // LayoutBuilder(
            //   builder: (context, constraint) {
            //     Offset centerOffset = Offset(constraint.maxWidth / 2, constraint.maxHeight / 2);
            //     return Stack(
            //       children: [
            //         Positioned(
            //           top: centerOffset.dx,
            //           left: centerOffset.dy,
            //           child: Container(
            //             height: 250,
            //             width: 375,
            //             decoration: BoxDecoration(
            //               border: Border.all(color: Colors.red, width: 2),
            //             ),
            //             child: Text(centerOffset.toString()),
            //           ),
            //         ),
            //       ],
            //     );
            //   },
            // )
            Stack(
          children: [
            Positioned(
              top: widget.boxOffset.dy,
              left: widget.boxOffset.dx,
              child: Container(
                height: 250, //widget.boxSize.height,
                width: 375, //widget.boxSize.width,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red, width: 2),
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  child: const Text('offset'),
                  onPressed: () {
                    print(widget.boxOffset.dy);
                    print(widget.boxOffset.dx);
                    print(widget.boxSize.height);
                    print(widget.boxSize.width);
                  },
                ))
          ],
        ),
      ),
      // Positioned(
      //   top: widget.boxOffset.dx,
      //   left: widget.boxOffset.dy,
      //   child:
      // ),
    );
  }
}
