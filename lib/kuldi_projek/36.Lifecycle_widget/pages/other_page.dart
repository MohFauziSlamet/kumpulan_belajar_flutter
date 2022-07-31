import 'package:belajar_flutter/kuldi_projek/36.Lifecycle_widget/pages/counter_page.dart';
import 'package:flutter/material.dart';

class OtherPage extends StatelessWidget {
  static const routName = "/other-page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Other Page"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(
              context,
              CounterPage.routName,
              arguments: ModalRoute.of(context)!.settings.arguments
                  as int, // kita balikin lagi nilai , agar saat kembali. nilai tidak berubah
            );
          },
          child: Text("GOto counter page"),
        ),
      ),
    );
  }
}
