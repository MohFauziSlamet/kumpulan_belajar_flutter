import '../../routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            // menggunakanan route dengan tanpa nama
            // langsung menggunakanan nama class nya
            // Get.to(
            //   () => CountPage(),
            //   binding: BindingsBuilder(
            //     () {
            //       Get.put(CountController());
            //     },
            //   ),
            // );

            // dengan menggunakanan nama sebagai route nya
            Get.toNamed(RouteNames.countPageRoute);
          },
          child: Text('Next >>'),
        ),
      ),
    );
  }
}
