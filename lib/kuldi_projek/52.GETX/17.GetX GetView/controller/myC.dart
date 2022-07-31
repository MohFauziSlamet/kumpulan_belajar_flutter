import 'package:get/get.dart';

class MyC extends GetxController {
  RxInt nilai = 0.obs;

  void add() {
    nilai++;
  }

  void mines() {
    if (nilai.value != 0) {
      nilai--;
    }
  }
}
