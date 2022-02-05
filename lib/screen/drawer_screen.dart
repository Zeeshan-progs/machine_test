import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test/constants/app_constants.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
        height: Get.height,
        width: Get.width / 1.4,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ColorConstants.darkBlue,
                    width: 2,
                  ),
                  image: const DecorationImage(
                    image: AssetImage('assets/profile.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Md Zeeshan iqbal'.capitalize!,
                  style: FontConstant.normalFont.copyWith(
                    color: ColorConstants.darkPink,
                  ),
                ),
              ),
            ),
            buildTextButton('Home'),
            buildTextButton('Book Now '),
            buildDivider(),
            buildTextButton('How It Work'),
            buildDivider(),
            buildTextButton('Why Nanny Vanny '),
            buildDivider(),
            buildTextButton('My Booking'),
            buildTextButton('my Profile'),
            buildDivider(),
            buildTextButton('Support'),
          ],
        ),
      ),
    );
  }

  Divider buildDivider() {
    return Divider(
      endIndent: Get.width / 3,
      color: ColorConstants.darkPink,
    );
  }

  TextButton buildTextButton(String text) => TextButton(
        onPressed: () {},
        child: Text(
          text.capitalize!,
          style: FontConstant.boldFont.copyWith(
            color: ColorConstants.darkBlue,
          ),
        ),
      );
}
