import 'package:get/get.dart';

class HomeController extends GetxController {
  var data = 'Initial Data'.obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.parameters.containsKey('data')) {
      data.value = Get.parameters['data']!;
    }
  }
}
