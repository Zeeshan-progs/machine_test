import 'package:flutter/cupertino.dart';
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
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ColorConstants.darkBlue,
                    width: 2,
                  ),
                  image: const DecorationImage(
                    image: AssetImage('assets/image 1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Emily Cyrus'.capitalize!,
                  style: FontConstant.getCustomFont(
                    20,
                    ColorConstants.darkPink,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            buildTextButton('Home'),
            buildDivider(),
            buildTextButton('Book Now '),
            buildDivider(),
            buildTextButton('How It Work'),
            buildDivider(),
            buildTextButton('Why Nanny Vanny '),
            buildDivider(),
            buildTextButton('My Booking'),
            buildDivider(),
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
      endIndent: Get.width / 4,
      thickness: .4,
      color: ColorConstants.darkPink,
    );
  }

  TextButton buildTextButton(String text) => TextButton(
        onPressed: () {},
        child: Text(
          text.capitalize!,
          style: FontConstant.getCustomFont(
            18,
            ColorConstants.darkBlue,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
}
