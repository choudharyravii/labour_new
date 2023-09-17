import 'package:flutter/material.dart';

class SizeConfig {
  static double displayHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double displayWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}