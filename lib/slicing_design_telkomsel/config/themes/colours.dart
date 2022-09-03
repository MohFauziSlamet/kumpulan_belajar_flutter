import 'package:flutter/material.dart';

class Colours {
  Colours._();
  static const Color darkGrey = Color(0xff2E2E2E);
  static const Color darkBlack = Color(0xff1E1E1E);
  static const Color grey = Color(0xff8F8F8F);
  static const Color blue = Color(0xff00717F);
  static const Color white = Color(0xffFFFFFF);
  static const Color whiteItem = Color(0xffF6F6F6);
  static const Color whiteGrey = Color(0xffAFAFAF);
  static const Color red = Color(0xffEC2028);
  static const Color green = Color(0xFF00717F);
  static const Color green2 = Color(0xFF009AAD);
  static const Color textGrey = Color(0xFFAAAAAA);
  static const Color textYellow = Color(0xFFFFAC01);
  static const Color textGreen = Color(0xFF009C48);

  static const Color bgColors = Color(0xffE5E5E5);

  static const LinearGradient gradientGreen = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Colours.green, Colours.green2],
  );
}
