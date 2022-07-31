import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// catatan:
/// AnimationController : membuat animasi controller

/// duration : Lamanya waktu animasi ini harus bertahan.

/// AnimationBehavior: Perilaku pengontrol ketika [AccessibilityFeatures.disableAnimations] benar.
/// Default ke [AnimationBehavior.normal] untuk konstruktor [AnimationController baru],
/// dan [AnimationBehavior.preserve] untuk konstruktor [AnimationController.unbounded] [baru].

/// debugLabel : Label yang digunakan dalam output [toString].
/// Dimaksudkan untuk membantu mengidentifikasi instans pengontrol animasi dalam output debug.

/// lowerBound : Nilai di mana animasi ini dianggap diberhentikan.

/// reverseDuration : Lamanya waktu animasi ini harus bertahan ketika masuk [terbalik].
/// Nilai [durasi] digunakan jika [reverseDuration] tidak ditentukan atau diatur ke null.

/// upperBound : nilai di mana animasi ini dianggap selesai.

/// repeat : Mulai menjalankan animasi ini ke arah depan, dan memulai ulang animasi saat selesai.
class HomeController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void onInit() {
    animationController = AnimationController(
      animationBehavior: AnimationBehavior.normal,
      duration: Duration(seconds: 5),
      vsync: this,
    )..repeat(
        reverse: false,
      );
  }
}
