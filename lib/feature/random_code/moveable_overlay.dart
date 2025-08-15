import 'package:flutter/material.dart';

class MovableWidget extends StatefulWidget {
  @override
  _MovableWidgetState createState() => _MovableWidgetState();
}

class _MovableWidgetState extends State<MovableWidget> {
  Offset _offset = Offset(0, 0);
  late double _maxX;
  late double _maxY;

  List<Offset> anchorPoints = [
    Offset(0, 0), // Top Left
    Offset(0, 0), // Bottom Left
    Offset(0, 0), // Top Right
    Offset(0, 0), // Bottom Right
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final screenWidth = MediaQuery.of(context).size.width;
      final screenHeight = MediaQuery.of(context).size.height;
      final appBarHeight = AppBar().preferredSize.height;
      final statusBarHeight = MediaQuery.of(context).padding.top;
      const double bottomNavBarHeight = kBottomNavigationBarHeight;
      const widgetSize = 100.0;

      setState(() {
        _maxX = screenWidth - widgetSize;
        _maxY = screenHeight - widgetSize - appBarHeight - statusBarHeight - bottomNavBarHeight;

        anchorPoints[1] = Offset(0, _maxY); // Bottom Left
        anchorPoints[2] = Offset(_maxX, 0); // Top Right
        anchorPoints[3] = Offset(_maxX, _maxY); // Bottom Right
      });
    });
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      double newOffsetX = _offset.dx + details.delta.dx;
      double newOffsetY = _offset.dy + details.delta.dy;

      // Perform boundary checks to limit the widget within the screen
      newOffsetX = newOffsetX.clamp(0.0, _maxX);
      newOffsetY = newOffsetY.clamp(0.0, _maxY);

      _offset = Offset(newOffsetX, newOffsetY);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movable Widget'),
      ),
      body: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            double newOffsetX = _offset.dx + details.delta.dx;
            double newOffsetY = _offset.dy + details.delta.dy;

            // Perform boundary checks to limit the widget within the screen
            newOffsetX = newOffsetX.clamp(0.0, _maxX);
            newOffsetY = newOffsetY.clamp(0.0, _maxY);

            debugPrint('size x $_maxX');
            debugPrint('size y $_maxY');

            debugPrint('x $newOffsetX');
            debugPrint('y $newOffsetY');

            _offset = Offset(newOffsetX, newOffsetY);
          });
        },
        child: Stack(
          children: [
            Positioned(
              left: _offset.dx,
              top: _offset.dy,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ),
            ...anchorPoints.map((anchorPoint) => Positioned(
                  left: anchorPoint.dx - 5,
                  top: anchorPoint.dy - 5,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _offset = anchorPoint;
                      });
                    },
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
