import 'package:get/get.dart';

class CountController extends GetxController {
  RxInt counter = 0.obs;

  void add() {
    counter++;
  }

  void mines() {
    if (counter != 0) {
      counter--;
    }
  }
}
