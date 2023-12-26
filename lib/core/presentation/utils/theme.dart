import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

/* Light theme default */
AppColors appColors = AppColorsLight();
ThemeData appTheme = getLightTheme();

/* Dark theme default */
// AppColors appColors = AppColorsDark();
// ThemeData appTheme = getDarkTheme();

ThemeData getLightTheme() {
  return ThemeData(
    applyElevationOverlayColor: false,
    dividerColor: const Color(0xFFECEDF1),
    brightness: Brightness.light,
    primaryColor: const Color(0xFF246BFD),
    textTheme: TextTheme(
      titleSmall: GoogleFonts.caveat(
        textStyle: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: appColors.textColor),
      ),
      headlineLarge: GoogleFonts.urbanist(
          textStyle: TextStyle(
              fontSize: 22.sp,
              color: appColors.textColor,
              fontWeight: FontWeight.bold)),
      headlineMedium: GoogleFonts.urbanist(
          textStyle: TextStyle(
              fontSize: 20.sp,
              color: appColors.textColor,
              fontWeight: FontWeight.bold)),
      headlineSmall: GoogleFonts.urbanist(
          textStyle: TextStyle(
              fontSize: 18.sp,
              color: appColors.textColor,
              fontWeight: FontWeight.bold)),
      labelLarge: GoogleFonts.urbanist(
          textStyle: TextStyle(
              fontSize: 16.sp,
              color: appColors.textColor,
              fontWeight: FontWeight.bold)),
      labelMedium: GoogleFonts.urbanist(
          textStyle: TextStyle(
              fontSize: 14.sp,
              color: appColors.textColor,
              fontWeight: FontWeight.w500)),
      labelSmall: GoogleFonts.urbanist(
          textStyle: TextStyle(
              fontSize: 12.sp,
              color: appColors.textColor,
              fontWeight: FontWeight.w400)),
    ),
  );
}

ThemeData getDarkTheme() {
  return ThemeData(
    applyElevationOverlayColor: true,
    dividerColor: const Color(0xFFECEDF1),
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF246BFD),
    textTheme: TextTheme(
      titleSmall: GoogleFonts.caveat(
        textStyle: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: appColors.textColor),
      ),
      headlineLarge: GoogleFonts.urbanist(
          textStyle: TextStyle(
              fontSize: 22.sp,
              color: appColors.textColor,
              fontWeight: FontWeight.bold)),
      headlineMedium: GoogleFonts.urbanist(
          textStyle: TextStyle(
              fontSize: 20.sp,
              color: appColors.textColor,
              fontWeight: FontWeight.bold)),
      headlineSmall: GoogleFonts.urbanist(
          textStyle: TextStyle(
              fontSize: 18.sp,
              color: appColors.textColor,
              fontWeight: FontWeight.bold)),
      labelLarge: GoogleFonts.urbanist(
          textStyle: TextStyle(
              fontSize: 16.sp,
              color: appColors.textColor,
              fontWeight: FontWeight.bold)),
      labelMedium: GoogleFonts.urbanist(
          textStyle: TextStyle(
              fontSize: 14.sp,
              color: appColors.textColor,
              fontWeight: FontWeight.w500)),
      labelSmall: GoogleFonts.urbanist(
          textStyle: TextStyle(
              fontSize: 12.sp,
              color: appColors.textColor,
              fontWeight: FontWeight.w400)),
    ),
  );
}

abstract class AppColors {
  final Color screenBg;
  final Color appBarBg;
  final Color progressCircleBg;
  final Color pleasantButtonBg;
  final Color pleasantButtonBgHover;
  final Color buttonTextColor;
  final Color negativeButtonBg;
  final Color negativeButtonBgHover;
  final Color buttonTextColorHover;
  final Color textColor;
  final Color linkTextColor;

  final Color tileBgColor;
  final Color tileBgColorHover;
  final Color tileTextColor;
  final Color tileTextColorHover;

  final InputBorder textInputEnabledBorder;
  final InputBorder textInputFocusedBorder;
  final Color textInputFillColor;
  final TextStyle textInputStyle;
  final TextStyle textInputLabelStyle;
  final TextStyle pleasantButtonTextStyle;
  final TextStyle appBarTextStyle;
  final Color listDividerColor;
  final IconThemeData appBarIconTheme;
  final double appBarElevation;
  final Color primaryColor;
  final Color disableBgColor;
  final Color sideMenuHighlight;
  final Color sideMenuNormal;
  final Color sideMenuDisable;
  final Color sideMenuBg;
  final Color inputBgFill;
  final List<Color> rainbowColors;

  AppColors(
      {required this.screenBg,
      required this.appBarBg,
      required this.progressCircleBg,
      required this.pleasantButtonBg,
      required this.negativeButtonBg,
      required this.buttonTextColor,
      required this.buttonTextColorHover,
      required this.pleasantButtonBgHover,
      required this.negativeButtonBgHover,
      required this.textColor,
      required this.textInputEnabledBorder,
      required this.textInputFocusedBorder,
      required this.textInputFillColor,
      required this.textInputStyle,
      required this.textInputLabelStyle,
      required this.pleasantButtonTextStyle,
      required this.appBarTextStyle,
      required this.listDividerColor,
      required this.appBarIconTheme,
      required this.appBarElevation,
      required this.primaryColor,
      required this.disableBgColor,
      required this.sideMenuHighlight,
      required this.sideMenuNormal,
      required this.sideMenuDisable,
      required this.sideMenuBg,
      required this.inputBgFill,
      required this.rainbowColors,
      required this.linkTextColor,
      required this.tileBgColor,
      required this.tileBgColorHover,
      required this.tileTextColor,
      required this.tileTextColorHover});
}

class AppColorsLight extends AppColors {
  AppColorsLight()
      : super(
          screenBg: Colors.white,
          appBarBg: const Color.fromRGBO(255, 255, 255, 1),
          progressCircleBg: Colors.black,
          pleasantButtonBg: const Color.fromRGBO(36, 107, 253, 1),
          pleasantButtonBgHover: const Color.fromRGBO(2, 67, 199, 1.0),
          negativeButtonBg: const Color.fromARGB(255, 248, 53, 95),
          negativeButtonBgHover: const Color.fromARGB(255, 255, 42, 42),
          buttonTextColor: const Color.fromRGBO(255, 255, 255, 1),
          buttonTextColorHover: const Color.fromRGBO(200, 200, 200, 1),
          textColor: Colors.black87,
          textInputEnabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(
              color: Colors.grey[200] ?? Colors.grey,
            ),
          ),
          textInputFocusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(
              color: Colors.grey[300] ?? Colors.grey,
            ),
          ),
          textInputFillColor: Colors.grey[100] ?? Colors.grey,
          textInputStyle: const TextStyle(color: Colors.black87),
          textInputLabelStyle: const TextStyle(color: Colors.black87),
          pleasantButtonTextStyle: const TextStyle(color: Colors.white),
          appBarTextStyle: GoogleFonts.righteous(
              textStyle: const TextStyle(color: Colors.black)),
          listDividerColor: Colors.grey[400] ?? Colors.grey,
          appBarIconTheme: const IconThemeData(
            color: Colors.black,
          ),
          appBarElevation: 8,
          primaryColor: const Color.fromRGBO(36, 107, 253, 1),
          disableBgColor: Colors.black54,
          sideMenuHighlight: Colors.black,
          sideMenuNormal: Colors.white38,
          sideMenuDisable: Colors.white24,
          sideMenuBg: const Color.fromARGB(255, 12, 16, 36),
          inputBgFill: const Color.fromRGBO(230, 230, 230, 1),
          rainbowColors: [
            Colors.red,
            Colors.orange,
            Colors.yellow,
            Colors.green,
            Colors.blue,
            Colors.indigo,
            Colors.purple,
          ],
          linkTextColor: Colors.red,
          tileBgColor: Colors.white,
          tileBgColorHover: const Color.fromRGBO(2, 67, 199, 1.0),
          tileTextColor: Colors.black87,
          tileTextColorHover: Colors.white,
        );
}

class AppColorsDark extends AppColors {
  AppColorsDark()
      : super(
          screenBg: Colors.black,
          appBarBg: Colors.black,
          progressCircleBg: Colors.white,
          pleasantButtonBg: const Color.fromRGBO(36, 107, 253, 1),
          pleasantButtonBgHover: const Color.fromRGBO(2, 67, 199, 1.0),
          negativeButtonBg: const Color.fromARGB(255, 248, 53, 95),
          negativeButtonBgHover: const Color.fromARGB(255, 255, 42, 42),
          buttonTextColor: const Color.fromRGBO(255, 255, 255, 1),
          buttonTextColorHover: const Color.fromRGBO(200, 200, 200, 1),
          textColor: Colors.white70,
          textInputEnabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(
              color: Colors.grey[200] ?? Colors.grey,
            ),
          ),
          textInputFocusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(
              color: Colors.grey[300] ?? Colors.grey,
            ),
          ),
          textInputFillColor: Colors.grey[800] ?? Colors.grey,
          textInputStyle: const TextStyle(color: Colors.white70),
          textInputLabelStyle: const TextStyle(color: Colors.white70),
          pleasantButtonTextStyle: const TextStyle(color: Colors.white),
          appBarTextStyle: GoogleFonts.righteous(
              textStyle: const TextStyle(color: Colors.white)),
          listDividerColor: Colors.grey[200] ?? Colors.grey,
          appBarIconTheme: const IconThemeData(
            color: Colors.white,
          ),
          appBarElevation: 8,
          primaryColor: const Color.fromRGBO(36, 107, 253, 1),
          disableBgColor: Colors.white54,
          sideMenuHighlight: Colors.white,
          sideMenuNormal: Colors.white38,
          sideMenuDisable: Colors.white24,
          sideMenuBg: const Color.fromARGB(255, 12, 16, 36),
          inputBgFill: const Color.fromARGB(255, 31, 30, 30),
          rainbowColors: [
            Colors.red,
            Colors.orange,
            Colors.yellow,
            Colors.green,
            Colors.blue,
            Colors.indigo,
            Colors.purple,
          ],
          linkTextColor: Colors.red,
          tileBgColor: Colors.black,
          tileBgColorHover: const Color.fromRGBO(2, 67, 199, 1.0),
          tileTextColor: Colors.white,
          tileTextColorHover: Colors.white70,
        );
}
