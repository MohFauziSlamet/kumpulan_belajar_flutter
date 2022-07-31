import '../pages/detail_product_page.dart';
import '../pages/home_page.dart';
import '../routes/route_name.dart';
import 'package:get/get.dart';
import '../pages/product_page.dart';

class AppPageRoute {
  static final pages = [
    GetPage(
      name: RouteNames.homePage,
      page: () => HomePage(),
    ),
    GetPage(
      name: RouteNames.productPage,
      page: () => ProductPage(),
    ),
    GetPage(
      name: RouteNames.productPage + '/:id?',
      page: () => DetailProductPage(),
    ),
  ];
}
