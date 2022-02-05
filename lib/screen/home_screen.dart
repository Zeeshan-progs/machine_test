import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test/constants/app_constants.dart';
import 'package:machine_test/controller/home_contrller.dart';

import 'Home_screen_tabs/home_tab.dart';
import 'Home_screen_tabs/profile_tab.dart';
import 'Home_screen_tabs/register_tab.dart';
import 'Home_screen_tabs/setting_tab.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.translationValues(
            controller.xOffset.value, controller.yOffset.value, 0)
          ..scale(controller.scaleFactor.value)
          ..rotateX(controller.isDrawerOpen.isTrue ? -0.2 : 0),
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: controller.isDrawerOpen.isTrue
                  ? ColorConstants.lightPink.withOpacity(.2)
                  : Colors.transparent,
              blurRadius: 8,
              spreadRadius: 15,
              offset: const Offset(10.0, 10.0),
            ),
          ],
          borderRadius: BorderRadius.circular(
            controller.isDrawerOpen.isTrue ? 20 : 0,
          ),
          color: Colors.white,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            controller.isDrawerOpen.isTrue ? 20 : 0,
          ),
          child: Scaffold(
              bottomNavigationBar: buildBottomNavigationBar(),
              body: IndexedStack(
                index: controller.currentIndex.value,
                children: [
                  HomeTab(),
                  const RegisterTab(),
                  const SettingTab(),
                  const ProfileTab(),
                ],
              )),
        ),
      ),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      backgroundColor: Colors.white,
      elevation: 3,
      selectedLabelStyle: FontConstant.normalFont,
      selectedItemColor: ColorConstants.darkPink,
      unselectedLabelStyle: FontConstant.normalFont,
      unselectedItemColor: ColorConstants.grey,
      currentIndex: controller.currentIndex.value,
      onTap: controller.changeIndex,
      items: const [
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.fingerprint), label: 'Register'),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings), label: 'Setting'),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled), label: 'Profile'),
      ],
    );
  }
}
