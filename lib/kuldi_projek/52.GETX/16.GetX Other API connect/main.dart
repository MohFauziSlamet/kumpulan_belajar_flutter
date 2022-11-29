import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.to(
              const SecondPage(),
              arguments: 'Argumen from home page',
            );
          },
          child: const Text('Second Page >>'),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "${Get.arguments}",
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "${Get.rawRoute}",
              style: const TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              Get.routing.current,
              style: const TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(const ThirdPage());
              },
              child: const Text('Third Page >>'),
            ),
          ],
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              Get.previousRoute,
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              GetPlatform.isAndroid ? 'Ini android' : 'Ini bukan android ',
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              GetPlatform.isIOS ? 'Ini IOS' : 'Ini bukan IOS ',
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              'ini height GetX :${Get.height}',
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              'ini width GetX :${Get.width}',
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              'Orientasi :${context.orientation}',
              style: const TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('<< Back'),
            ),
          ],
        ),
      ),
    );
  }
}
