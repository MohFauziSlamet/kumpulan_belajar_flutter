import 'package:belajar_flutter/kuldi_projek/52.GETX/2.state_management_getX/1.obx/controllers/orang_satu_controller.dart';
import 'package:belajar_flutter/kuldi_projek/52.GETX/2.state_management_getX/1.obx/models/orang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../1.obx/models/person.dart';
import '../1.obx/controllers/orang_controller.dart';

void main(List<String> args) {
  runApp(Contoh3());
}

// contoh 5
// menggunakan obs pada objek class nya dalam controller
// dan menggunakan controller
class Contoh5 extends StatelessWidget {
  //
  final controller = Get.put(OrangSatuController());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('State Management GETX OBX'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                'Nama saya ${controller.orang.value.nama}',
                style: const TextStyle(fontSize: 30),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    controller.changeUpperCase();
                  },
                  child: const Text('ToUpper'),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.changeLowerCase();
                  },
                  child: const Text('ToLower'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// contoh 4
// menggunakan obs pada atribut class nya
// dan menggunakan controller
class Contoh4 extends StatelessWidget {
  //
  final orangCntrllr = Get.put(OrangController());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('State Management GETX OBX'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                'Nama saya ${orangCntrllr.orang.nama}',
                style: const TextStyle(fontSize: 30),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    orangCntrllr.upper();
                  },
                  child: const Text('ToUpper'),
                ),
                ElevatedButton(
                  onPressed: () {
                    orangCntrllr.lower();
                  },
                  child: const Text('ToLower'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// contoh 3
// menggunakan obs pada objek class nya
class Contoh3 extends StatelessWidget {
  final orang = Get.put(Orang());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('State Management GETX OBX'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                'Nama saya ${orang.nama}',
                style: const TextStyle(fontSize: 30),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    orang.nama.value = orang.nama.value.toUpperCase();
                  },
                  child: const Text('ToUpper'),
                ),
                ElevatedButton(
                  onPressed: () {
                    orang.nama.value = orang.nama.value.toLowerCase();
                  },
                  child: const Text('ToLower'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// contoh 2
// menggunakan obs pada atribut class nya
class Contoh2 extends StatelessWidget {
  Person personC = Get.put(Person());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('State Management GETX OBX'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                'Nama saya ${personC.name.value}',
                style: const TextStyle(fontSize: 30),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    personC.upper();
                  },
                  child: const Text('ToUpper'),
                ),
                ElevatedButton(
                  onPressed: () {
                    personC.lower();
                  },
                  child: const Text('ToLower'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// contoh 1 (dasar)
class Contoh1 extends StatelessWidget {
  RxInt counter = 0.obs;

  void add() {
    counter++;
  }

  void mines() {
    if (counter != 0) {
      counter--;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('State Management GETX OBX'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                'Angka ${counter.value}',
                style: const TextStyle(fontSize: 30),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    mines();
                  },
                  child: const Text('Dikurangi'),
                ),
                ElevatedButton(
                  onPressed: () {
                    add();
                  },
                  child: const Text('Ditambah'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
