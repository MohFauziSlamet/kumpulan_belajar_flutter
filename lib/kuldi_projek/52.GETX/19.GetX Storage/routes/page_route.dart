import 'package:get/get.dart';
import './route_name.dart';
import '../pages/home/home.dart';
import '../pages/login/login.dart';

class AppPageRoute {
  static final pages = [
    GetPage(
      name: RouteNames.home,
      page: () => HomePage(),
    ),
    GetPage(
      name: RouteNames.login,
      page: () => LoginPage(),
    ),
  ];
}
