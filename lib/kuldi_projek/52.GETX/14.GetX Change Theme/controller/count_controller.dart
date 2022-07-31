import 'package:get/get.dart';

class CountController extends GetxController {
  RxInt count = 0.obs;

  void add() {
    count.value++;
  }

  void mines() {
    if (count.value != 0) {
      count.value--;
    }
  }
}
