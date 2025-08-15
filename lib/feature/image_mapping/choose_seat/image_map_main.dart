import 'package:flutter/material.dart';
import 'package:quiver/iterables.dart' show enumerate;
import '../choose_seat/image_map_main.dart';

class ImageMapExample extends StatelessWidget {
  final List<Path> regions = [
    Path()
      ..moveTo(78, 225) // Top-left point
      ..lineTo(375, 225) // Top-right point
      ..lineTo(375, 296) // Bottom-right point
      ..lineTo(78, 296) // Bottom-left point
      ..close(),
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
    String countryName = '';
    switch (index) {
      case 0:
        countryName = 'USA';
        break;
      case 1:
        countryName = 'Canada';
        break;
      case 2:
        countryName = 'Mexico';
        break;
    }
    print('Tapped on $countryName');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Map Example'),
      ),
      // body: Center(
      //   child: SizedBox(
      //     width: double.infinity,
      //     child: Image.asset('assets/images/world_map.png'),
      //   ),
      // )
      // body: Center(
      //   child: ImageMap(
      //     image: Image.asset('assets/images/hr_info_img.png'), // Replace with your image path.
      //     regions: regions,
      //     onTap: handleRegionTap,
      //   ),
      // ),
    );
  }
}
