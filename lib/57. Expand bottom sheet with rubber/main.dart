import 'package:belajar_flutter/57.%20Expand%20bottom%20sheet%20with%20rubber/test.dart';
import 'package:flutter/material.dart';
import 'package:rubber/rubber.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'default.dart';
import 'menu.dart';
import 'spring.dart';
import 'padding.dart';
import 'scroll.dart';
import 'dismissable.dart';

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
        onPressed: () {
          // showModalBottomSheet(
          //   context: context,
          //   isScrollControlled: true,
          //   builder: (context) => DraggableScrollableSheet(
          //       initialChildSize: 0.5,
          //       maxChildSize: 0.9,
          //       minChildSize: 0.5,
          //       expand: false,
          //       builder: (context, scrollController) {
          //         return SingleChildScrollView(
          //           controller: scrollController,
          //           child: TestBottomSheet(),
          //         );
          //       }),
          // );

          // showModalBottomSheet(
          //   context: context,
          //   builder: (context) => RubberBottomSheet(
          //     animationController: RubberAnimationController(vsync: this),
          //     lowerLayer: const SizedBox(),
          //     upperLayer: const TestBottomSheet(),
          //   ),
          // );

          // RubberBottomSheet(
          //   animationController: RubberAnimationController(vsync: this),
          //   lowerLayer: const TestBottomSheet(),
          //   upperLayer: const TestBottomSheet(),
          // );

          showSlidingBottomSheet(
            context,
            builder: (context) => SlidingSheetDialog(
              snapSpec: SnapSpec(
                snappings: [0.5, 0.9],
              ),
              builder: (context, state) => Container(
                color: Colors.amber,
              ),
            ),
          );
          // showSlidingBottomSheet(
          //   context,
          //   builder: (context) => SlidingSheetDialog(
          //     snapSpec: SnapSpec(
          //       snappings: [0.5, 0.7],
          //     ),
          //     builder: (context, state) => TestBottomSheet(),
          //   ),
          // );
        },
      ),
      body: ListView(
        children: <Widget>[
          ElevatedButton(
            child: const Text("Default"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DefaultPage()),
              );
            },
          ),
          ElevatedButton(
            child: const Text("Menu"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MenuPage()),
              );
            },
          ),
          ElevatedButton(
            child: const Text("Spring settings"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SpringPage()),
              );
            },
          ),
          ElevatedButton(
            child: const Text("Animation Padding"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AnimationPaddingPage()),
              );
            },
          ),
          ElevatedButton(
            child: const Text("Scrolling"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ScrollPage()),
              );
            },
          ),
          ElevatedButton(
            child: const Text("Dismissable"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DismissablePage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
