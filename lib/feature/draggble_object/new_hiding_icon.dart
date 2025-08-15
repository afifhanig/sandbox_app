import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandbox_flutter_3/feature/save_to_local/save_to_local.dart';
import 'package:sandbox_flutter_3/main.dart';

class NewHidingIcon extends StatefulWidget {
  @override
  State<NewHidingIcon> createState() => _NewHidingIconState();
}

class _NewHidingIconState extends State<NewHidingIcon> {
  final double mainWidgetSize = 75;
  bool onTap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Draggable Object'),
      ),
      body: Container(
        //color: Colors.blueGrey,
        width: MediaQuery.of(context).size.width,
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              color: Colors.blue,
              child: const Center(
                child: Text(
                  'Main Content',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              bottom: kBottomNavigationBarHeight + 1,
              right: onTap ? 0 - mainWidgetSize : 0,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        onTap = !onTap;
                      });
                    },
                    child: Container(
                      height: 85,
                      decoration: BoxDecoration(
                        color: Colors.red[900],
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(25),
                          bottomLeft: Radius.circular(25),
                        ),
                      ),
                      child: Center(
                        child: Icon(onTap ? Icons.keyboard_arrow_left : Icons.keyboard_arrow_right,
                            color: Colors.white, size: 25),
                      ),
                    ),
                  ),
                  Container(
                    height: 85,
                    width: mainWidgetSize,
                    color: Colors.red.shade900,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 5, 5),
                      child: Column(
                        children: [
                          Expanded(child: Container(
                            color: Colors.transparent,
                            child: const FittedBox(child: Icon(Icons.account_circle_rounded, color: Colors.white,)),
                          )),
                          SizedBox(height: 3),
                          const Text('ChatBot', style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // AnotherDraggable(
            //   screenHeight: MediaQuery.of(context).size.height -
            //       AppBar().preferredSize.height -
            //       MediaQuery.of(context).padding.top,
            //   screenWidth: MediaQuery.of(context).size.width,
            // ),
            // DraggableObject(
            //   screenHeight: MediaQuery.of(context).size.height -
            //       AppBar().preferredSize.height -
            //       MediaQuery.of(context).padding.top,
            //   screenWidth: MediaQuery.of(context).size.width,
            // ),
          ],
        ),
      ),
    );
  }
}

class AnotherDraggable extends StatefulWidget {
  final double screenWidth;
  final double screenHeight;

  const AnotherDraggable({super.key, required this.screenWidth, required this.screenHeight});

  @override
  _AnotherDraggableState createState() => _AnotherDraggableState();
}

class _AnotherDraggableState extends State<AnotherDraggable> {
  final double mainWidget = 75;
  final double hideButton = 25;
  double _top = 0;
  double _left = 0;
  bool isObjectVisible = true;
  bool isLeft = false;
  bool isRight = true;
  double _screenWidth = 0.0;
  double _screenHeight = 0.0;
  //

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _screenWidth = widget.screenWidth;
      _screenHeight = widget.screenHeight;
      setState(() {
        _left = _screenWidth - (mainWidget + (hideButton / 2));
        _top = (_screenHeight - mainWidget);
      });
    });
  }

  double hideObj() {
    debugPrint('hide obj');
    if (!isObjectVisible) {
      if (isLeft) {
        return _left - (mainWidget / 2);
      } else if (isRight) {
        return _left + (mainWidget / 2);
      }
    } else {
      return _left;
    }
    debugPrint('hide obj');
    return _left;
  }

  hideObjButton() {
    debugPrint('here');
    setState(() {
      isObjectVisible = !isObjectVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: _top,
      left: hideObj(), //isObjectVisible ? -50 : _left,
      child: Draggable(
        feedback: isObjectVisible
            ? Container(
                width: mainWidget,
                height: mainWidget,
                decoration: BoxDecoration(
                  color: Colors.yellow[100],
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade500, spreadRadius: 0.0, blurRadius: 7, offset: Offset(1, 4))
                  ],
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image(
                    image: AssetImage('assets/images/chatbot_logo.png'),
                  ),
                ),
              )
            : Container(),
        childWhenDragging: isObjectVisible
            ? Container()
            : Container(
                width: mainWidget,
                height: mainWidget,
                decoration: BoxDecoration(
                  // image: const DecorationImage(
                  //   image: AssetImage('assets/images/chatbot_logo.png'),
                  //   fit: BoxFit.contain,
                  // ),
                  color: Colors.yellow[100],
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade500, spreadRadius: 0.0, blurRadius: 7, offset: Offset(1, 4))
                  ],
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image(
                    image: AssetImage('assets/images/chatbot_logo.png'),
                  ),
                ),
              ),
        onDragEnd: (DraggableDetails dragDetails) {
          isObjectVisible
              ? setState(() {
                  _left = dragDetails.offset.dx;
                  _top = dragDetails.offset.dy;

                  //Get screen center coordinates
                  double centerX = _screenWidth / 2 - 50;

                  // Snap to the closest boundary if not in the middle horizontally
                  if (_left != centerX) {
                    if (_left < centerX) {
                      _left = 0 - (hideButton / 2); // Snap to left boundary
                      isLeft = true;
                      isRight = false;
                    } else {
                      _left = _screenWidth - (mainWidget + (hideButton / 2)); // Snap to right boundary
                      isLeft = false;
                      isRight = true;
                    }
                  }

                  //Clamp the top position within the vertical boundaries
                  _top = _top.clamp(0, _screenHeight - mainWidget);
                })
              : null;
        },
        child: ContainerStack(
          hideObjButton: hideButton,
          widgetSize: mainWidget,
          hide: hideObjButton,
          terlihat: isObjectVisible,
          kanan: isRight,
          kiri: isLeft,
        ),
      ),
    );
  }
}

class ContainerStack extends StatefulWidget {
  final bool terlihat;
  final bool kanan;
  final bool kiri;
  final Function hide;
  final double widgetSize;
  final double hideObjButton;
  const ContainerStack(
      {super.key,
      required this.kanan,
      required this.kiri,
      required this.terlihat,
      required this.hide,
      required this.widgetSize,
      required this.hideObjButton});

  @override
  State<ContainerStack> createState() => _ContainerStackState();
}

class _ContainerStackState extends State<ContainerStack> with TickerProviderStateMixin {
  late double mainWidget;
  late double hideObjButton;
  //double circleSize = 25.0;
  late double y;
  late double x;
  bool isRight = false;
  bool isLeft = true;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    mainWidget = widget.widgetSize;
    hideObjButton = widget.hideObjButton;
    x = 0.0;
    y = (mainWidget - hideObjButton) / 2;
  }

  @override
  void dispose() {
    super.dispose();
  }

  hideButtonPosition() {
    double xVar;
    if (widget.kiri) {
      xVar = mainWidget;
      return xVar;
    } else if (widget.kanan) {
      xVar = x;
      return xVar;
    }
    return xVar = x;
  }

  theIcon() {
    if (widget.kanan) {
      if (widget.terlihat) {
        return Icons.keyboard_arrow_right;
      } else {
        return Icons.keyboard_arrow_left;
      }
    } else if (widget.kiri) {
      if (widget.terlihat) {
        return Icons.keyboard_arrow_left;
      } else {
        return Icons.keyboard_arrow_right;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mainWidget + hideObjButton,
      height: mainWidget,
      color: Colors.transparent,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            children: [
              Container(
                width: hideObjButton / 2,
                height: mainWidget,
                color: Colors.transparent,
              ),
              GestureDetector(
                onTap: () {
                  //Get.to(const SaveToLocal());
                  widget.terlihat ? Get.to(const SaveToLocal()) : print('none');
                },
                onDoubleTap: () {
                  widget.hide();
                },
                child: mainIcon(),
              ),
              Container(
                width: hideObjButton / 2,
                height: mainWidget,
                color: Colors.transparent,
              )
            ],
          ),
          Positioned(
            top: y, // Adjust this value to center the circle vertically
            left: hideButtonPosition(), //x,
            child: InkWell(
              onTap: () {
                widget.hide();
              },
              child: Container(
                width: hideObjButton,
                height: hideObjButton,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 133, 20, 20),
                ),
                child: Icon(
                  //Icons.keyboard_arrow_right_rounded,
                  //widget.terlihat ? Icons.keyboard_arrow_right_rounded : Icons.keyboard_arrow_left_rounded,
                  theIcon(),
                  size: hideObjButton,
                  color: Colors.red[100],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget mainIcon() {
    return Container(
      width: mainWidget,
      height: mainWidget,
      decoration: BoxDecoration(
        // image: const DecorationImage(
        //   image: AssetImage('assets/images/chatbot_logo.png'),
        //   fit: BoxFit.contain,
        // ),
        color: Colors.yellow[100],
        shape: BoxShape.circle,
        boxShadow: [BoxShadow(color: Colors.grey.shade500, spreadRadius: 0.0, blurRadius: 7, offset: Offset(1, 4))],
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Image(
          image: AssetImage('assets/images/chatbot_logo.png'),
        ),
      ),
    );
  }

  Widget mainIcon2() {
    return Container(
      width: mainWidget,
      height: mainWidget,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/chatbot_logo.png'),
          fit: BoxFit.contain,
        ),
        color: Colors.transparent,
        shape: BoxShape.circle,
      ),
    );
  }
}

 //   child: Stack(
      //     clipBehavior: Clip.none,
      //     children: [
      //       Row(
      //         children: [
      //           Container(
      //             width: hideObjButton / 2,
      //             height: mainWidget,
      //             color: Colors.black,
      //           ),
      //           GestureDetector(
      //             onTap: () {
      //               Get.to(const SaveToLocal());
      //             },
      //             child: Container(
      //               width: mainWidget,
      //               height: mainWidget,
      //               decoration: BoxDecoration(
      //                 color: Colors.blue,
      //                 shape: BoxShape.circle,
      //                 boxShadow: [
      //                   BoxShadow(color: Colors.grey.shade500, spreadRadius: 0.0, blurRadius: 7, offset: Offset(1, 4))
      //                 ],
      //               ),
      //               child: Icon(
      //                 Icons.chat_rounded,
      //                 size: mainWidget / 2,
      //                 color: Colors.white,
      //               ),
      //             ),
      //           ),
      //           Container(
      //             width: hideObjButton / 2,
      //             height: mainWidget,
      //             color: Colors.black,
      //           )
      //         ],
      //       ),
      //       Positioned(
      //         top: y, // Adjust this value to center the circle vertically
      //         left: someFunc(), //x,
      //         child: InkWell(
      //           onTap: () {
      //             widget.hide();
      //           },
      //           child: Container(
      //             width: hideObjButton,
      //             height: hideObjButton,
      //             decoration: BoxDecoration(
      //               shape: BoxShape.circle,
      //               color: Colors.red[600],
      //             ),
      //             child: Icon(
      //               //widget.terlihat ? Icons.keyboard_arrow_right_rounded : Icons.keyboard_arrow_left_rounded,
      //               //theIcon(),
      //               Icons.keyboard_arrow_right_rounded,
      //               size: hideObjButton,
      //               color: Colors.white,
      //             ),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
