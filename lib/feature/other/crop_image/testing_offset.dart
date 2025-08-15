import 'package:flutter/material.dart';
import 'package:sandbox_flutter_3/feature/other/crop_image/testing_offeset_page_two.dart';

class TestingOffset extends StatefulWidget {
  const TestingOffset({super.key});

  @override
  State<TestingOffset> createState() => _TestingOffsetState();
}

class _TestingOffsetState extends State<TestingOffset> {
  final _key = GlobalKey();

  double xPosition = 0.00;
  double yPosition = 0.00;
  double objHeight = 0.00;
  double objWidth = 0.00;
  double objAspectRatio = 0.00;

  Offset? boxOffsets;
  Size? boxSize;

  void _getPosition() {
    RenderBox? box = _key.currentContext!.findRenderObject() as RenderBox?;

    //Offset position = box!.localToGlobal(Offset.zero);

    setState(() {
      // xPosition = position.dx;
      // yPosition = position.dy;
      boxOffsets = box!.localToGlobal(Offset.zero);
    });
  }

  _getSizes() {
    RenderBox? renderBoxRed = _key.currentContext!.findRenderObject() as RenderBox?;
    //final sizeRed = renderBoxRed!.size;
    //print("SIZE of Red: $sizeRed");
    setState(() {
      // objHeight = sizeRed.height;
      // objWidth = sizeRed.width;
      // objAspectRatio = sizeRed.aspectRatio;
      boxSize = renderBoxRed!.size;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            cameraOverlay(padding: 20, aspectRatio: 1.5, color: Color(0x55000000)),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Container(
                  //   width: 100,
                  //   height: 100,
                  //   color: Colors.green,
                  //   padding: EdgeInsets.all(8.0),
                  //   key: _key,
                  // ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.lightBlue[900],
                        padding: EdgeInsets.all(6),
                        textStyle: TextStyle(fontSize: 20),
                      ),
                      child: Text('Get X and Y Position of Widget'),
                      onPressed: () {
                        _getPosition();
                        _getSizes();
                      },
                    ),
                  ),
                  //ktpOverlay(context, _key),
                  Text(
                    boxOffsets != null ? 'X Position : ${boxOffsets!.dx.toString()}' : '',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    boxOffsets != null ? 'Y Position : ${boxOffsets!.dy.toString()}' : '',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    boxSize != null ? 'Height Size : ${boxSize!.height.toString()}' : '',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    boxSize != null ? 'Width Size : ${boxSize!.width.toString()}' : '',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    boxSize != null ? 'Aspect Ratio : ${boxSize!.aspectRatio.toString()}' : '',
                    style: TextStyle(fontSize: 24),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.lightBlue[900],
                        padding: EdgeInsets.all(6),
                        textStyle: TextStyle(fontSize: 20),
                      ),
                      child: Text('Go to'),
                      onPressed: () {
                        boxOffsets != null && boxSize != null
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TestingOffsetPageTwo(boxOffset: boxOffsets!, boxSize: boxSize!)),
                              )
                            : print('both of them null');
                      },
                    ),
                  ),
                ],
              ),
            ),
            // boxOffsets != null
            //     ? Positioned(
            //         top: boxOffsets!.dy,
            //         left: boxOffsets!.dx,
            //         child: Container(
            //           height: boxSize!.height,
            //           width: boxSize!.width,
            //           decoration: BoxDecoration(
            //             border: Border.all(color: Colors.blue, width: 2),
            //           ),
            //         ),
            //       )
            //     : Container(),
          ],
        ),
      ),
    );
  }

  Widget ktpOverlay(BuildContext context, Key key) {
    return SizedBox(
      //key: key,
      height: MediaQuery.of(context).size.height / 3.7,
      width: MediaQuery.of(context).size.height / 2.3,
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: Colors.grey.shade300,
            width: 4,
          ),
        ),
      ),
    );
  }

  Widget cameraOverlay({required double padding, required double aspectRatio, required Color color}) {
    return LayoutBuilder(builder: (context, constraints) {
      double parentAspectRatio = constraints.maxWidth / constraints.maxHeight;
      double horizontalPadding;
      double verticalPadding;

      print(parentAspectRatio);
      print(constraints.maxWidth);
      print(constraints.maxHeight);

      if (parentAspectRatio < aspectRatio) {
        print('1');
        horizontalPadding = padding;
        verticalPadding = (constraints.maxHeight - ((constraints.maxWidth - 2 * padding) / aspectRatio)) / 2;
      } else {
        print('2');
        verticalPadding = padding;
        horizontalPadding = (constraints.maxWidth - ((constraints.maxHeight - 2 * padding) * aspectRatio)) / 2;
      }

      print(horizontalPadding);
      print(verticalPadding);

      return Stack(
        fit: StackFit.loose,
        children: [
          Align(alignment: Alignment.centerLeft, child: Container(width: horizontalPadding, color: Colors.blue)),
          Align(alignment: Alignment.centerRight, child: Container(width: horizontalPadding, color: color)),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
                margin: EdgeInsets.only(left: horizontalPadding, right: horizontalPadding),
                height: verticalPadding,
                color: Colors.amber),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                margin: EdgeInsets.only(left: horizontalPadding, right: horizontalPadding),
                height: verticalPadding,
                color: color),
          ),
          Align(
            //bottom: boxOffsets!.dy,
            alignment: Alignment.center,
            child: Container(
              key: _key,
              height: 250,
              width: 375,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red, width: 2),
              ),
            ),
          )
        ],
      );
    });
  }
}
