import 'package:belajar_flutter/FIC%20BASIC%20STATE%20MANAGEMENT/features/counter/view/count_view.dart';
import 'package:belajar_flutter/FIC%20BASIC%20STATE%20MANAGEMENT/features/enabled/view/enabled_view.dart';
import 'package:belajar_flutter/FIC%20BASIC%20STATE%20MANAGEMENT/features/home/view/home_view.dart';
import 'package:belajar_flutter/FIC%20BASIC%20STATE%20MANAGEMENT/features/loading/view/loading_view.dart';
import 'package:flutter/material.dart';

class HomeController extends State<HomeView> {
  List nameOfLesson = [
    '1\n Counter',
    '2\n Loading',
    '3\n Enableb or Disabled',
    '4\n Visibility',
    '5\n Animation',
    '6\n Navigation',
    '7\n Cart',
    '8\n Fitbar List',
    '9\n Theme',
  ];

  List routingOfLesson = [
    'count',
    'loading',
    'enabled',
    'count',
    'count',
    'count',
    'count',
    'count',
    'count',
  ];

  routingLesson({required String lesson, required BuildContext context}) {
    if (lesson == 'count') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CountView()),
      );
      return;
    }
    if (lesson == 'loading') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoadingView()),
      );
      return;
    }
    if (lesson == 'enabled') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const EnabledView()),
      );
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
