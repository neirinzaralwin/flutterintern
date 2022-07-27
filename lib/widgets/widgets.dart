import 'package:flutter/material.dart';

class BoldFont extends StatelessWidget {
  final String? text;
  final Color? color;
  const BoldFont({Key? key, this.text, this.color = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(color: color, fontWeight: FontWeight.bold),
    );
  }
}

Widget SmallText(String text) {
  return Text(
    text,
    style: TextStyle(
      color: Colors.black.withOpacity(0.5),
      height: 1.8,
    ),
  );
}

Widget SubTitleText(String text) {
  return Text(
    text,
    style: TextStyle(
      color: Colors.black.withOpacity(0.7),
      fontSize: 15,
      fontWeight: FontWeight.bold,
      height: 1.8,
    ),
  );
}

Widget BigText(String text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.bold,
    ),
  );
}
