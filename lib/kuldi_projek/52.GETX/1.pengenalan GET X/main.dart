import 'package:belajar_flutter/kuldi_projek/52.GETX/1.pengenalan%20GET%20X/controller/counter_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

// catatan
// get.put : digunakan untuk mengambil data dari sebuah class
// Obx() : merupakan fungsi untuk melihat isi data dari sebuah class ,
//  - dan bisa mengambil dan menggunakan datanya.
// Get.find() : untuk memunkan apakah kita sudah pernah melakukan Get.put(),

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // memanggil dan menggunakan data yang dimiliki oleh CounterController
  final counterC = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: counterC.isDark.value ? ThemeData.dark() : ThemeData.light(),
        home: CounterApp(),
      ),
    );
  }
}

class CounterApp extends StatelessWidget {
  CounterApp({
    Key? key,
  }) : super(key: key);

  // mengambil data dari Get.put()
  final counterCntrllr = Get.find<CounterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latihan Counter dengan GetX'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () {
              return Text(
                'Angka ${counterCntrllr.counter}',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              );
            },
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  // memanggil fungsi mengurangi dari clas CounterController
                  counterCntrllr.decrement();
                  // print(counterCntrllr.counter);
                },
                child: Text(
                  '-',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // memanggil fungsi menambah dari clas CounterController
                  counterCntrllr.increment();
                  // print(counterCntrllr.counter);
                },
                child: Text(
                  '+',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterCntrllr.changeThemes();
        },
        child: Icon(Icons.change_circle),
      ),
    );
  }
}
