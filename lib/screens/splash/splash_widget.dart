import 'package:dayone/utils/dimensions.dart';
import 'package:flutter/material.dart';

Widget splashLogoWidget() {
  return Container(
    width: Dimensions.splashLogoSize,
    height: Dimensions.splashLogoSize,
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/LOGO.png'),
      ),
    ),
  );
}
