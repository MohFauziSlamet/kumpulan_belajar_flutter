import 'package:get/get.dart';
import '../controller/count_controller.dart';

// untuk mengambil data dari controller
class CountBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      CountController(),
      // agar data tidak dihapus ketika kita keluar dari page tsb
      // permanent: true,
    );
  }
}
