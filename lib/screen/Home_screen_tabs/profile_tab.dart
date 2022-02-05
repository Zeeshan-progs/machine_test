import 'package:flutter/material.dart';
import 'package:machine_test/constants/app_constants.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown,
      child: Center(
          child: Text(
        'Profile Tab',
        style: FontConstant.normalFont,
      )),
    );
  }
}
