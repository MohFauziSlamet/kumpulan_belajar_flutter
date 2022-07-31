import '../controller/myC.dart';
import 'package:get/get.dart';

class MyB implements Bindings {
  @override
  void dependencies() {
    Get.put(MyC());
  }
}
