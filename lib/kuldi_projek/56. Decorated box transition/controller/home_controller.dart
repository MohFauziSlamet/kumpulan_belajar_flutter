import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// catatan:
/// AnimationController : membuat animasi controller
/// duration : Lamanya waktu animasi ini harus bertahan.
/// AnimationBehavior: Perilaku pengontrol ketika [AccessibilityFeatures.disableAnimations] benar.
/// Default ke [AnimationBehavior.normal] untuk konstruktor [AnimationController baru],
/// dan [AnimationBehavior.preserve] untuk konstruktor [AnimationController.unbounded] [baru].
/// debugLabel : Label yang digunakan dalam output [toString]. Dimaksudkan untuk membantu mengidentifikasi instans pengontrol animasi dalam output debug.
/// lowerBound : Nilai di mana animasi ini dianggap diberhentikan.
/// reverseDuration : Lamanya waktu animasi ini harus bertahan ketika masuk [terbalik].
/// Nilai [durasi] digunakan jika [reverseDuration] tidak ditentukan atau diatur ke null.
/// upperBound : nilai di mana animasi ini dianggap selesai.
///
class HomeController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController animationController;

  ///
  DecorationTween decorationTween = DecorationTween(
    end: BoxDecoration(
      color: const Color(0xFFFFFFFF),
      border: Border.all(style: BorderStyle.none),
      borderRadius: BorderRadius.circular(60.0),
      boxShadow: const <BoxShadow>[
        BoxShadow(
          color: Color(0x66666666),
          blurRadius: 10.0,
          spreadRadius: 3.0,
          offset: Offset(0, 6.0),
        )
      ],
    ),
    begin: BoxDecoration(
      color: const Color(0xFFFFFFFF),
      border: Border.all(
        style: BorderStyle.none,
      ),
      borderRadius: BorderRadius.zero,
      // No shadow.
    ),
  );

  @override
  void onInit() {
    animationController = AnimationController(
      animationBehavior: AnimationBehavior.normal,
      duration: Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
