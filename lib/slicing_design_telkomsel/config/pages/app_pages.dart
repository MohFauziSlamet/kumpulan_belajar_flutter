import 'package:belajar_flutter/33.%20Email%20Validator/view/home_view.dart';
import 'package:belajar_flutter/slicing_design_telkomsel/config/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages._();

  static List<GetPage> getPage() {
    return [
      GetPage(
        name: AppRoutes.home,
        page: () => const HomeView(),
      ),
      GetPage(
        name: AppRoutes.home,
        page: () => const HomeView(),
      ),
    ];
  }
}
