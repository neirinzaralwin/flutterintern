import 'package:flutter/material.dart';

Widget CustomButton(String text, Color color) {
  return Container(
      height: 50,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), color: color),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ));
}
