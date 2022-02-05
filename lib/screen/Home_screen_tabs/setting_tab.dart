import 'package:flutter/material.dart';
import 'package:machine_test/constants/app_constants.dart';

class SettingTab extends StatelessWidget {
  const SettingTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown,
      child: Center(
          child: Text(
        'Setting Tab',
        style: FontConstant.normalFont,
      )),
    );
  }
}
