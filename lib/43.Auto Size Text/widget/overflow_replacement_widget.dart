import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class OverflowReplacementWidget extends StatelessWidget {
  const OverflowReplacementWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildReplaceByWidthText(),
            const SizedBox(height: 32),
            buildReplaceByHeightText(),
          ],
        ),
      );

  Widget buildReplaceByWidthText() {
    const longText = 'This is a long description that will be displayed as long as it fits.';
    const shortText = 'This is a shorter description.';
    const style = TextStyle(fontSize: 32);

    return Container(
      color: Colors.red,
      child: const AutoSizeText(
        longText,
        maxLines: 1,
        minFontSize: 32,
        style: style,
        overflowReplacement: Text(shortText, style: style),
      ),
    );
  }

  Widget buildReplaceByHeightText() {
    const longText = 'This is a long description that will be displayed as long as it fits.';
    const shortText = 'This is a shorter description.';
    const style = TextStyle(fontSize: 32);

    return Container(
      color: Colors.blue,
      child: const AutoSizeText(
        longText,
        maxLines: 1,
        minFontSize: 20,
        style: style,
        overflowReplacement: Text(shortText, style: style),
      ),
    );
  }
}
