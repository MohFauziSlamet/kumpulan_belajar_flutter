import 'package:get/get.dart';
import '../providers/userP.dart';

class MyC extends GetxController with StateMixin<Map<String, dynamic>> {
  void getData() {
    try {
      UserP().getUser().then(
        (value) {
          if (value.statusCode == 200) {
            final data = value.body['data'] as Map<String, dynamic>;
            change(
              data,
              status: RxStatus.success(),
            );
          }
        },
        onError: (_) {
          change(
            null,
            status: RxStatus.error('Tidak dapat data dari API'),
          );
        },
      );
    } catch (e) {
      change(
        null,
        status: RxStatus.error(e.toString()),
      );
    }
  }

  @override
  void onInit() {
    change(null, status: RxStatus.empty());
    super.onInit();
  }
}
