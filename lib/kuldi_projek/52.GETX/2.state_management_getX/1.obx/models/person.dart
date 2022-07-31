import 'package:get/get.dart';

class Person {
  // variabel yang dijadikan obs
  RxString name = 'fauziii'.obs;

  void upper() {
    name.value = name.value.toUpperCase();
  }

  void lower() {
    name.value = name.value.toLowerCase();
  }
}
