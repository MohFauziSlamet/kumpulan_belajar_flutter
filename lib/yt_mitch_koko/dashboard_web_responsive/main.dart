import 'package:belajar_flutter/yt_mitch_koko/dashboard_web_responsive/responsive/desktop_scaffold.dart';
import 'package:belajar_flutter/yt_mitch_koko/dashboard_web_responsive/responsive/mobile_scaffold.dart';
import 'package:belajar_flutter/yt_mitch_koko/dashboard_web_responsive/responsive/responsive_layout.dart';
import 'package:belajar_flutter/yt_mitch_koko/dashboard_web_responsive/responsive/tablet_scaffold.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveLayout(
        mobileScaffold: MobileScaffold(),
        tabletScaffold: TabletScaffold(),
        desktopScaffold: DesktopScaffold(),
      ),
    );
  }
}
