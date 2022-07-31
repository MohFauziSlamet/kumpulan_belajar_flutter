import 'package:get/get.dart';

// catatan
// obs (obeserver / observasi) => mengubah sebuah type data
// menjadi type GETX
// var counter = 0.obs => type GETX
// RxInt counter = 0 => type GETX
// Rx<int> counter = 0 => type GETX
class CounterController extends GetxController {
  var counter = 0.obs;
  var isDark = false.obs;

  void increment() => counter += 1;
  void decrement() {
    if (counter != 0) {
      counter -= 1;
    }
  }

  void changeThemes() {
    isDark.value = !isDark.value;
  }
}
