import 'package:belajar_flutter/kuldi_projek/52.GETX/12.%20GetX%20Create/controller/shop_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../shop/widgets_component/shop_item.dart';

class ShopPage extends StatelessWidget {
  final shopController = Get.put(ShopController(), tag: 'total');
  final quantityController = Get.create(() => ShopController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop page'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => ShopItem(),
      ),
      floatingActionButton: CircleAvatar(
        child: Obx(() => Text(
              '${shopController.total}',
              style: TextStyle(fontSize: 25),
            )),
      ),
    );
  }
}
