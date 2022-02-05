import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test/screen/drawer_screen.dart';
import 'package:machine_test/screen/home_screen.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = Get.height;
    double width = Get.width;
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: SizedBox(
          height: height,
          width: width,
          child: Stack(
            children: [const DrawerScreen(), HomeScreen()],
          ),
        ),
      ),
    );
  }
}
