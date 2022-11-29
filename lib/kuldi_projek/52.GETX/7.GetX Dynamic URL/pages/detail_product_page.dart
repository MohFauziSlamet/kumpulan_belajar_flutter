import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailProductPage extends StatelessWidget {
  const DetailProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Product id ${Get.parameters['id']}'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
            'Product Name : ${Get.parameters['name']} - Ukuran : ${Get.parameters['ukuran']}'),
      ),
    );
  }
}
