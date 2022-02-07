import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorConstants {
  static const Color lightPink = Color(0xffF5B5CF);
  static const Color darkPink = Color(0xffE36DA6);
  static const Color darkBlue = Color(0xff262F71);
  static const Color lightBlue = Color(0xff80ABDB);
  static Color grey = Colors.grey;
  static const Color offWhite = Color(0xff494949);
}

class FontConstant {
  static TextStyle normalFont = const TextStyle(
    fontSize: 13,
    color: Colors.black,
    fontWeight: FontWeight.w300,
  );
  static TextStyle boldFont = const TextStyle(
    fontSize: 15,
    color: Colors.black,
    fontWeight: FontWeight.w500,
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
