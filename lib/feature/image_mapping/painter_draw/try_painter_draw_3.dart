import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TryPainterDrawThird extends StatefulWidget {
  const TryPainterDrawThird({super.key});

  @override
  State<TryPainterDrawThird> createState() => _TryPainterDrawThirdState();
}

class _TryPainterDrawThirdState extends State<TryPainterDrawThird> {
  double imageWidth = 0;
  double imageHeight = 0;
  final ScrollController _horizontal = ScrollController(), _vertical = ScrollController();
  final events = [];
  bool canScroll = true;
  bool tapped = false;
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final bytes = await rootBundle.load('assets/images/floor_layout.jpg');
      //final bytes = await rootBundle.load('assets/images/hr_info_img.png');
      final list = bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
      var decodedImage = await decodeImageFromList(list);
      print(decodedImage.width);
      print(decodedImage.height);
      setState(() {
        imageHeight = decodedImage.height.toDouble();
        imageWidth = decodedImage.width.toDouble();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('data'),
      ),
      body: Center(
        child: SizedBox(
          //height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: canScroll ? ScrollPhysics() : NeverScrollableScrollPhysics(),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: canScroll ? ScrollPhysics() : NeverScrollableScrollPhysics(),
                  child: Listener(
                    onPointerDown: (event) {
                      events.add(event.pointer);
                      print('new event');
                    },
                    onPointerUp: (event) {
                      events.clear();
                      print("events cleared");
                      setState(() {
                        canScroll = true;
                      });
                    },
                    onPointerMove: (event) {
                      if (events.length == 2) {
                        setState(() {
                          canScroll = false;
                        });
                      }
                    },
                    child: InteractiveViewer(
                      boundaryMargin: const EdgeInsets.all(0),
                      minScale: 1.0,
                      maxScale: 3.0,
                      child: Image.asset('assets/images/floor_layout.jpg',
                          width: imageWidth /*1000.0*/, height: imageHeight /*775.0*/),
                    ),
                  ),
                ),
              ),
              // GestureDetector(
              //   behavior: HitTestBehavior.translucent,
              //   onTapDown: (details) {
              //     print(details);
              //     setState(() {
              //       tapped = !tapped;
              //     });
              //   },
              //   child: IgnorePointer(
              //     child: Center(
              //       child: Container(
              //         height: 50,
              //         width: 50,
              //         color: tapped ? Colors.amber : Colors.red,
              //       ),
              //     ),
              //   ),
              // )
              CustomPaint(
                painter: RectanglePainter(),
                size: Size(400, 400), // Adjust the size as needed
              ),
            ],
          ),
        ),
      ),
      //   Center(
      // child: SizedBox(
      //   height: MediaQuery.of(context).size.height,
      //   child: Scrollbar(
      //     controller: _vertical,
      //     thumbVisibility: true,
      //     //trackVisibility: true,
      //     thickness: 10,
      //     radius: const Radius.circular(10),
      //     child: Scrollbar(
      //       controller: _horizontal,
      //       thumbVisibility: true,
      //       //trackVisibility: true,
      //       thickness: 10,
      //       radius: const Radius.circular(10),
      //       notificationPredicate: (notif) => notif.depth == 1,
      //       child: SingleChildScrollView(
      //         controller: _vertical,
      //         child: SingleChildScrollView(
      //           controller: _horizontal,
      //           scrollDirection: Axis.horizontal,
      //           child: InteractiveViewer(
      //             constrained: false,
      //             boundaryMargin: const EdgeInsets.all(0),
      //             minScale: 1.0,
      //             maxScale: 3.0,
      //             child: Stack(
      //               children: [
      //                 Image.asset('assets/images/floor_layout.jpg',
      //                     width: imageWidth /*1000.0*/, height: imageHeight /*775.0*/),
      //                 CustomPaint(
      //                   painter: RectanglePainter(),
      //                   //size: Size(400, 400), // Adjust the size as needed
      //                 ),
      //                 //Image.asset('assets/images/room_layout.jpg', width: imageWidth/*1000.0*/, height: imageHeight/*775.0*/),
      //                 // ImageMap(
      //                 //   image: Image.asset('assets/images/hr_info_img.png',
      //                 //       width: imageWidth, height: imageHeight), // Replace with your image path.
      //                 //   regions: regions,
      //                 //   onTap: handleRegionTap,
      //                 // ),
      //                 // ImageMap(
      //                 //   image: Image.asset('assets/images/room_layout.jpg',
      //                 //       width: imageWidth, height: imageHeight), // Replace with your image path.
      //                 //   regions: regionsData.map<Path>((data) => data['path']).toList(),
      //                 //   onTap: handleRegionTap,
      //                 //   selectedRegions: regionsData.map<bool>((data) => data['selected']).toList(),
      //                 // ),
      //                 // CustomPaint(
      //                 //   painter: PathPainter(),
      //                 // ),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}

class RectanglePainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(
      207.396,
      203.0104,
      227.586,
      240.865,
    );

    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
