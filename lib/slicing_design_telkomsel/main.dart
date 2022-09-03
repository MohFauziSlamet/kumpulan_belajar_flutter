import 'package:belajar_flutter/slicing_design_telkomsel/config/pages/app_pages.dart';
import 'package:belajar_flutter/slicing_design_telkomsel/config/routes/app_routes.dart';
import 'package:belajar_flutter/slicing_design_telkomsel/constant/commons/app_const.dart';
import 'package:belajar_flutter/slicing_design_telkomsel/shared/widgets/splash_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 3)),
      builder: (context, snapshot) {
        /// KONDISI WAITING
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SplashScreen();
        }

        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppConst.appName,
          initialRoute: AppRoutes.login,
          getPages: AppPages.getPage(),
        );
      },
    );
  }
}
