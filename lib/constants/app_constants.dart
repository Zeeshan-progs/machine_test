import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorConstants {
  static const Color darkPink = Color(0xffb80497);
  static Color lightPink = const Color(0xffb80497).withOpacity(.3);
  static const Color darkBlue = Color(0xff041291);
  static const Color lightBlue = Color(0xff5463eb);
  static Color grey = Colors.grey;
}

class FontConstant {
  static TextStyle normalFont = const TextStyle(
    fontSize: 13,
    color: Colors.black,
    fontWeight: FontWeight.normal,
    letterSpacing: 1.12,
  );
  static TextStyle boldFont = const TextStyle(
    fontSize: 15,
    color: Colors.black,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.12,
  );

  static TextStyle getCustomFont(
    double fontSize,
    Color color, {
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontWeight: fontWeight,
      color: color,
      fontSize: fontSize,
    );
  }
}

class CommonSnackBar {
  static SnackbarController error(String message) {
    return Get.snackbar(
      'Error !!!!',
      message,
      snackStyle: SnackStyle.FLOATING,
      showProgressIndicator: true,
      backgroundColor: ColorConstants.lightPink.withOpacity(.3),
      snackPosition: SnackPosition.BOTTOM,
      barBlur: 4,
      margin: const EdgeInsets.symmetric(horizontal: 15),
    );
  }
}
