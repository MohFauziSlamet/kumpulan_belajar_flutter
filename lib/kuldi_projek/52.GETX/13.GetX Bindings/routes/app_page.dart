import 'package:belajar_flutter/kuldi_projek/52.GETX/13.GetX%20Bindings/bindings/count_binding.dart';

import '../routes/route_name.dart';
import '../pages/count/count.dart';
import '../pages/home/home.dart';
import 'package:get/get.dart';
import '../controller/count_controller.dart';

class AppPages {
  static final routePages = [
    GetPage(
      name: RouteNames.homePageRoute,
      page: () => HomePage(),
    ),
    GetPage(
      name: RouteNames.countPageRoute,
      page: () => CountPage(),
      bindings: [
        CountBinding(),
      ],
    ),
  ];
}
