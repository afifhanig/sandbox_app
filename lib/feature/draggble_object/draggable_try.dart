import 'package:flutter/material.dart';

class DraggableApp extends StatefulWidget {
  @override
  State<DraggableApp> createState() => _DraggableAppState();
}

class _DraggableAppState extends State<DraggableApp> {
  GlobalKey<_DraggableObjectState> globalKey = GlobalKey();
  final _listView = <Widget>[
    Container(),
    Container(),
    Container(),
    //const Rumah(),
    // TableCalendarEx(),
    // RemoveEntryPage(),
  ];
  int currentIndex = 0;
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('Draggable Object'),
        // ),
        body: Center(
          child: DraggableObject(
            screenWidth: MediaQuery.of(context).size.width,
            screenHeight: MediaQuery.of(context).size.height - kBottomNavigationBarHeight,
          ),
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //   currentIndex: currentIndex,
        //   type: BottomNavigationBarType.fixed,
        //   onTap: (index) {
        //     currentIndex = index;
        //     _pageController.jumpToPage(index);
        //   },
        //   items: const [
        //     BottomNavigationBarItem(
        //         activeIcon: Icon(Icons.home, color: Colors.blue),
        //         icon: Icon(Icons.home, color: Colors.grey),
        //         label: "Home"),
        //     BottomNavigationBarItem(
        //         activeIcon: Icon(Icons.car_rental, color: Colors.blue),
        //         icon: Icon(Icons.car_rental, color: Colors.grey),
        //         label: "Another"),
        //     BottomNavigationBarItem(
        //         activeIcon: Icon(Icons.car_rental, color: Colors.blue),
        //         icon: Icon(Icons.car_rental, color: Colors.grey),
        //         label: "Another2"),
        //   ],
        // ),
      ),
    );
  }
}

class DraggableObject extends StatefulWidget {
  final double screenWidth;
  final double screenHeight;
  const DraggableObject({super.key, required this.screenWidth, required this.screenHeight});

  @override
  _DraggableObjectState createState() => _DraggableObjectState();
}

class _DraggableObjectState extends State<DraggableObject> {
  Color _boxColor = Colors.blue;
  double _x = 0.0;
  double _y = 0.0;
  double _screenWidth = 0.0;
  double _screenHeight = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _screenWidth = widget.screenWidth; //MediaQuery.of(context).size.width;
      _screenHeight = widget.screenHeight;
      //MediaQuery.of(context).size.height - kBottomNavigationBarHeight - MediaQuery.of(context).padding.top;

      print(kBottomNavigationBarHeight);

      setState(() {
        _x = _screenWidth - 100;
        _y = (_screenHeight - 100);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: _x,
          top: _y,
          child: Draggable(
            feedback: Container(
              width: 100,
              height: 100,
              color: _boxColor.withOpacity(0.5),
            ),
            childWhenDragging: Container(),
            child: Container(
              width: 100,
              height: 100,
              color: _boxColor,
            ),
            onDragStarted: () {
              setState(() {
                _boxColor = Colors.red;
              });
            },
            onDraggableCanceled: (_, __) {
              setState(() {
                _boxColor = Colors.blue;
              });
            },
            onDragEnd: (details) {
              setState(() {
                // Calculate the new position while respecting boundaries
                _x = details.offset.dx.clamp(0, _screenWidth - 100);
                _y = details.offset.dy.clamp(0, _screenHeight - 100);

                double centerX = _screenWidth / 2 - 50;

                // Snap to the closest boundary if not in the middle horizontally
                if (_x != centerX) {
                  if (_x < centerX) {
                    _x = 0; // Snap to left boundary
                  } else {
                    _x = _screenWidth - 100; // Snap to right boundary
                  }
                }

                // Snap to the closest edge if placed in the middle
                // if (_x > (_screenWidth - 100) * 0.75) {
                //   debugPrint('1');
                //   _x = _screenWidth - 100;
                // } else if (_x < (_screenWidth - 100) * 0.25) {
                //   debugPrint('2');
                //   _x = 0;
                // } else if (_x < (_screenWidth - 100) / 2) {
                //   debugPrint('3');
                //   _x = 0;
                // } else {
                //   debugPrint('4');
                //   _x = _screenWidth - 100;
                // }

                // if (_y > (_screenHeight - 100) * 0.75) {
                //   debugPrint('5');
                //   _y = _screenHeight - 100;
                // } else if (_y < (_screenHeight - 100) * 0.25) {
                //   debugPrint('6');
                //   debugPrint('${(_screenHeight - 100) * 0.25}');
                //   _y = 0;
                // }

                debugPrint('x $_x');
                debugPrint('y $_y');
              });
            },
          ),
        ),
      ],
    );
  }
}
