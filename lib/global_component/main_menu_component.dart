import 'package:flutter/material.dart';

class MainMenuComponent extends StatelessWidget {
  final VoidCallback toDo;
  final String nameMenu;
  const MainMenuComponent({super.key, required this.toDo, required this.nameMenu});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toDo,
      child: Card(
        elevation: 10,
        child: Align(
          alignment: Alignment.center,
          child: Text(nameMenu),
        ),
      ),
    );
  }
}