import 'package:belajar_flutter/Projek_Toko_Baju/page/detail_home_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Modiste Khas Amey'),
          actions: [
            GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(7),
                ),
                margin: const EdgeInsets.all(8),
                width: 80,
                child: const Center(
                  child: Text(
                    "Hubungi Kami",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white70,
                shape: BoxShape.circle,
              ),
              margin: const EdgeInsets.all(8),
              width: 50,
            ),
          ],
        ),
        body: const DetailHomePage(),
      ),
    );
  }
}
