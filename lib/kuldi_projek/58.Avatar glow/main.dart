import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Latihan Avatar Glow'),
          centerTitle: true,
        ),
        body: const Center(
          child: AvatarGlow(
            endRadius: 150,
            glowColor: Colors.black12,
            child: CircleAvatar(
              backgroundColor: Colors.black26,
              radius: 100,
              backgroundImage: AssetImage('assets/images/mauludy5.jpg'),
            ),
          ),
        ),
      ),
    );
  }
}
