import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTheme {
  TextTheme buildTextTheme() {
    return  TextTheme(
        displayLarge: TextStyle(fontSize: 57.sp, height: 1.123),
        displayMedium: TextStyle(fontSize: 45.sp, height: 1.156),
        displaySmall: TextStyle(fontSize: 36.sp, height: 1.123),
        headlineLarge: TextStyle(fontSize: 32.sp, height: 1.25),
        headlineMedium: TextStyle(fontSize: 28.sp, height: 1.286),
        headlineSmall: TextStyle(fontSize: 24.sp, height: 1.334),
        titleLarge: TextStyle(
          fontSize: 22.sp,
          height: 1.273,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          fontSize: 16.sp,
          height: 1.334,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
        ),
        titleSmall: TextStyle(
          fontSize: 14.sp,
          height: 1.455,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
        ),
        labelLarge: TextStyle(
          fontSize: 14.sp,
          height: 1.429,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
        ),
        labelMedium: TextStyle(
          fontSize: 12.sp,
          height: 1.334,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
        ),
        labelSmall: TextStyle(
          fontSize: 11.sp,
          height: 1.455,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
        ),
        bodyLarge: TextStyle(fontSize: 16.sp, height: 1.5, letterSpacing: 0.15),
        bodyMedium: TextStyle(
          fontSize: 14.sp,
          height: 1.429,
          letterSpacing: 0.25,
        ),
        bodySmall: TextStyle(
          fontSize: 12.sp,
          height: 1.334,
          letterSpacing: 0.4,
        ),
      );
  }
}
