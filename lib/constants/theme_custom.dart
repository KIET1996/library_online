import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final textTheme = TextTheme(
  headline1: GoogleFonts.roboto(
      fontSize: 25,
      fontWeight: FontWeight.w400,
      letterSpacing: -1.5,
      height: 1.4),
  headline2: GoogleFonts.roboto(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.5,
      height: 1.4),
  headline3: GoogleFonts.roboto(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      height: 1.4),
  headline4: GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.4),
  headline5: GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.4),
  subtitle1: GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.15,
      height: 1.4),
  subtitle2: GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      height: 1.4),
  bodyText1: GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      height: 1.4),
  bodyText2: GoogleFonts.roboto(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      height: 1.4),
  button: GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25,
      height: 1.4),
  caption: GoogleFonts.roboto(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
      height: 1.4),
  overline: GoogleFonts.roboto(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5,
      height: 1.4),
);

final darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF212121),
  accentColor: Colors.white,
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black12,
  textTheme: textTheme,
);

extension CustomColorScheme on ColorScheme {
  Color get iconBackgroud1 => Colors.red;
  Color get iconBackgroud2 => Color.fromRGBO(5, 61, 130, 1);
  Color get iconBackgroud3 => Colors.cyan;
  Color get iconBackgroud4 => Colors.lightBlue;
  Color get iconBackgroud5 => Colors.orange;
  Color get iconBackgroud6 => Colors.indigo;
  Color get primaryColor => Color(0xFFF0B5B5);
  Color get secondaryColor => Colors.white;
  Color get thirdColor => Color(0xFFF2D1D1);
  Color get thirdAccentColor => Color(0xFFD7D7D7);

}
const primaryColor = Color(0xFFF0B5B5);
const secondaryColor = Colors.white;
const thirdColor = Color(0xFFF2D1D1);
const thirdAccentColor = Color(0xFFD7D7D7);

final customTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: primaryColor,
    primaryColorLight: secondaryColor,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: thirdAccentColor,
      centerTitle: false,
    ),
    scaffoldBackgroundColor: const Color.fromRGBO(242, 242, 242, 1),
    accentColor: primaryColor,
    accentIconTheme: IconThemeData(color: Colors.white),
    primaryIconTheme: IconThemeData(color: const Color.fromRGBO(5, 61, 130, 1)),
    dividerColor: Colors.white54,
    textTheme: textTheme,
    colorScheme: ColorScheme.light(secondary: Color.fromRGBO(255, 152, 0, 1)),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.disabled)) {
              return Colors.white70;
            }
            return Colors.white;
          }),
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            return thirdColor;
          }),
        )));

