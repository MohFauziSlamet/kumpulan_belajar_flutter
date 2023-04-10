import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Home(),
      routes: {
        "/home": (p0) => Home(),
      },
    );
  }
}

class Home extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Obx(() => Text(controller.data.value)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/home', parameters: {'data': 'New Data'});
        },
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}
