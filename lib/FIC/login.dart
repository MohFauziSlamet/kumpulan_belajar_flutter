import 'dart:developer';

import 'package:belajar_flutter/FIC/dashboard.dart';
import 'package:belajar_flutter/FIC/global/global_function.dart';
import 'package:belajar_flutter/FIC/widget/reusable_textformfield.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        ReusTextFormField(
                          label: 'First Name',
                          icon: Icons.person,
                          hintText: 'First Name',
                          helperText: 'Your First Name',
                          validator: (value) => validator(value),
                        ),
                        const SizedBox(height: 10.0),
                        ReusTextFormField(
                          label: 'Last Name',
                          icon: Icons.person,
                          hintText: 'Last Name',
                          helperText: 'Your Last Name',
                          validator: (value) => validator(value),
                        ),
                        ReusTextFormField(
                          label: 'Phone Number',
                          icon: Icons.phone_android,
                          hintText: '085xxxxxxxx',
                          helperText: 'Your Phone Number',
                          validator: (value) => validator(value),
                        ),
                        ReusTextFormField(
                          label: 'Email',
                          icon: Icons.mail,
                          hintText: '085xxxxxxxx',
                          helperText: 'Your Email',
                          validator: (value) => validator(value),
                        ),
                        ReusTextFormField(
                          label: 'Password',
                          icon: Icons.key,
                          hintText: '085xxxxxxxx',
                          helperText: 'Your Password',
                          obscureText: true,
                          maxLenght: 10,
                          validator: (value) => validator(value),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                icon: const Icon(Icons.save),
                                style: ElevatedButton.styleFrom(primary: Colors.blue),
                                label: const Text("Save"),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    log('Yeaah');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const Dashboard()),
                                    );
                                  }
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                              child: ElevatedButton.icon(
                                icon: const Icon(Icons.refresh),
                                style: ElevatedButton.styleFrom(primary: Colors.blue),
                                label: const Text("Reset"),
                                onPressed: () {
                                  _formKey.currentState?.reset();
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
