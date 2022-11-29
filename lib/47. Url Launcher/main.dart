import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main(List<String> args) {
  runApp(const UrlLaunchApp());
}

class UrlLaunchApp extends StatelessWidget {
  const UrlLaunchApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Url launcher'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LauncherButton(
                text: 'call',
                onPressed: () {
                  log('press call');
                  call(phoneNumber: '085731532271');
                },
              ),
              LauncherButton(
                text: 'sms',
                onPressed: () {
                  log('press sms');
                  sendSms(phoneNumber: '085731532271');
                },
              ),
              LauncherButton(
                text: 'email',
                onPressed: () {
                  log('press email');
                  sendEmail(email: 'mohfauzislamet@gmail.com');
                },
              ),
              LauncherButton(
                text: 'url',
                onPressed: () {
                  log('press url');
                  // openUrl(url: '//www.youtube.com/');
                  openUrl(url: '//www.amazon.com/');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class LauncherButton extends StatelessWidget {
  LauncherButton({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);
  String text;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}

Future<void> call({String? phoneNumber}) async {
  await launchUrl(
    Uri(
      scheme: 'tel',
      path: phoneNumber,
    ),
  );
}

Future<void> sendSms({String? phoneNumber}) async {
  await launchUrl(
    Uri(
      scheme: 'sms',
      path: phoneNumber,
    ),
  );
}

Future<void> sendEmail({String? email}) async {
  await launchUrl(
    Uri(
      scheme: 'mailto',
      path: email,
    ),
  );
}

Future<void> openUrl({
  String? url,
  bool forceWebView = false,
  bool enableJavaScript = false,
}) async {
  await launchUrl(
      Uri(
        scheme: 'https',
        path: url,
      ),
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(enableJavaScript: true, enableDomStorage: true));
}
