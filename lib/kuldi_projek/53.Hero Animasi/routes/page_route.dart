import 'package:get/get.dart';
import '../pages/detail_page.dart';
import './route_name.dart';
import '../pages/home_page.dart';

class AppPageRoute {
  static final pages = [
    GetPage(
      name: RouteNames.DetailScreen,
      page: () => DetailScreen(),
    ),
    GetPage(
      name: RouteNames.HomeScreen,
      page: () => HomeScreen(),
    ),
  ];
}
