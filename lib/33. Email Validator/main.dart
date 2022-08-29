import 'view/validator_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(List<String> args) {
  runApp(const EmailValidation());
}

class EmailValidation extends StatelessWidget {
  const EmailValidation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Email Validator',
      home: ValidationView(),
    );
  }
}
