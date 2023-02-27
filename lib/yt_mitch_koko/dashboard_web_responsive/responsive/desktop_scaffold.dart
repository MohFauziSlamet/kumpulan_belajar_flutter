import 'package:belajar_flutter/yt_mitch_koko/dashboard_web_responsive/constans.dart';
import 'package:flutter/material.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({super.key});

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBackground,
      appBar: myAppBar,
      body: Row(
        children: [
          /// OPEN DRAWER
          myDrawer
        ],
      ),
    );
  }
}
