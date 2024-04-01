import 'package:flutter/material.dart';



class StyleManager{
  static TextStyle textStyle18(BuildContext context)=>TextStyle(
      fontSize: StyleManager.getFontSize(context, 18),
          fontWeight: FontWeight.normal,
      );
  static  TextStyle textStyle14(BuildContext context)=>TextStyle(
      fontSize: StyleManager.getFontSize(context, 14),
          fontWeight: FontWeight.normal,
      color: Colors.grey
      );
  static  TextStyle textStyle15(BuildContext context)=>TextStyle(
      fontSize: StyleManager.getFontSize(context, 15),
          fontWeight: FontWeight.bold,

      );
  static  TextStyle textStyle16(BuildContext context)=>TextStyle(
      fontSize: StyleManager.getFontSize(context, 16),
          fontWeight: FontWeight.normal,

      );
  static  TextStyle textStyle20(BuildContext context)=>TextStyle(
    fontSize: StyleManager.getFontSize(context, 20),
    fontWeight: FontWeight.normal,

  );
  static  TextStyle textStyle30(BuildContext context)=>TextStyle(
    fontSize: StyleManager.getFontSize(context, 30),
    fontWeight: FontWeight.normal,

  );
  static  TextStyle textStyle40(BuildContext context)=>TextStyle(
      fontSize: StyleManager.getFontSize(context, 40),
          fontWeight: FontWeight.bold,

      );
      static  TextStyle textFormStyle(Color color)=>TextStyle(color:color,fontSize: 18,fontWeight: FontWeight.normal);

static double getFontSize(BuildContext context,int fontSize) {
  double w=MediaQuery.sizeOf(context).width;
  return fontSize * (w / 375.0);
}
}