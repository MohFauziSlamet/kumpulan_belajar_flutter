import 'dart:math';

import 'package:flutter/material.dart';

class SmartDeviceBox extends StatelessWidget {
  final String? smartDeviceName;
  final String? iconPath;
  final bool? isPowerOn;
  void Function(bool)? onChanged;
  SmartDeviceBox({
    Key? key,
    this.smartDeviceName,
    this.iconPath,
    this.isPowerOn,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Material(
        elevation: isPowerOn ?? false ? 5 : 10,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
            color: isPowerOn ?? false ? Colors.grey[900] : Colors.grey[200],
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ICON
              Image.asset(
                iconPath ?? '',
                height: 65,
                color: isPowerOn ?? false ? Colors.white : Colors.black,
              ),

              // SWITCH
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(
                      smartDeviceName ?? '',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: isPowerOn ?? false ? Colors.white : Colors.black,
                      ),
                    ),
                  )),
                  Transform.rotate(
                      angle: pi / 2,
                      child: Switch.adaptive(
                        value: isPowerOn ?? false,
                        onChanged: onChanged,
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
