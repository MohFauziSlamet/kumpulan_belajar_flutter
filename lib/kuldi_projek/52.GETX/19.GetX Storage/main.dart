import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import './routes/page_route.dart';
import './pages/login/login.dart';
import './controllers/loginC.dart';
import './controllers/authC.dart';
import './pages/home/home.dart';

void main(List<String> args) async {
  /// inisiasi awal untuk menjalankan get_storage
  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final loginC = Get.put(LoginC());
  final authC = Get.put(AuthC());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: authC.autoLogin(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Obx(
            () => GetMaterialApp(
              debugShowCheckedModeBanner: false,

              // kita lakukan auth di home
              // jika auth true => HomePage
              // jika auth false => LoginPage
              home: authC.isAuth.isTrue ? HomePage() : LoginPage(),
              getPages: AppPageRoute.pages,
            ),
          );
        }
        return const MaterialApp(
          home: Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
