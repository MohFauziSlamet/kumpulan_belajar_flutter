import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

void main(List<String> args) {
  runApp(const FakerApp());
}

class FakerApp extends StatelessWidget {
  const FakerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  var fakerData = Faker();

  // semisal dapat data tanggal dati database , yang berupa string
  // kenapa kita memakai toIso8601String , bukan toString saja.
  // karena didalam toIso8601String, kita bisa membalikkan type data string menjadi
  // DateTime
  String tanggal = DateTime.now().toIso8601String();

  @override
  Widget build(BuildContext context) {
    RxInt currentIndex = 0.obs;
    List<Widget> widgets = [
      // index 0
      ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            minVerticalPadding: 10,
            leading: CircleAvatar(
              backgroundColor: Colors.grey[300],
              backgroundImage: NetworkImage(
                'https://picsum.photos/id/${870 + index}/200/300',
              ),
            ),
            title: Text(fakerData.person.name()),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(fakerData.internet.email()),

                // format tanggal setelah dirubah
                Text(
                  DateFormat.yMMMMEEEEd().add_Hms().format(
                        DateTime.parse(tanggal),
                      ),
                ),

                // format tanggal asli
                Text(tanggal)
              ],
            ),
          );
        },
      ),

      // index 1
      Center(
        child: Text("data 2"),
      ),
      // index 2
      Center(
        child: Text("data 3"),
      ),
      // index 3
      Center(
        child: Text("data 4"),
      ),
      // index 4
      Center(
        child: Text("data 5"),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan Faker'),
        centerTitle: true,
      ),
      body: Obx(
        () => widgets[currentIndex.value],
      ),
      bottomNavigationBar: ConvexAppBar(
          items: [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.map, title: 'Discovery'),
            TabItem(icon: Icons.add, title: 'Add'),
            TabItem(icon: Icons.message, title: 'Message'),
            TabItem(icon: Icons.people, title: 'Profile'),
          ],
          initialActiveIndex: currentIndex.value, //optional, default as 0
          onTap: (int i) {
            currentIndex.value = i;
          }),
    );
  }
}
