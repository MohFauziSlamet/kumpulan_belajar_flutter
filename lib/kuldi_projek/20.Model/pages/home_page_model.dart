import 'dart:math';

import 'package:belajar_flutter/kuldi_projek/20.Model/models/product.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class HomePageModel extends StatelessWidget {
  final Faker faker = Faker();

  HomePageModel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Product> dummyData = List.generate(
      10,
      (index) {
        return Product(
            imageUrl: 'assets/images/mauludy.jpg',
            judul: faker.person.name(),
            harga: 10000 + Random().nextInt(100000),
            deskripsi: faker.lorem.sentence());
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Latihan Models",
        ),
      ),

      //
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 3 / 5,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: 2),
        itemBuilder: (context, index) {
          return GridTile(
            footer: Container(
              color: Colors.grey,
              margin: const EdgeInsets.only(bottom: 25),
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(dummyData[index].judul),
                  Text(dummyData[index].harga.toString()),
                  Text(dummyData[index].deskripsi),
                ],
              ),
            ),
            child: Image(
              image: AssetImage(
                dummyData[index].imageUrl,
              ),
            ),
          );
        },
        itemCount: dummyData.length,
      ),
    );
  }
}
