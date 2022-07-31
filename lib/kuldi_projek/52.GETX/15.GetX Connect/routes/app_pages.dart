import 'package:get/get.dart';

import '../bindings/addB.dart';
import '../bindings/profileB.dart';
import '../pages/add_page.dart';
import '../pages/home_page.dart';
import '../pages/profile_page.dart';
import './route_name.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: RouteName.home,
      page: () => HomePage(),
    ),
    GetPage(
      name: RouteName.profile,
      page: () => ProfilePage(),
      binding: ProfileB(),
    ),
    GetPage(
      name: RouteName.add,
      page: () => AddPage(),
      binding: AddUserB(),
    ),
  ];
}
