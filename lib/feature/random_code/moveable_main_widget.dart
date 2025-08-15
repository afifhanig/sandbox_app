import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double appBarHeight = AppBar().preferredSize.height;
    final double bottomNavBarHeight = kBottomNavigationBarHeight;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double availableHeight = screenHeight - appBarHeight - bottomNavBarHeight;

    return Scaffold(
      appBar: AppBar(
        title: Text('Screen Size Example'),
      ),
      body: Container(
        height: availableHeight,
        color: Colors.blue[200],
        child: Center(
          child: Text(
            'Available Screen Height: $availableHeight',
            style: TextStyle(fontSize: 24),
          ),
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