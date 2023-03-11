import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => const MaterialApp(
        home: MainWidget(),
      );
}

class MainWidget extends StatefulWidget {
  const MainWidget({super.key});

  @override
  MainWidgetState createState() => MainWidgetState();
}

class MainWidgetState extends State<MainWidget> {
  PhoneContact? _phoneContact;
  EmailContact? _emailContact;
  String? _contact;
  Image? _contactPhoto;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: kIsWeb && !FlutterContactPicker.available ? [_buildError(context)] : _buildChildren(context),
        ),
      );

  Widget _buildError(BuildContext context) {
    return RichText(
      text: TextSpan(text: 'Your browser does not support contact pickers for more information see: ', children: [
        TextSpan(
            text: 'https://web.dev/contact-picker/',
            style: const TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = () => launchUrl(Uri.parse('https://web.dev/contact-picker/'))),
        const TextSpan(text: ' and '),
        TextSpan(
            text: 'https://developer.mozilla.org/en-US/docs/Web/API/Contact_Picker_API#Browser_compatibility/',
            style: const TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => launchUrl(Uri.parse(
                  'https://developer.mozilla.org/en-US/docs/Web/API/Contact_Picker_API#Browser_compatibility')))
      ]),
    );
  }

  List<Widget> _buildChildren(BuildContext context) {
    return <Widget>[
      if (_emailContact != null)
        Column(
          children: <Widget>[
            const Text("Email contact:"),
            Text("Name: ${_emailContact!.fullName}"),
            Text("Email: ${_emailContact!.email!.email} (${_emailContact!.email!.label})")
          ],
        ),
      if (_phoneContact != null)
        Column(
          children: <Widget>[
            const Text("Phone contact:"),
            Text("Name: ${_phoneContact!.fullName}"),
            Text("Phone: ${_phoneContact!.phoneNumber!.number} (${_phoneContact!.phoneNumber!.label})")
          ],
        ),
      if (_contactPhoto != null) _contactPhoto!,
      if (_contact != null) Text(_contact!),
      ElevatedButton(
        child: const Text("pick phone contact"),
        onPressed: () async {
          final PhoneContact contact = await FlutterContactPicker.pickPhoneContact();
          log(contact.toString());
          setState(() {
            _phoneContact = contact;
          });
        },
      ),
      ElevatedButton(
        child: const Text("pick email contact"),
        onPressed: () async {
          final EmailContact contact = await FlutterContactPicker.pickEmailContact();
          log(contact.toString());
          setState(() {
            _emailContact = contact;
          });
        },
      ),
      ElevatedButton(
        child: const Text("pick full contact"),
        onPressed: () async {
          final FullContact contact = (await FlutterContactPicker.pickFullContact());
          setState(() {
            _contact = contact.toString();
            _contactPhoto = contact.photo?.asWidget();
          });
        },
      ),
      ElevatedButton(
        child: const Text('Check permission'),
        onPressed: () async {
          final granted = await FlutterContactPicker.hasPermission();
          showDialog(
              context: context,
              builder: (context) => AlertDialog(title: const Text('Granted: '), content: Text('$granted')));
        },
      ),
      ElevatedButton(
        child: const Text('Request permission'),
        onPressed: () async {
          final granted = await FlutterContactPicker.requestPermission();
          showDialog(
              context: context,
              builder: (context) => AlertDialog(title: const Text('Granted: '), content: Text('$granted')));
        },
      ),
    ];
  }
}
