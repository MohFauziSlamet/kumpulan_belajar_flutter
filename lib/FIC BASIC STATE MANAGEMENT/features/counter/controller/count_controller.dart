import 'package:belajar_flutter/FIC%20BASIC%20STATE%20MANAGEMENT/features/counter/view/count_view.dart';
import 'package:flutter/material.dart';

class CountController extends State<CountView> {
  int counter = 0;

  add() {
    counter += 1;
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
