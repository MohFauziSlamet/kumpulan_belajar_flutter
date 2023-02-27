import 'package:belajar_flutter/yt_mitch_koko/dashboard_web_responsive/constans.dart';
import 'package:belajar_flutter/yt_mitch_koko/dashboard_web_responsive/utils/my_box.dart';
import 'package:belajar_flutter/yt_mitch_koko/dashboard_web_responsive/utils/my_tile.dart';
import 'package:flutter/material.dart';

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({super.key});

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBackground,
      appBar: myAppBar,
      drawer: myDrawer,
      body: Column(
        children: [
          /// BOX 4
          AspectRatio(
            aspectRatio: 1,
            child: SizedBox(
              width: double.infinity,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 6,
                ),
                itemCount: 4,
                // shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(10),
                itemBuilder: (BuildContext context, int index) {
                  return const MyBox();
                },
              ),
            ),
          ),

          /// TILE
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              // shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return const MyTile();
              },
            ),
          )
        ],
      ),
    );
  }
}
