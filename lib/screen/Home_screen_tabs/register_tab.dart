import 'package:flutter/material.dart';
import 'package:machine_test/constants/app_constants.dart';

class RegisterTab extends StatelessWidget {
  const RegisterTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown,
      child: Center(
          child: Text(
        'Register Tab',
        style: FontConstant.normalFont,
      )),
    );
  }
}
