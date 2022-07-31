import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
        title: Text('Home Page'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.to(
              SecondPage(),
              arguments: 'Argumen from home page',
            );
          },
          child: Text('Second Page >>'),
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
        title: Text('Second Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "${Get.arguments}",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "${Get.rawRoute}",
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "${Get.routing.current}",
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(ThirdPage());
              },
              child: Text('Third Page >>'),
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
        title: Text('Third Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '${Get.previousRoute}',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              GetPlatform.isAndroid ? 'Ini android' : 'Ini bukan android ',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              GetPlatform.isIOS ? 'Ini IOS' : 'Ini bukan IOS ',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'ini height GetX :${Get.height}',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'ini width GetX :${Get.width}',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Orientasi :${context.orientation}',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text('<< Back'),
            ),
          ],
        ),
      ),
    );
  }
}
