import 'dart:ui' as ui;

class Dimensions {
  static double screenWidth =
      ui.window.physicalSize.width / ui.window.devicePixelRatio;
  static double screenHeight =
      ui.window.physicalSize.height / ui.window.devicePixelRatio;
  static double iconSize16 = screenHeight / 52.75;

  // Splash Page
  static double splashLogoSize = screenHeight / 5.0;

  // Privacy Policy
  static double privacyPolicyHorizontalPading = screenWidth / 6.6;

  // Detail Page
  static double detailPageImageHeight = screenHeight / 1.7;
  static double detailPageBottomHeight = screenHeight / 6.03;
}
