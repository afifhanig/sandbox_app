import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../choose_seat/image_map.dart';

class TryPainterDrawOne extends StatefulWidget {
  const TryPainterDrawOne({super.key});

  @override
  State<TryPainterDrawOne> createState() => _TryPainterDrawOneState();
}

class _TryPainterDrawOneState extends State<TryPainterDrawOne> {
  final ScrollController _horizontal = ScrollController(), _vertical = ScrollController();
  final List<int> shades = [100, 200, 300, 400, 500, 600, 700, 800, 900];
  int counter = 0;
  String objectName = 'obj_name';
  double imageWidth = 0;
  double imageHeight = 0;
  final List<Path> regions = [
    //Path box Biru
    // Path()
    //   ..moveTo(75, 223) // First point
    //   ..lineTo(72, 296) // Second point
    //   ..lineTo(375, 299) // Third point
    //   ..lineTo(375, 228)
    //   ..close(),
    // //Path box Merah
    // Path()
    //   ..moveTo(419, 225) // First point
    //   ..lineTo(418, 296) // Second point
    //   ..lineTo(719, 295) // Third point
    //   ..lineTo(719, 226)
    //   ..close()
    //
    //Path Kasur
    Path()
      ..moveTo(92, 258) // First point
      ..lineTo(86, 487) // Second point
      ..lineTo(364, 487) // Third point
      ..lineTo(361, 252)
      ..close(),
    //Path Meja
    Path()
      ..moveTo(191, 95) // First point
      ..lineTo(191, 161) // Second point
      ..lineTo(377, 155) // Third point
      ..lineTo(377, 93)
      ..close(),
    //Path Sofa
    Path()
      ..moveTo(152, 625) // First point
      ..lineTo(149, 721) // Second point
      ..lineTo(445, 718) // Third point
      ..lineTo(444, 624)
      ..close(),
    //
    // ..moveTo(78, 225) // Top-left point
    // ..lineTo(375, 225) // Top-right point
    // ..lineTo(375, 296) // Bottom-right point
    // ..lineTo(78, 296) // Bottom-left point
    // ..close(),
    // Path for the region of USA.
    // Path()
    //   ..moveTo(80, 80)
    //   ..lineTo(120, 100)
    //   ..lineTo(120, 160)
    //   ..lineTo(60, 160)
    //   ..lineTo(40, 140)
    //   ..lineTo(40, 100)
    //   ..close(),
    // Path for the region of Canada.
    // Path()
    //   ..moveTo(140, 100)
    //   ..lineTo(200, 100)
    //   ..lineTo(200, 180)
    //   ..lineTo(140, 160)
    //   ..close(),
    // // Path for the region of Mexico.
    // Path()
    //   ..moveTo(60, 180)
    //   ..lineTo(120, 160)
    //   ..lineTo(140, 220)
    //   ..lineTo(80, 220)
    //   ..close(),
  ];

  void handleRegionTap(int index) {
    setState(() {
      switch (index) {
        case 0:
          objectName = 'Ini Kasur';
          break;
        case 1:
          objectName = 'Ini Meja';
          break;
        case 2:
          objectName = 'Ini Sofa';
          break;
        default:
          objectName = 'obj_name';
          break;
      }
    });
    debugPrint('Tapped on $objectName ${counter++}');
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final bytes = await rootBundle.load('assets/images/room_layout.jpg');
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
      //backgroundColor: Colors.red,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: Text('$objectName $counter'),
      ),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Scrollbar(
            controller: _vertical,
            thumbVisibility: true,
            //trackVisibility: true,
            thickness: 10,
            radius: const Radius.circular(10),
            child: Scrollbar(
              controller: _horizontal,
              thumbVisibility: true,
              //trackVisibility: true,
              thickness: 10,
              radius: const Radius.circular(10),
              //notificationPredicate: (notif) => notif.depth == 1,
              child: SingleChildScrollView(
                controller: _vertical,
                child: SingleChildScrollView(
                  controller: _horizontal,
                  scrollDirection: Axis.horizontal,
                  child: InteractiveViewer(
                    boundaryMargin: EdgeInsets.all(0),
                    minScale: 1.0,
                    maxScale: 3.0,
                    child: Stack(
                      children: [
                        Image.asset('assets/images/room_layout.jpg', width: imageWidth/*1000.0*/, height: imageHeight/*775.0*/),
                        // ImageMap(
                        //   image: Image.asset('assets/images/hr_info_img.png',
                        //       width: imageWidth, height: imageHeight), // Replace with your image path.
                        //   regions: regions,
                        //   onTap: handleRegionTap,
                        // ),
                        // ImageMap(
                        //   image: Image.asset('assets/images/room_layout.jpg',
                        //       width: 1000.0, height: 775.0), // Replace with your image path.
                        //   regions: regions,
                        //   onTap: handleRegionTap,
                        // ),
                        CustomPaint(
                          painter: PathPainter(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    Paint paint2 = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    //Path box Biru
    // Path path = Path();
    // // TODO: do operations here
    // //path.moveTo(size.width / 2, size.height / 2);
    // path.moveTo(75, 223); // First point
    // path.lineTo(72, 296); // Second point
    // path.lineTo(375, 299); // Third point
    // path.lineTo(375, 228);
    // path.close();
    // canvas.drawPath(path, paint);

    //Path box merah
    // Path path2 = Path();
    // path2.moveTo(419, 225); // First point
    // path2.lineTo(418, 296); // Second point
    // path2.lineTo(719, 295); // Third point
    // path2.lineTo(719, 226);
    // path2.close();
    // canvas.drawPath(path2, paint2);

    //Path Kasur
    //92,258,86,487,364,487,361,252
    Path path3 = Path();
    path3.moveTo(92, 258); // First point
    path3.lineTo(86, 487); // Second point
    path3.lineTo(364, 487); // Third point
    path3.lineTo(361, 252);
    path3.close();
    canvas.drawPath(path3, paint2);

    //Path Meja
    //191,95,191,161,377,155,377,93,
    Path path4 = Path();
    path4.moveTo(191, 95); // First point
    path4.lineTo(191, 161); // Second point
    path4.lineTo(377, 155); // Third point
    path4.lineTo(377, 93);
    path4.close();
    canvas.drawPath(path4, paint2);

    //Path Sofa
    //152,625,149,721,445,718,444,624,
    Path path5 = Path();
    path5.moveTo(152, 625); // First point
    path5.lineTo(149, 721); // Second point
    path5.lineTo(445, 718); // Third point
    path5.lineTo(444, 624);
    path5.close();
    canvas.drawPath(path5, paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

// class TryPainterDrawOne extends StatefulWidget {
//   const TryPainterDrawOne({super.key});

//   @override
//   State<TryPainterDrawOne> createState() => _TryPainterDrawOneState();
// }

// class _TryPainterDrawOneState extends State<TryPainterDrawOne> {
//   static List<List<Offset>> points = [
//     [
//       Offset(178, 152),
//       Offset(148, 179),
//       Offset(125, 173),
//       Offset(129, 191),
//       Offset(87, 191),
//       Offset(130, 226),
//       Offset(121, 270),
//       Offset(182, 285),
//       Offset(185, 272),
//       Offset(219, 276),
//       Offset(239, 260),
//       Offset(218, 225),
//       Offset(245, 186),
//     ]
//   ];
//   final List<Path> polygonRegions = points.map((e) {
//     Path p = Path();
//     p.addPolygon(e, true);
//     return p;
//   }).toList();
//   final List<Color> colors = List.generate(points.length, (index) => Color.fromRGBO(50, 50, 200, 0.5));

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//             appBar: AppBar(title: Text("flutter_image_map Example")),
//             body: ImageMap(
//               image: Image.asset('assets/images/worldmap.png'),
//               //imageSize: Size(698, 566),
//               onTap: (i) {
//                 colors[i] = colors[i] == Color.fromRGBO(50, 50, 200, 0.5)
//                     ? Color.fromRGBO(50, 200, 50, 0.5)
//                     : Color.fromRGBO(50, 50, 200, 0.5);
//                 print(i);
//                 setState(() {});
//               },
//               regions: polygonRegions,
//               //regionColors: colors,
//             )));
//   }
// }
