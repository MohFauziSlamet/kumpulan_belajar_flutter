import 'package:flutter/material.dart';
import 'package:belajar_flutter/kuldi_projek/36.Lifecycle_widget/pages/other_page.dart';

class WidgetCounter extends StatefulWidget {
  WidgetCounter({
    Key? key,
    required this.counter,
  }) {
    print("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= ");

    print("Constructor widget counter");
  }

  final int counter;

  @override
  State<WidgetCounter> createState() {
    print("createState() widget counter");

    return _WidgetCounterState();
  }
}

class _WidgetCounterState extends State<WidgetCounter> {
  int counter = 0;
// penulisan lifecycle , harus dibawah variabel , jika terdapat suatu variabel
// karena lifecycle bersifat override

// initState() hanya dijalankan satu kali , ketika pertama kali aplikasi dijalankan
  @override
  void initState() {
    super.initState(); // peletakan initstate harus diatas
    // didalam initstate tidak boleh ada context
    print("initState() WidgetCounter");
  }

  @override
  void didUpdateWidget(covariant WidgetCounter oldWidget) {
    super.didUpdateWidget(oldWidget);
    //didUpdateWidget harus dijalankan di atas (pertama kali)

    print("didUpdateWidget() WidgetCounter");
    print("method old widget ${oldWidget.counter}");
    // oldWidget merupakan sebuah kelas , dan memiliki contructor counter
    // oldWidget menyimpan widget atau state yang lama
    print("method new widget ${widget.counter}");
  }

  // widget deactivate dan dispose , akan dijalankan ketika , state atau page dihapus
  @override
  void deactivate() {
    print("--------------------");
    print("deactivate() WidgetCounter");

    // deactivate dijalankan diakhir
    super.deactivate();
  }

// widget deactivate dan dispose , akan dijalankan ketika , state atau page dihapus
// biasanya menggunakan navigator pushreplacement
  @override
  void dispose() {
    print("dispose() WidgetCounter");

    //  dispose dijalankan diakhir
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Build() methode widget counter");
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          widget.counter.toString(),
          style: TextStyle(fontSize: 30),
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, OtherPage.routName,
                arguments: widget.counter // mengirim data nilai ke OtherPage
                );
          },
          child: Text("goto second page"),
        ),
      ]),
    );
  }
}
