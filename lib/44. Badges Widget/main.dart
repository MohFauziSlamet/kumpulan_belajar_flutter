// ignore_for_file: library_private_types_in_public_api

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Badges';

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.purple[900],
          primaryColor: Colors.red,
        ),
        home: const MainPage(title: title),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int countFavourites = 97;
  int countMessages = 7;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        bottomNavigationBar: buildBottomBar(),
        body: Container(
          padding: const EdgeInsets.all(32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Badge(
                  padding: const EdgeInsets.all(8),
                  toAnimate: false,
                  badgeContent: Text(
                    '$countFavourites',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: buildButton(
                    text: 'Increase Favourites',
                    onClicked: () => setState(() => countFavourites += 1),
                  ),
                ),
                const SizedBox(height: 32),
                Badge(
                  padding: const EdgeInsets.all(8),
                  toAnimate: false,
                  badgeColor: Colors.orange,
                  shape: BadgeShape.square,
                  position: BadgePosition.topStart(),
                  // showBadge: false,
                  badgeContent: Text(
                    '$countMessages',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: buildButton(
                    text: 'Increase Messages',
                    onClicked: () => setState(() => countMessages += 1),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget buildButton({
    required String text,
    required VoidCallback onClicked,
  }) =>
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
        ),
        onPressed: onClicked,
        child: Text(
          text,
          style: const TextStyle(fontSize: 20),
        ),
      );

  Widget buildBottomBar() => BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                const Icon(Icons.favorite_border),
                Positioned(
                  top: -6,
                  right: -20,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 10,
                    child: Text(
                      countFavourites.toString(),
                      style: TextStyle(
                        fontSize: 16 - (countFavourites.toString().length - 1) * 3.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // icon: buildCustomBadge(
            //   counter: countFavourites,
            //   child: const Icon(Icons.favorite_border),
            // ),
            label: 'Favourites',
          ),
          // BottomNavigationBarItem(
          //   icon: buildCustomBadge(
          //     counter: countFavourites,
          //     child: const Icon(Icons.favorite_border),
          //   ),
          //   label: 'Favourites',
          // ),
          BottomNavigationBarItem(
            icon: buildCustomBadge(
              counter: countMessages,
              child: const Icon(Icons.message),
            ),
            label: 'Messages',
          ),
        ],
        onTap: (int index) {},
      );

  Widget buildCustomBadge({
    required int counter,
    required Widget child,
  }) {
    final text = counter.toString();
    final deltaFontSize = (text.length - 1) * 3.0;

    return Stack(
      children: [
        child,
        Positioned(
          top: -6,
          right: -20,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 10,
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16 - deltaFontSize,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
