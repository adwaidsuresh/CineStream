import 'package:flutter/material.dart';

class ResponsiveSize {
  static double width(double width, BuildContext context) {
    return MediaQuery.of(context).size.width * (width / 375);
  }

  static double height(double height, BuildContext context) {
    return MediaQuery.of(context).size.height * (height / 800);
  }
}

class ResponsiveSize2 {
  static double width(double width, BuildContext context) {
    return MediaQuery.of(context).size.width * (width / 1600);
  }

  static double height(double height, BuildContext context) {
    return MediaQuery.of(context).size.height * (height / 1050);
  }
}