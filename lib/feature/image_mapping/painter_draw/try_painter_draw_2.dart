import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../choose_seat/image_map.dart';
import 'dart:io';

class TryPainterDrawTwo extends StatefulWidget {
  const TryPainterDrawTwo({super.key});

  @override
  State<TryPainterDrawTwo> createState() => _TryPainterDrawOneState();
}

class _TryPainterDrawOneState extends State<TryPainterDrawTwo> {
  final ScrollController _horizontal = ScrollController(), _vertical = ScrollController();
  int counter = 0;
  String objectName = 'obj_name';
  double imageWidth = 0;
  double imageHeight = 0;
  final String coordinateJson = '''
  {
    "data": [
      {
        "regionTap": "This is desk_1",
        "coordinate": "162.57555421043799,202.53247318411394,182.60427712574392,242.17265395399028"
      },
      {
        "regionTap": "This is desk_2",
        "coordinate": "207.64018076987634,202.94973824484947,228.08616874591786,241.75538889325475"
      },
      {
        "regionTap": "This is desk_3",
        "coordinate": "245.61130129681055,272.2157383269492,265.6400242121165,311.02138897535445"
      }
    ]
  }
  ''';

  final String coordinateJsonTwo = '''
  {
    "deskListDto": [
      {
        "id": 1,
        "number": "D001",
        "status": "AVAILABLE",
        "coordinate0": "162.98",
        "coordinate1": "202.505",
        "coordinate2": "181.655",
        "coordinate3": "240.865"

      },
      {
        "id": 2,
        "number": "D002",
        "status": "AVAILABLE",
        "coordinate0": "207.396",
        "coordinate1": "203.0104",
        "coordinate2": "227.586",
        "coordinate3": "240.865"

      }
    ]
  }
  ''';

  List<Map<String, dynamic>> regionsData = [];
  List<String> selectedRegionTaps = [];
  //
  final events = [];
  bool canScroll = true;

  bool isSkrolling = false;

  late Uint8List imageLayoutMemory;

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final bytes = await rootBundle.load('assets/images/floor_layout.jpg');
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
    final Map<String, dynamic> jsonData = json.decode(coordinateJsonTwo);
    // imageLayoutMemory = const Base64Decoder().convert(jsonData['layout']);
    // getImageSize(imageLayoutMemory);
    final List<dynamic> data = jsonData['deskListDto'];

    for (final dataItem in data) {
      final String regionTap = dataItem['number'];
      final String status = dataItem['status'];
      final String coordinate0 = dataItem['coordinate0'];
      final String coordinate1 = dataItem['coordinate1'];
      final String coordinate2 = dataItem['coordinate2'];
      final String coordinate3 = dataItem['coordinate3'];
      final Rect regionRect = getAreaFromCoordinateString(coordinate0, coordinate1, coordinate2, coordinate3);

      regionsData.add({
        'path': regionRect,
        'regionTap': regionTap,
        'status': status,
        'selected': false, // Initialize selected state as false
      });
    }
  }

  getImageSize(Uint8List source) async {
    var decImg = await decodeImageFromList(source);
    setState(() {
      imageHeight = decImg.height.toDouble();
      imageWidth = decImg.width.toDouble();
    });
  }

  Rect getAreaFromCoordinateString(String coordinate0, String coordinate1, String coordinate2, String coordinate3) {
    // final List<String> coordinateValues = coordinateString.split(',');

    // if (coordinateValues.length != 4) {
    //   throw ArgumentError('Invalid number of coordinates for Rect');
    // }

    final double left = double.parse(coordinate0);
    final double top = double.parse(coordinate1);
    final double right = double.parse(coordinate2);
    final double bottom = double.parse(coordinate3);

    return Rect.fromLTRB(left, top, right, bottom);
  }

  void handleRegionTap(int index) {
    print('here iam ++>>> $isSkrolling');
    print(regionsData[index]['status']);
    if (!isSkrolling) {
      if (regionsData[index]['status'] == 'AVAILABLE') {
        setState(() {
          objectName = regionsData[index]['regionTap'];
          regionsData[index]['selected'] = !regionsData[index]['selected'];
          counter++;

          selectedRegionTaps =
              regionsData.where((data) => data['selected']).map<String>((data) => data['regionTap']).toList();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.amber,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        //title: Text('$objectName $counter'),
        title: Text('Selected: ${selectedRegionTaps}'),
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
              thickness: 10,
              radius: const Radius.circular(10),
              notificationPredicate: (notif) => notif.depth == 1,
              child: SingleChildScrollView(
                physics: canScroll ? const ScrollPhysics() : const NeverScrollableScrollPhysics(),
                controller: _vertical,
                child: SingleChildScrollView(
                  physics: canScroll ? const ScrollPhysics() : const NeverScrollableScrollPhysics(),
                  controller: _horizontal,
                  scrollDirection: Axis.horizontal,
                  child: Listener(
                    onPointerDown: (event) {
                      events.add(event.pointer);
                      print('new event');
                    },
                    onPointerMove: (event) {
                      if (events.length == 2) {
                        setState(() {
                          canScroll = false;
                          isSkrolling = true;
                        });
                      } else {
                        setState(() {
                          isSkrolling = true;
                        });
                      }
                    },
                    onPointerUp: (event) {
                      events.clear();
                      print("events cleared");
                      setState(() {
                        canScroll = true;
                        isSkrolling = false;
                      });
                    },
                    child: InteractiveViewer(
                      boundaryMargin: const EdgeInsets.all(0),
                      minScale: 1.0,
                      maxScale: 3.0,
                      child: ImageMap(
                        image:
                            // Image.memory(
                            //   imageLayoutMemory,
                            //   width: imageWidth,
                            //   height: imageHeight,
                            // ),
                            Image.asset('assets/images/floor_layout.jpg',
                                width: imageWidth, height: imageHeight), // Replace with your image path.
                        regions: regionsData.map<Rect>((data) => data['path']).toList(),
                        onTap: handleRegionTap,
                        status: regionsData.map<String>((data) => data['status']).toList(),
                        selectedRegions: regionsData.map<bool>((data) => data['selected']).toList(),
                      ),
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
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

// class TryPainterDrawTwo extends StatefulWidget {
//   const TryPainterDrawTwo({super.key});

//   @override
//   State<TryPainterDrawTwo> createState() => _TryPainterDrawOneState();
// }

// class _TryPainterDrawOneState extends State<TryPainterDrawTwo> {
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

// final List<Path> regions = [
//     //Path box Biru
//     // Path()
//     //   ..moveTo(75, 223) // First point
//     //   ..lineTo(72, 296) // Second point
//     //   ..lineTo(375, 299) // Third point
//     //   ..lineTo(375, 228)
//     //   ..close(),
//     // //Path box Merah
//     // Path()
//     //   ..moveTo(419, 225) // First point
//     //   ..lineTo(418, 296) // Second point
//     //   ..lineTo(719, 295) // Third point
//     //   ..lineTo(719, 226)
//     //   ..close()
//     //
//     //Path Kasur
//     // Path()
//     //   ..moveTo(92, 258) // First point
//     //   ..lineTo(86, 487) // Second point
//     //   ..lineTo(364, 487) // Third point
//     //   ..lineTo(361, 252)
//     //   ..close(),
//     // //Path Meja
//     // Path()
//     //   ..moveTo(191, 95) // First point
//     //   ..lineTo(191, 161) // Second point
//     //   ..lineTo(377, 155) // Third point
//     //   ..lineTo(377, 93)
//     //   ..close(),
//     // //Path Sofa
//     // Path()
//     //   ..moveTo(152, 625) // First point
//     //   ..lineTo(149, 721) // Second point
//     //   ..lineTo(445, 718) // Third point
//     //   ..lineTo(444, 624)
//     //   ..close(),
//     //
//     // ..moveTo(78, 225) // Top-left point
//     // ..lineTo(375, 225) // Top-right point
//     // ..lineTo(375, 296) // Bottom-right point
//     // ..lineTo(78, 296) // Bottom-left point
//     // ..close(),
//     // Path for the region of USA.
//     // Path()
//     //   ..moveTo(80, 80)
//     //   ..lineTo(120, 100)
//     //   ..lineTo(120, 160)
//     //   ..lineTo(60, 160)
//     //   ..lineTo(40, 140)
//     //   ..lineTo(40, 100)
//     //   ..close(),
//     // Path for the region of Canada.
//     // Path()
//     //   ..moveTo(140, 100)
//     //   ..lineTo(200, 100)
//     //   ..lineTo(200, 180)
//     //   ..lineTo(140, 160)
//     //   ..close(),
//     // // Path for the region of Mexico.
//     // Path()
//     //   ..moveTo(60, 180)
//     //   ..lineTo(120, 160)
//     //   ..lineTo(140, 220)
//     //   ..lineTo(80, 220)
//     //   ..close(),
//   ];
