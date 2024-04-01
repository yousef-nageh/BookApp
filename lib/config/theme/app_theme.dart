
import 'package:bookly_app_with_mvvm/core/utils/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:bookly_app_with_mvvm/core/utils/color_manager.dart';

abstract class AppTheme {
  static ThemeData darkTheme
  = ThemeData.dark().copyWith(


    appBarTheme: AppBarTheme(
      backgroundColor: ColorManager.primaryColor,
      elevation: 0,
      titleSpacing: 20,
      iconTheme: IconThemeData(
        color: ColorManager.white,
      )

    ),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: ColorManager.white),


    inputDecorationTheme: InputDecorationTheme(


      filled: true,
      fillColor: ColorManager.white,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red, width: 2),

      ),
      errorStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.normal,),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      suffixIconColor: ColorManager.primaryColor,
      prefixIconColor: ColorManager.primaryColor,
      hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.grey.shade900),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorManager.black,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        splashFactory:InkSplash.splashFactory ,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        backgroundColor: ColorManager.white,
        minimumSize: const Size.fromHeight(50),
        foregroundColor: ColorManager.black,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorManager.white,
shape: const CircleBorder(),
      splashColor: ColorManager.black.withOpacity(0.3),
    ),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(

          foregroundColor: ColorManager.white.withOpacity(0.5),

        )
    ),
    scaffoldBackgroundColor: ColorManager.primaryColor,
    textTheme: GoogleFonts.montserratTextTheme( ThemeData
        .dark()
        .textTheme,

    ).copyWith(bodyLarge: StyleManager.textFormStyle(Colors.black),),
  );
}