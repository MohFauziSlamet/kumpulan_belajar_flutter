import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileScaffold;
  final Widget tabletScaffold;
  final Widget desktopScaffold;
  const ResponsiveLayout(
      {required this.mobileScaffold,
      required this.tabletScaffold,
      required this.desktopScaffold,
      super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth < 500) {
        return mobileScaffold;
      }
      if (constraints.maxWidth < 1100) {
        return tabletScaffold;
      }
      return desktopScaffold;
    });
  }
}
