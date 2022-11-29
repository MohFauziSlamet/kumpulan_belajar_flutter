import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // membuat nama random dengan package faker
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Faker faker = Faker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Latihan Dismissible"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: 15,
        itemBuilder: (context, index) {
          // widget Dismissible , digunakan untuk
          // menghapus widget dengan cara di slide ke arah
          // horizontal maupun vertical
          return Dismissible(
            key: Key(
              index.toString(),
            ),

            direction: DismissDirection.endToStart,

            // menambahkan warna dibelakang
            background: Container(
              padding: const EdgeInsets.only(
                right: 30,
              ),
              alignment: Alignment.centerRight,
              color: Colors.red[400],
              child: const Icon(
                Icons.delete,
                size: 30,
              ),
            ),

            // cara lain membuat arah direction pada dismissible
            onDismissed: (direction) {
              direction == DismissDirection.endToStart;

              // return print(direction);
              if (direction == DismissDirection.endToStart) {
                // ignore: avoid_print
                print(" END TO START");
              } else {
                // ignore: avoid_print
                print("START TO END");
              }
            },

            // menambahkan konfirmasi dialog
            confirmDismiss: (direction) {
              return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    // judul alert
                    title: const Text("Confirm"),

                    // menambahkan keterangan detail
                    content:
                        const Text("Apakah anda yakin ingin menghapus ini ?"),

                    // menambahkan action , seperti tombol yes or no
                    actions: [
                      TextButton(
                        onPressed: () {
                          setState(
                            () {
                              // membuang tampilan alert , atau mengangkat alert
                              // jika false, maka batal dihapus
                              Navigator.of(context).pop(false);
                              print("klik no");
                            },
                          );
                        },
                        child: const Text("NO"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(
                            () {
                              // // membuang tampilan alert , atau mengangkat alert
                              // jika true, maka akan dihapus
                              Navigator.of(context).pop(true);
                              print("klik YES");
                            },
                          );
                        },
                        child: const Text("YES"),
                      ),
                    ],
                  );
                },
              );
            },

            child: ListTile(
              contentPadding: const EdgeInsets.all(10),
              leading: CircleAvatar(
                child: Text('${index + 1}'),
              ),
              title: Text(faker.person.name()),
              subtitle: Text(
                faker.lorem.sentences.toString(),
              ),
            ),
          );
        },
      ),
    );
  }
}
