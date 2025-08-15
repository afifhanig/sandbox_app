import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;
  static late double homeHeightScreen;

  static late double _safeAreaHorizontal;
  static late double _safeAreaVertical;
  static late double safeBlockHorizontal;
  static late double safeBlockVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    homeHeightScreen = screenHeight - (kToolbarHeight + kBottomNavigationBarHeight + 25);

    _safeAreaHorizontal = _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical = _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
  }
}

class ArjunaAppBar extends StatelessWidget {
  final String label;
  final List<Widget> widgets;
  final bool centerTitle;
  final VoidCallback? onClick;
  final double elevationValue;
  final bool isHome;

  ArjunaAppBar({this.isHome = false, this.label = "", this.widgets = const [], this.centerTitle = false, this.onClick, this.elevationValue = 0});

  @override
  Widget build(BuildContext context) {
    var clicked = () => Get.back();

    if (isHome) {
      return AppBar(
          title: SizedBox(
        height: kToolbarHeight,
        child: Stack(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.all(3),
                height: kToolbarHeight,
                width: 300,
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/revamp/logo_arjuna_top_bar.png"), fit: BoxFit.contain)),
              ),
            ),
            GestureDetector(
              onTap: () => Get.toNamed('/notification_screen'),
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(padding: EdgeInsets.only(right: 16), child: Icon(Icons.notifications_active_outlined, color: Colors.red.shade900, size: 28)),
              ),
            )
          ],
        ),
      ));
    } else {
      return AppBar(
        centerTitle: centerTitle,
        title: Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: (MediaQuery.of(context).orientation == Orientation.portrait ? SizeConfig.safeBlockHorizontal : SizeConfig.safeBlockVertical) * 6),
        ),
        backgroundColor: Colors.white,
        elevation: elevationValue,
        titleSpacing: 0,
        leading: IconButton(
          onPressed: onClick == null ? clicked : onClick,
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.red.shade900,
          ),
        ),
        actions: widgets,
      );
    }
  }
}
