/// Flutter code sample for Dismissible

// This sample shows how you can use the [Dismissible] widget to
// remove list items using swipe gestures. Swipe any of the list
// tiles to the left or right to dismiss them from the [ListView].

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: MyStatefulWidget(),
      ),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List<int> items = List<int>.generate(10, (int index) => index);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          child: ListTile(
            title: Text(
              'Item ${items[index]}',
            ),
            subtitle: Text(items.toString()),
          ),
          background: Container(
            color: Colors.green,
          ),
          key: ValueKey<int>(items[index]),
          //
          onDismissed: (DismissDirection direction) {
            setState(() {
              items.removeAt(index);
            });
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
        );
      },
    );
  }
}
