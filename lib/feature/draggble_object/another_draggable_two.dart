import 'package:flutter/material.dart';

class DraggableObject extends StatefulWidget {
  @override
  _DraggableObjectState createState() => _DraggableObjectState();
}

class _DraggableObjectState extends State<DraggableObject> {
  Offset position = Offset(0, 0);
  Offset initialPosition = Offset(0, 0);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: Draggable(
        child: Container(
          width: 100,
          height: 100,
          color: Colors.blue,
        ),
        feedback: Container(
          width: 100,
          height: 100,
          color: Colors.blue.withOpacity(0.5),
        ),
        childWhenDragging: Container(),
        onDragEnd: (details) {
          final screenSize = MediaQuery.of(context).size;
          const containerSize = 100.0;
          final maxPosition = Offset(
            screenSize.width - 100,
            screenSize.height - 100,
          );
          //final newPosition = details.offset;
          final dropPosition = details.offset;
          // Get the render box of the drop target
          final dropTargetRenderBox = context.findRenderObject() as RenderBox;

          // Get the local position of the drop target
          final localDropPosition = dropTargetRenderBox.globalToLocal(dropPosition);

          setState(() {
            // Calculate the adjusted position based on the local position of the drop target
            position = dropPosition - localDropPosition;
          });
        },
      ),
    );
  }
}

class AnotherDraggableDua extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Draggable Object'),
      ),
      body: Stack(
        children: [
          DraggableObject(),
        ],
      ),
    );
  }
}
