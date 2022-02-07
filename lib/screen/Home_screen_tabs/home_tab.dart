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
        color: Colors.white,
        width: Get.width,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Obx(
          () => controller.loading.isTrue
              ? RefreshIndicator(
                  onRefresh: () async {
                    controller.getData();
                  },
                  child: ListView(
                    children: [
                      Align(
                        alignment: controller.isDrawerOpen.isTrue
                            ? Alignment.topLeft
                            : Alignment.topRight,
                        child: controller.isDrawerOpen.isTrue
                            ? IconButton(
                                onPressed: controller.backButtonTap,
                                icon: Icon(
                                  Platform.isAndroid
                                      ? Icons.arrow_back
                                      : Icons.arrow_back_ios,
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
                              image: AssetImage('assets/image 1.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: Text(
                          'Welcome',
                          style: FontConstant.boldFont.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        subtitle: Text(
                          'Emily Cyrus'.capitalize!,
                          style: FontConstant.getCustomFont(
                            18,
                            ColorConstants.darkPink,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // paddingAll(14),
                      buildNannyBanner(),

                      buildLabel('Current Booking'),
                      buildSizedBox(),
                      Card(
                        color: Colors.white,
                        elevation: 4,
                        shadowColor: Colors.black87,
                        margin: const EdgeInsets.symmetric(vertical: 7),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 8),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'One Day Package',
                                    style: FontConstant.getCustomFont(
                                      16,
                                      ColorConstants.darkPink,
                                      fontWeight: FontWeight.w500,
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
                                  Expanded(
                                    child: Text(
                                      'From',
                                      style: FontConstant.normalFont,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'To',
                                      style: FontConstant.normalFont,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: buildRow(
                                        icon: CupertinoIcons.calendar,
                                        label: controller
                                            .currentBooking.value.fromDate!,
                                      ),
                                    ),
                                    Expanded(
                                      child: buildRow(
                                        icon: CupertinoIcons.calendar,
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
                                        icon: CupertinoIcons.clock,
                                        label: controller
                                            .currentBooking.value.fromTime!,
                                      ),
                                    ),
                                    Expanded(
                                      child: buildRow(
                                        icon: CupertinoIcons.clock,
                                        label: controller
                                            .currentBooking.value.toTime!,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              buildSizedBox(),
                              Wrap(
                                spacing: 3,
                                children: [
                                  buildElevatedButton(
                                    'Rate Us',
                                    color: ColorConstants.darkBlue,
                                    onTap: () {},
                                    icon: Icons.star_border,
                                  ),
                                  buildElevatedButton(
                                    'Geolocation',
                                    color: ColorConstants.darkBlue,
                                    onTap: () {},
                                    icon: Icons.location_on_outlined,
                                  ),
                                  buildElevatedButton(
                                    'Surveillance',
                                    color: ColorConstants.darkBlue,
                                    onTap: () {},
                                    icon: CupertinoIcons.mic_slash,
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

  Widget buildNannyBanner() {
    return SizedBox(
      height: Get.height / 3,
      width: Get.width,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: Get.height / 4,
              width: Get.width * .9,
              decoration: BoxDecoration(
                color: ColorConstants.lightPink,
                borderRadius: BorderRadius.circular(15),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: Get.width * .5,
                    child: Text(
                      'Nanny And\nBabysitting Services',
                      style: FontConstant.getCustomFont(
                        18,
                        ColorConstants.darkBlue,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  buildSizedBox(),
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
              'assets/Group.png',
              width: Get.width / 1.4,
              height: Get.height / 3,
              fit: BoxFit.fill,
              alignment: Alignment.bottomRight,
              gaplessPlayback: true,
              scale: 1,
            ),
          )
        ],
      ),
    );
  }

  Container buildContainer(int index, Package data) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 15, 16, 15),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color:
            index.isEven ? ColorConstants.lightPink : ColorConstants.lightBlue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/cal.png',
                height: 25,
                width: 25,
                fit: BoxFit.cover,
                color: index == controller.packages.length - 1
                    ? Colors.white
                    : ColorConstants.darkPink,
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
                style: FontConstant.getCustomFont(
                  16,
                  ColorConstants.darkBlue,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '₹ ${data.price}',
                style: FontConstant.getCustomFont(
                  16,
                  ColorConstants.darkBlue,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          buildSizedBox(),
          description(
            '${data.description}',
            data,
            index,
          ),
          buildSizedBox(),
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
          style: FontConstant.getCustomFont(
            16,
            ColorConstants.offWhite,
            fontWeight: FontWeight.w600,
          ),
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
        style: FontConstant.getCustomFont(
          20,
          ColorConstants.darkBlue,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  ElevatedButton buildElevatedButton(
    String text, {
    required Color color,
    Function()? onTap,
    IconData? icon,
  }) {
    return ElevatedButton(
      onPressed: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: Icon(
                icon,
                color: Colors.white,
                size: 15,
              ),
            ),
          Text(
            text.capitalize!,
            style: FontConstant.getCustomFont(
              13,
              Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        primary: color,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  SizedBox buildSizedBox() => const SizedBox(height: 20);

  Widget description(String text, Package data, int index) {
    return Obx(
      () => RichText(
        maxLines: data.more!.isFalse ? 2 : null,
        text: TextSpan(
            style: FontConstant.getCustomFont(
              13,
              index == controller.packages.length - 1
                  ? Colors.white
                  : ColorConstants.offWhite,
              fontWeight: FontWeight.w500,
            ),
            text: text,
            recognizer: TapGestureRecognizer()
              ..onTap = () => data.more!.value = !data.more!.value),
      ),
    );
  }
}
