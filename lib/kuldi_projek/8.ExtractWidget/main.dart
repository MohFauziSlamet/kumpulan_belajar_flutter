import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // digunkanan untuk membuat data palsu secara otomatis
  // sebelum menggunakan kita harus memasukan dependenci pada pabspec.yaml
  var faker = Faker();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return chatItem(
                  imageUrl: "assets/mauludy.jpg",
                  title: faker.person.name(),
                  subTitle: faker.lorem.sentence(),
                );
              })),
    );
  }
}

class chatItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subTitle;

  // constructor
  const chatItem(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      leading: CircleAvatar(
        backgroundImage: AssetImage(imageUrl),
      ),
      title: Text(title),
      subtitle: Text(subTitle),
      trailing: const Text("10.00 pm"),
    );
  }
}
