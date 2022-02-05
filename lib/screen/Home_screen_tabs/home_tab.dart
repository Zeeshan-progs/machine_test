import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test/constants/app_constants.dart';
import 'package:machine_test/controller/home_contrller.dart';
import 'package:machine_test/model/data_model.dart';

class HomeTab extends StatelessWidget {
  HomeTab({Key? key}) : super(key: key);
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Get.height,
        width: Get.width,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Obx(
          () => controller.loading.isTrue
              ? RefreshIndicator(
                  onRefresh: () async {
                    controller.getData();
                  },
                  child: ListView(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: controller.isDrawerOpen.isTrue
                            ? IconButton(
                                onPressed: controller.backButtonTap,
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: ColorConstants.darkPink,
                                  size: 25,
                                ),
                              )
                            : IconButton(
                                onPressed: controller.menuButtonTap,
                                icon: const Icon(
                                  Icons.menu,
                                  color: ColorConstants.darkPink,
                                  size: 23,
                                ),
                              ),
                      ),
                      ListTile(
                        minLeadingWidth: 0,
                        minVerticalPadding: 0,
                        leading: Container(
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
                        title: Text(
                          'Welcome',
                          style: FontConstant.boldFont.copyWith(
                            color: ColorConstants.darkBlue,
                          ),
                        ),
                        subtitle: Text(
                          'md zeeshan iqbal'.capitalize!,
                          style: FontConstant.getCustomFont(
                            18,
                            ColorConstants.darkPink,
                          ),
                        ),
                      ),
                      // paddingAll(14),
                      Container(
                        height: Get.height / 3,
                        width: Get.width,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 0,
                              child: Container(
                                height: Get.height / 4,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  color: ColorConstants.lightPink,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 10,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: Get.width * .6,
                                      child: Text(
                                        'Nanny And Babysitting Services',
                                        style: FontConstant.getCustomFont(
                                          20,
                                          ColorConstants.darkBlue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: buildElevatedButton(
                                        'Book now',
                                        color: ColorConstants.darkBlue,
                                        onTap: () {},
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Image.asset(
                                'assets/nanny.png',
                                width: Get.width * 0.3,
                                height: Get.height / 3.4,
                              ),
                            )
                          ],
                        ),
                      ),

                      buildSizedBox(),
                      buildLabel('Current Booking'),

                      Card(
                        color: Colors.white,
                        elevation: 3,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 7),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 5.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'your current plan',
                                    style: FontConstant.boldFont.copyWith(
                                      color: ColorConstants.darkPink,
                                    ),
                                  ),
                                  buildElevatedButton('Start now',
                                      color: ColorConstants.darkPink,
                                      onTap: () {}),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'From',
                                    style: FontConstant.normalFont,
                                  ),
                                  Text(
                                    'To',
                                    style: FontConstant.normalFont,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: buildRow(
                                        icon: Icons.calendar_today,
                                        label: controller
                                            .currentBooking.value.fromDate!,
                                      ),
                                    ),
                                    Expanded(
                                      child: buildRow(
                                        icon: Icons.calendar_today,
                                        label: controller
                                            .currentBooking.value.toDate!,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: buildRow(
                                        icon: Icons.timer_sharp,
                                        label: controller
                                            .currentBooking.value.fromTime!,
                                      ),
                                    ),
                                    Expanded(
                                      child: buildRow(
                                        icon: Icons.timer_sharp,
                                        label: controller
                                            .currentBooking.value.toTime!,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              buildSizedBox(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  buildElevatedButton(
                                    'Rate Us',
                                    color: ColorConstants.darkBlue,
                                    onTap: () {},
                                  ),
                                  buildElevatedButton(
                                    'Contributions',
                                    color: ColorConstants.darkBlue,
                                    onTap: () {},
                                  ),
                                  buildElevatedButton(
                                    'Surveillance',
                                    color: ColorConstants.darkBlue,
                                    onTap: () {},
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      buildSizedBox(),
                      buildLabel('Packages'),
                      buildSizedBox(),

                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.packages.length,
                          itemBuilder: (context, index) {
                            var data = controller.packages[index];
                            return buildContainer(index, data);
                          }),
                    ],
                  ),
                )
              : Center(
                  child: Platform.isAndroid
                      ? const CircularProgressIndicator()
                      : const CupertinoActivityIndicator(),
                ),
        ));
  }

  Container buildContainer(int index, Package data) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 7, 16, 6),
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: index.isEven ? ColorConstants.lightPink : ColorConstants.lightBlue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                CupertinoIcons.calendar,
                size: 25,
                color: index.isEven ? ColorConstants.darkPink : Colors.white,
              ),
              buildElevatedButton('Book Now',
                  color: index.isEven
                      ? ColorConstants.darkPink
                      : ColorConstants.darkBlue,
                  onTap: () {})
            ],
          ),
          buildSizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${data.packageName}',
                style: FontConstant.normalFont.copyWith(
                  color: index.isEven ? ColorConstants.darkPink : Colors.white,
                ),
              ),
              Text(
                '₹ ${data.price}',
                style: FontConstant.boldFont.copyWith(
                  color: ColorConstants.darkBlue,
                  letterSpacing: 0,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: description(
              '${data.description}',
              data,
            ),
          )
        ],
      ),
    );
  }

  Row buildRow({required String label, required IconData icon}) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: ColorConstants.darkPink,
        ),
        const SizedBox(width: 15),
        Text(
          label,
          style: FontConstant.normalFont,
        )
      ],
    );
  }

  EdgeInsets buildEdgeInsets() => const EdgeInsets.symmetric(horizontal: 4.0);

  Padding buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
      child: Text(
        text.capitalize!,
        style: FontConstant.boldFont.copyWith(
          color: ColorConstants.darkBlue,
        ),
      ),
    );
  }

  ElevatedButton buildElevatedButton(
    String text, {
    required Color color,
    Function()? onTap,
  }) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(
        text.capitalize!,
        style: FontConstant.normalFont.copyWith(
          color: Colors.white,
          fontSize: 13,
        ),
      ),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 0,
        ),
        primary: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  SizedBox buildSizedBox() => const SizedBox(height: 20);

  Widget description(String text, Package data) {
    return Obx(
      () => RichText(
        text: TextSpan(
            style: FontConstant.boldFont.copyWith(
              color: Colors.grey,
            ),
            text: data.more!.isFalse
                ? text.length > 50
                    ? text.substring(
                          0,
                          45,
                        ) +
                        ' .... ${data.more!.isTrue ? 'Show Less' : 'Show More'}'
                    : text
                : text,
            recognizer: TapGestureRecognizer()
              ..onTap = () => data.more!.value = !data.more!.value),
      ),
    );
  }
}
