import 'package:flutter/material.dart';

typedef void FunctionCallback();

class RoundedRedButton extends StatelessWidget {
  final String text;
  final FunctionCallback callback;
  final bool disabled;

  RoundedRedButton({required this.text, required this.callback, required this.disabled});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: !disabled ? Colors.red.shade900 : Colors.grey,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
          onPressed: () {
            if(!disabled) callback();
          },

          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 16),
          )),
    );
  }
}
