import 'package:flutter/material.dart';

// catatan :
// untuk membuat jarak dengan dua Container , bisa menggunakan SizedBox,
// maupun menggunakan margin pada salah satu container .
// atau bisa keduanya , dengan nilai masing" setengah nya . jika jarak yang diinginkan 20
// maka masing" memasang margin 10.
class ColumnContainer extends StatelessWidget {
  const ColumnContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello World'),
        leading: const FlutterLogo(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            // margin: const EdgeInsets.only(right: 20),
            width: 200,
            height: 200,
            color: Colors.blue,
            child: const Center(
              child: Text(
                'Hello',
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
          ),
          // memberi jarak dengan SizedBox
          const SizedBox(height: 20),
          Container(
            width: 200,
            height: 200,
            // margin: const EdgeInsets.only(top: 20),
            color: Colors.amber,
            child: const Center(
              child: Text(
                'Hello',
                style: TextStyle(fontSize: 40, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
