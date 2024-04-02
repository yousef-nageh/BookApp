import 'package:flutter/material.dart';

import '../../app/functions/responsive_font_size.dart';



class StyleManager{
  static TextStyle textStyle18=TextStyle(
      fontSize: getResponsiveFontSize(18),
          fontWeight: FontWeight.normal,
      );
  static  TextStyle textStyle14(BuildContext context)=>TextStyle(
      fontSize: getResponsiveFontSize(14),
          fontWeight: FontWeight.normal,
      color: Colors.grey
      );
  static  TextStyle textStyle15=TextStyle(
      fontSize: getResponsiveFontSize(15),
          fontWeight: FontWeight.bold,

      );
  static  TextStyle textStyle16=TextStyle(
      fontSize: getResponsiveFontSize(16),
          fontWeight: FontWeight.normal,

      );
  static  TextStyle textStyle20=TextStyle(
    fontSize: getResponsiveFontSize(20),
    fontWeight: FontWeight.normal,

  );
  static  TextStyle textStyle30=TextStyle(
    fontSize: getResponsiveFontSize(30),
    fontWeight: FontWeight.normal,

  );
  static  TextStyle textStyle40=TextStyle(
      fontSize: getResponsiveFontSize(40),
          fontWeight: FontWeight.bold,

      );
      static  TextStyle textFormStyle(Color color)=>TextStyle(color:color,fontSize: 18,fontWeight: FontWeight.normal);

static double getFontSize(BuildContext context,int fontSize) {
  double w=MediaQuery.sizeOf(context).width;
  return fontSize * (w / 375.0);
}
}