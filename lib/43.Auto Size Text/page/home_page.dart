import 'package:belajar_flutter/43.Auto%20Size%20Text/widget/basic_widget.dart';
import 'package:belajar_flutter/43.Auto%20Size%20Text/widget/fontsize_widget.dart';
import 'package:belajar_flutter/43.Auto%20Size%20Text/widget/group_widget.dart';
import 'package:belajar_flutter/43.Auto%20Size%20Text/widget/maxlines_widget.dart';
import 'package:belajar_flutter/43.Auto%20Size%20Text/widget/overflow_replacement_widget.dart';
import 'package:belajar_flutter/43.Auto%20Size%20Text/widget/preset_fontsize_widget.dart';
import 'package:belajar_flutter/43.Auto%20Size%20Text/widget/rich_text_widget.dart';
import 'package:belajar_flutter/43.Auto%20Size%20Text/widget/step_granularity_widget.dart';
import 'package:flutter/material.dart';

import '../widget/tabbar_widget.dart';

class MainPage extends StatelessWidget {
  final String title;

  const MainPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => TabBarWidget(
        tabs: const [
          Tab(icon: Icon(Icons.home), text: 'Basic'),
          Tab(icon: Icon(Icons.list_rounded), text: 'Max Lines'),
          Tab(icon: Icon(Icons.format_size), text: 'FontSize'),
          Tab(icon: Icon(Icons.fiber_new_outlined), text: 'Replacement'),
          Tab(icon: Icon(Icons.photo_size_select_large), text: 'PresetFontSize'),
          Tab(icon: Icon(Icons.storage_sharp), text: 'StepGranularity'),
          Tab(icon: Icon(Icons.group), text: 'Group'),
          Tab(icon: Icon(Icons.style), text: 'RichText'),
        ],
        title: title,
        children: const [
          BasicWidget(),
          MaxLinesWidget(),
          FontSizeWidget(),
          OverflowReplacementWidget(),
          PresetFontSizeWidget(),
          StepGranularityWidget(),
          GroupWidget(),
          RichTextWidget(),
        ],
      );
}
