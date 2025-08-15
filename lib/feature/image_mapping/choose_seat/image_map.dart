import 'package:flutter/material.dart';
import 'package:quiver/iterables.dart' show enumerate;

class ImageMap extends StatelessWidget {
  const ImageMap({
    Key? key,
    required this.image,
    required this.onTap,
    required this.regions,
    required this.selectedRegions,
    required this.status,
  }) : super(key: key);

  final Widget image;
  final List<Rect> regions;
  final List<bool> selectedRegions;
  final List<String> status;

  /// Callback that will be invoked with the index of the tapped region.
  final void Function(int) onTap;

  //

  void _onTap(BuildContext context, Offset globalPosition) {
    RenderObject renderBox = context.findRenderObject() as RenderObject;
    if (renderBox is RenderBox) {
      final localPosition = renderBox.globalToLocal(globalPosition);
      for (final indexedRegion in enumerate(regions)) {
        if (indexedRegion.value.contains(localPosition)) {
          onTap(indexedRegion.index);
          return;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => _onTap(context, details.globalPosition),
      child: Stack(
        children: [
          image,
          CustomPaint(
            painter: RegionPainter(regions, selectedRegions, status), // Use a custom painter to draw regions
          ),
        ],
      ),
    );
  }
}

class RegionPainter extends CustomPainter {
  final List<Rect> regions;
  final List<bool> selectedRegions;
  final List<String> status;

  RegionPainter(this.regions, this.selectedRegions, this.status);

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < regions.length; i++) {
      final Rect regionRect = regions[i];
      final isSelected = selectedRegions[i];
      final String statusval = status[i];
      final paint = Paint()
        ..color = statusval == 'BOOKED'
            ? Colors.grey
            : isSelected
                ? Colors.yellow
                : Colors.green;

      canvas.drawRect(regionRect, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
