// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final GlobalKey globalKey = GlobalKey();
  BuildContext? myContext;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(milliseconds: 500), () {
        ShowCaseWidget.of(myContext!).startShowCase([globalKey]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      builder: Builder(
        builder: (context) {
          myContext = context;
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.indigo[400],
              title: const Text("Dashboard"),
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Showcase(
                    key: globalKey,
                    description: 'Ini description',
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlutterLogo(size: 200),
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          "Adjust your water intake goal",
                          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey[700], fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
