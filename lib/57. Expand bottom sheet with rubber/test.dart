// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class TestBottomSheet extends StatefulWidget {
  const TestBottomSheet({Key? key}) : super(key: key);

  @override
  State<TestBottomSheet> createState() => _TestBottomSheetState();
}

class _TestBottomSheetState extends State<TestBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Text("text");
          },
        ));
    // return Scaffold(
    //   body: Container(
    //     height: MediaQuery.of(context).size.height,
    //     padding: const EdgeInsets.all(10.0),
    //     child: Column(
    //       children: const [
    //         Text("text"),
    //       ],
    //     ),
    //   ),
    // );
  }
}
