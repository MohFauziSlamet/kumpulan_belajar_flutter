import 'package:belajar_flutter/slicing_design_telkomsel/config/themes/colours.dart';
import 'package:belajar_flutter/slicing_design_telkomsel/constant/core/assets_const.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.red,
      body: Center(
        child: SizedBox(
          width: Get.width * 0.5,
          height: Get.height * 0.5,
          child: Image.asset(AssetConts.iconMyTelkomsel),
        ),
      ),
    );
  }
}
