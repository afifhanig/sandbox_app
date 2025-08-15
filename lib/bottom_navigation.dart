import 'package:flutter/material.dart';
import 'package:sandbox_flutter_3/home/rumah.dart';

class BottomNavigate extends StatefulWidget {
  const BottomNavigate({Key? key}) : super(key: key);

  @override
  State<BottomNavigate> createState() => _BottomNavigateState();
}

class _BottomNavigateState extends State<BottomNavigate> {
  GlobalKey<_BottomNavigateState> globalKey = GlobalKey();
  final _listView = <Widget>[
    const Rumah(),
    //AnotherDraggableExample(),
    //DraggableApp(),
    // RemoveEntryPage(),
  ];
  int currentIndex = 0;
  final _pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      body: Center(
        child: PageView(
          onPageChanged: (index) {
            setState(() => currentIndex = index);
          },
          controller: _pageController,
          children: _listView,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          currentIndex = index;
          _pageController.jumpToPage(index);
        },
        items: const [
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.home, color: Colors.blue),
              icon: Icon(Icons.home, color: Colors.grey),
              label: "Home"),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.car_rental, color: Colors.blue),
              icon: Icon(Icons.car_rental, color: Colors.grey),
              label: "Another"),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.car_rental, color: Colors.blue),
              icon: Icon(Icons.car_rental, color: Colors.grey),
              label: "Another2"),
        ],
      ),
    );
  }
}
