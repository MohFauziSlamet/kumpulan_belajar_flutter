// ignore_for_file: library_private_types_in_public_api

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class StepGranularityWidget extends StatefulWidget {
  const StepGranularityWidget({Key? key}) : super(key: key);

  @override
  _StepGranularityWidgetState createState() => _StepGranularityWidgetState();
}

class _StepGranularityWidgetState extends State<StepGranularityWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: buildFontSizeSteps(),
    );
  }

  Widget buildFontSizeSteps() => const AutoSizeText(
        'This Text decreases by Font Size steps.',
        minFontSize: 20,
        stepGranularity: 10,
        style: TextStyle(fontSize: 60),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
}
