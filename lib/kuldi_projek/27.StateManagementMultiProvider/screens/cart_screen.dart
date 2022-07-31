import 'package:belajar_flutter/kuldi_projek/27.StateManagementMultiProvider/providers/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cart",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(
              20,
            ),
            child: Container(
              padding: const EdgeInsets.all(
                20,
              ),
              child: Text(
                "Total : \$ ${cartData.totalHarga}",
                style: TextStyle(fontSize: 35),
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: cartData.items.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: IconButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Produk Berhasil Dikurangi"),
                            duration: Duration(
                              milliseconds: 500,
                            ),
                          ),
                        );
                        // data yang dipakai dari provider productData
                        cartData.removeCart(
                            cartData.items.values.toList()[index].id);
                      },
                      icon: Icon(Icons.remove)),
                ),
                // mengambil data dari provider
                // karena data yang diambil dalam bentuk map , kita harus ubah dalam bentuk list
                // lalu kita ambil value , by index .
                title: Text(cartData.items.values.toList()[index].title),
                subtitle: Text("${cartData.items.values.toList()[index].qty}"),
                trailing: Container(
                  child: Text(
                    "${cartData.items.values.toList()[index].price * cartData.items.values.toList()[index].qty}",
                  ),
                ),
                minLeadingWidth: 30,
                hoverColor: Colors.grey,
              );
            },
          ))
        ],
      ),
    );
  }
}
