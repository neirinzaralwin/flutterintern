import 'package:dayone/utils/dimensions.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget CustomTextField(
    IconData icon, String text, TextEditingController textEditingController) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: Container(
      height: Dimensions.screenHeight / 15,
      width: Dimensions.screenWidth / 1.2,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: Dimensions.screenHeight / 30),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        style: TextStyle(color: Colors.black.withOpacity(.8)),
        controller: textEditingController,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.black.withOpacity(.7),
          ),
          border: InputBorder.none,
          hintMaxLines: 1,
          hintText: text,
          hintStyle:
              TextStyle(fontSize: 14, color: Colors.black.withOpacity(.5)),
        ),
      ),
    ),
  );
}
