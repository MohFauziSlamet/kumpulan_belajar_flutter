import 'package:belajar_flutter/yt_mitch_koko/smart_home/utils/smart_device_box.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // CONSTAN PADDING
  final double horizontalPadding = 40.0;

  final double verticalPadding = 25.0;

  // LIST OF SMART DEVICE
  List smartDevice = [
    ['Smart Light', 'assets/yt_mitch_koko/icons/light-bulb.png', true],
    ['Smart Ac', 'assets/yt_mitch_koko/icons/air-conditioner.png', false],
    ['Smart Tv', 'assets/yt_mitch_koko/icons/smart-tv.png', false],
    ['Smart Fan', 'assets/yt_mitch_koko/icons/fan.png', false],
  ];

  // power switched changes
  void powerSwitchedChange(bool value, int index) {
    setState(() {
      smartDevice[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CUSTOM APPBAR
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // MENU ICON
                  Image.asset(
                    'assets/yt_mitch_koko/icons/menu.png',
                    height: 45,
                    color: Colors.grey[800],
                  ),
                  // ACCOUNT ICON
                  Icon(
                    Icons.person,
                    size: 45,
                    color: Colors.grey[800],
                  ),
                ],
              ),
            ),

            // SPACE
            const SizedBox(height: 20),

            // WELCOME
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[700],
                    ),
                  ),
                  Text(
                    'Fauzi',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 72,
                    ),
                  ),
                ],
              ),
            ),

            // SPACE
            const SizedBox(height: 25),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Divider(
                color: Colors.grey[400],
              ),
            ),
            // SPACE
            const SizedBox(height: 25),

            // SMART DEVICE + GRID
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text(
                'Smart Device',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
            ),

            // SPACE
            const SizedBox(height: 10),
            // GRID
            Expanded(
                child: GridView.builder(
              // physics:  NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(25),
              itemCount: smartDevice.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.3,
              ),
              itemBuilder: (context, index) {
                return SmartDeviceBox(
                  iconPath: smartDevice[index][1],
                  smartDeviceName: smartDevice[index][0],
                  isPowerOn: smartDevice[index][2],
                  onChanged: (value) => powerSwitchedChange(value, index),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
