import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/shop_controller.dart';

class ShopItem extends StatelessWidget {
  final shopController = Get.find<ShopController>(); // find quantityController

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {
            shopController.quantity.value--;

            Get.find<ShopController>(tag: 'total').total.value--;
          },
          icon: Icon(Icons.remove),
        ),
        Obx(() => Text(
              '${shopController.quantity}',
              style: TextStyle(fontSize: 25),
            )),
        IconButton(
          onPressed: () {
            shopController.quantity.value++;

            Get.find<ShopController>(tag: 'total').total.value++;
          },
          icon: Icon(Icons.add),
        ),
      ],
    );
  }
}
