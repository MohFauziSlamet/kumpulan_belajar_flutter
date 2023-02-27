import 'package:belajar_flutter/57.%20Expand%20bottom%20sheet%20with%20rubber/test.dart';
import 'package:flutter/material.dart';
import 'package:rubber/rubber.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.cyan,
      ),
      home: const HomePage(
        title: "Home",
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.cyan[900]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: showSheet,
      ),
      body: Container(),
    );
  }

  /// bottom sheet
  Future showSheet() => showSlidingBottomSheet(
        context,
        builder: (context) => SlidingSheetDialog(
          cornerRadius: 18,
          snapSpec: const SnapSpec(
            initialSnap: 1,
            snappings: [0.4, 1],
          ),
          builder: buildSheet,
        ),
      );

  Widget buildSheet(cxt, state) => Material(
        child: Column(
          children: [
            Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () => SheetController.of(context)?.expand(),
                  child: const Text("Read more"),
                );
              },
            ),
            // ElevatedButton(
            //   onPressed: () => Navigator.of(context).pop(),
            //   child: const Text("Close"),
            // ),
            const SizedBox(
              height: 200,
              child: Center(
                child: Text("text"),
              ),
            ),
            const SizedBox(
              height: 200,
              child: Center(
                child: Text("text"),
              ),
            ),
            const SizedBox(
              height: 200,
              child: Center(
                child: Text("text"),
              ),
            ),
            const SizedBox(
              height: 200,
              child: Center(
                child: Text("text"),
              ),
            ),
            const SizedBox(
              height: 200,
              child: Center(
                child: Text("text"),
              ),
            ),
          ],
        ),
      );
}
