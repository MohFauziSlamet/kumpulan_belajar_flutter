import '../routes/route_name.dart';
import '../pages/count/count.dart';
import '../pages/home/home.dart';
import 'package:get/get.dart';
import '../bindings/count_binding.dart';

class AppPages {
  static final routePages = [
    GetPage(
      name: RouteNames.homePageRoute,
      page: () => const HomePage(),
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
