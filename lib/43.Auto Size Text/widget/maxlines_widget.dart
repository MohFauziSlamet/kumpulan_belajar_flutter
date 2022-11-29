// ignore_for_file: library_private_types_in_public_api

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MaxLinesWidget extends StatefulWidget {
  const MaxLinesWidget({Key? key}) : super(key: key);

  @override
  _MaxLinesWidgetState createState() => _MaxLinesWidgetState();
}

class _MaxLinesWidgetState extends State<MaxLinesWidget> {
  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildOneLine(context),
              const SizedBox(height: 32),
              buildTwoLines(context),
            ],
          ),
        ),
      );

  Widget buildOneLine(BuildContext context) {
    const int maxLines = 1;

    return Container(
      color: Colors.red,
      width: MediaQuery.of(context).size.width,
      child: const AutoSizeText(
        'This Text will fit to maximum $maxLines line. Lorem ipsum.',
        style: TextStyle(fontSize: 48), // maks size fonts
        maxLines: maxLines,
      ),
    );
  }

  Widget buildTwoLines(BuildContext context) {
    const int maxLines = 2;

    return Container(
      color: Colors.blue,
      width: MediaQuery.of(context).size.width,
      child: const AutoSizeText(
        'This Text will fit to maximum $maxLines lines. Lorem ipsum.',
        style: TextStyle(fontSize: 48), // maks size fonts
        maxLines: maxLines,
      ),
    );
  }
}
