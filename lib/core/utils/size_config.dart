import 'package:flutter/cupertino.dart';

abstract class SizeConfig {
  static double width = 0, height = 0;
  static const maxMobileWidth=600;

static  void init(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.landscape) {
      height = MediaQuery.sizeOf(context).width;
      width = MediaQuery.sizeOf(context).height;
    } else {
      height = MediaQuery.sizeOf(context).height;
      width = MediaQuery.sizeOf(context).width;
    }
  }
}
