import 'package:flutter/material.dart';
import 'package:pixel_perfect/pixel_perfect.dart';

const mockUpHeight = 812;
const mockUpWidth = 375;
void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final scale = mockUpWidth / width;
    final textScaleFactor = width / mockUpWidth;
    return PixelPerfect(
      // assetPath: "assets/images/mauludy.jpg",
      scale: scale,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 9),
          child: Scaffold(
            // appBar: AppBar(
            //   title: const Text("Dashboard"),
            //   actions: const [],
            // ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        "assets/images/mauludy.jpg",
                        width: 50,
                        height: 50,
                        fit: BoxFit.fill,
                        scale: scale,
                      ),
                    ),
                    for (var stats in userStats) ...[
                      SizedBox(width: stats.leftPaddingFactor / mockUpWidth * width),
                      Column(
                        children: [
                          Text(
                            stats.value.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.5),
                            textScaleFactor: textScaleFactor,
                          ),
                          Text(
                            stats.name,
                            textScaleFactor: textScaleFactor,
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.5),
                          ),
                        ],
                      ),
                    ]
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserStatus {
  final int value;
  final String name;
  final double leftPaddingFactor;

  UserStatus({
    required this.value,
    required this.name,
    required this.leftPaddingFactor,
  });
}

final userStats = [
  UserStatus(value: 100, name: "Post", leftPaddingFactor: 41),
  UserStatus(value: 200, name: "Follower", leftPaddingFactor: 39),
  UserStatus(value: 100, name: "Following", leftPaddingFactor: 24),
];
