import 'package:belajar_flutter/kuldi_projek/52.GETX/6.GetX%20Route/routes/route_name.dart';
import 'package:get/get.dart';
import '../pages/page_satu.dart';
import '../pages/page_dua.dart';
import '../pages/page_tiga.dart';
import '../pages/page_empat.dart';

class AppPageRoute {
  static final pages = [
    GetPage(
      name: RouteNames.page_1,
      page: () => PageSatu(),
    ),
    GetPage(
      name: RouteNames.page_2,
      page: () => PageDua(),
    ),
    GetPage(
      name: RouteNames.page_3,
      page: () => PageTiga(),
    ),
    GetPage(
      name: RouteNames.page_4,
      page: () => PageEmpat(),
    ),
  ];
}
