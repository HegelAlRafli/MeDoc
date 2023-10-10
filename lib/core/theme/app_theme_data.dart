import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_value.dart';

class AppThemeData {
  static ThemeData getThemeLight() {
    const Color primaryColor = ColorValue.primaryColor;
    final Map<int, Color> primaryColorMap = {
      50: primaryColor,
      100: primaryColor,
      200: primaryColor,
      300: primaryColor,
      400: primaryColor,
      500: primaryColor,
      600: primaryColor,
      700: primaryColor,
      800: primaryColor,
      900: primaryColor,
    };
    final MaterialColor primaryMaterialColor =
        MaterialColor(primaryColor.value, primaryColorMap);

    return ThemeData(
      primaryColor: primaryColor,
      primarySwatch: primaryMaterialColor,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        elevation: 0,
        titleTextStyle: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: ColorValue.primaryColor,
          minimumSize: Size(double.infinity, 48.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      textTheme: TextTheme(
        headline1: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),
        headline2: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
        ),
        headline3: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
        ),
        headline4: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        bodyText1: GoogleFonts.poppins(
          color: ColorValue.greyTextColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        bodyText2: GoogleFonts.poppins(
          color: ColorValue.greyTextColor,
          fontSize: 12.sp,
        ),
      ),
    );
  }
}
