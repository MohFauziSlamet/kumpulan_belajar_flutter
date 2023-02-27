// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:belajar_flutter/51.%20Flutter%20Showcase/multi%20page/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey globalKey1 = GlobalKey();
  final GlobalKey globalKey2 = GlobalKey();
  final GlobalKey globalKey3 = GlobalKey();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ShowCaseWidget.of(context).startShowCase([
        globalKey1,
        globalKey2,
        globalKey3,
      ]);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo[400],
        leading: IconButton(
          onPressed: () {
            setState(() {
              ShowCaseWidget.of(context).startShowCase([
                globalKey1,
                globalKey2,
                globalKey3,
              ]);
            });
          },
          icon: const Icon(
            Icons.help_rounded,
          ),
        ),
        title: const Text("Water Check"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingPage()),
              );
            },
            icon: Showcase(
              key: globalKey1,
              description: 'Change your water target goal',
              targetShapeBorder: const CircleBorder(),
              tooltipBackgroundColor: Colors.indigo[900]!,
              targetPadding: const EdgeInsets.all(10),
              disposeOnTap: true,
              onTargetClick: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingPage()),
                ).then((_) {
                  ShowCaseWidget.of(context).startShowCase([globalKey2, globalKey3]);
                });
              },
              child: const Icon(
                Icons.settings,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Showcase.withWidget(
        key: globalKey3,
        height: 50,
        width: 50,
        targetPadding: const EdgeInsets.all(10),
        targetShapeBorder: const CircleBorder(),
        container: const Icon(
          size: 50,
          color: Colors.white,
          Icons.local_drink,
        ),
        child: FloatingActionButton(
          backgroundColor: Colors.indigo[900],
          child: const Icon(Icons.add),
          onPressed: () {},
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Showcase(
            key: globalKey2,
            title: 'Ini judul',
            description: 'Flutter Logo',
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  FlutterLogo(size: 100),
                  SizedBox(
                    height: 60.0,
                  ),
                  FlutterLogo(size: 100),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
