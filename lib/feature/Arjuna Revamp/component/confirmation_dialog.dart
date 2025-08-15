import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  final Function onClickPositive;
  final String textButtonPositive;
  final Function onClickNegative;
  final String textButtonNegative;
  final String? title;
  final String? subTitle;
  final String? body;

  const ConfirmationDialog(
      {Key? key,
      required this.onClickPositive,
      required this.textButtonPositive,
      this.title,
      this.subTitle,
      this.body,
      required this.onClickNegative,
      required this.textButtonNegative})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                (this.title != null)
                    ? Text(
                        this.title!,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      )
                    : Container(),
                Padding(padding: EdgeInsets.only(top: 16)),
                (this.subTitle != null)
                    ? Text(
                        this.subTitle!,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                      )
                    : Container(),
                (this.subTitle != null) ? Padding(padding: EdgeInsets.only(top: 8)) : Container(),
                (this.body != null)
                    ? Text(
                        this.body!,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                      )
                    : Container(),
                Padding(padding: EdgeInsets.only(top: 24)),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 5,
                      child: TextButton(
                          style: TextButton.styleFrom(
                            minimumSize: Size(50, 48),
                            primary: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(14)),
                                side: BorderSide(color: Colors.red.shade900, style: BorderStyle.solid, width: 1)),
                          ),
                          onPressed: () {
                            onClickNegative();
                          },
                          child: Text(
                            textButtonNegative,
                            style: TextStyle(color: Colors.red.shade900, fontSize: 18, fontWeight: FontWeight.w500),
                          )),
                    ),
                    Expanded(flex: 1, child: Container()),
                    Expanded(
                      flex: 5,
                      child: TextButton(
                          style: TextButton.styleFrom(
                            minimumSize: Size(50, 48),
                            backgroundColor: Colors.red.shade900,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(13))),
                          ),
                          onPressed: () {
                            onClickPositive();
                          },
                          child: Text(
                            textButtonPositive,
                            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
                          )),
                    )
                  ],
                ),
              ],
            )));
  }
}
