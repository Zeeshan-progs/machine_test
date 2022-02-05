import 'dart:convert';

import 'package:get/get.dart';
import 'package:machine_test/constants/app_constants.dart';
import 'package:machine_test/model/data_model.dart';

class HomeController extends GetxController {
  RxInt currentIndex = 0.obs;
  Rx<double> xOffset = 0.0.obs;
  Rx<double> yOffset = 0.0.obs;
  Rx<double> scaleFactor = 1.0.obs;
  RxBool isDrawerOpen = false.obs;
  RxBool loading = false.obs;
  Rx<CurrentBookings> currentBooking = CurrentBookings().obs;
  RxList<Package> packages = <Package>[].obs;
  void changeIndex(int index) {
    currentIndex.value = index;
  }

  void menuButtonTap() {
    isDrawerOpen.value = true;
    xOffset.value = Get.width * 0.5;
    yOffset.value = Get.height * 0.2;
    scaleFactor.value = .7;
  }

  void backButtonTap() {
    isDrawerOpen.value = false;
    xOffset.value = 0;
    yOffset.value = 0;
    scaleFactor.value = 1;
  }

  Future getData() async {
    loading.value = false;
    GetConnect().get('http://cgprojects.in/flutter/').then((value) {
      if (value.isOk) {
        Map<String, dynamic> convert =
            jsonDecode(value.body) as Map<String, dynamic>;

        var model = DataModel.fromJson(convert);
        if (model.currentBookings != null && model.packages!.isNotEmpty) {
          currentBooking.value = model.currentBookings!;
          packages.value = model.packages!;
          loading.value = true;
        }
      } else if (value.statusCode == 401) {
        var convert = jsonDecode(value.body);
        CommonSnackBar.error('$convert ');
      } else if (value.statusCode == 500) {
        CommonSnackBar.error('${value.statusCode} api response');
      }
    });
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
