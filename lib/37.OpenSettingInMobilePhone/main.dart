import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const SettingAppExample());
}

class SettingAppExample extends StatelessWidget {
  const SettingAppExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Open Setting'), centerTitle: true),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    AppSettings.openAccessibilitySettings();
                  },
                  child: const Text('Open Accessibility Settings'),
                ),
                ElevatedButton(
                  onPressed: () {
                    AppSettings.openAppSettings();
                  },
                  child: const Text('Open App Settings'),
                ),
                ElevatedButton(
                  onPressed: () {
                    AppSettings.openBatteryOptimizationSettings();
                  },
                  child: const Text('Open Battery Optimization Settings'),
                ),
                ElevatedButton(
                  onPressed: () {
                    AppSettings.openDataRoamingSettings();
                  },
                  child: const Text('Open Data Roaming Settings'),
                ),
                ElevatedButton(
                  onPressed: () {
                    AppSettings.openBluetoothSettings();
                  },
                  child: const Text('Open Bluetooth Settings'),
                ),
                ElevatedButton(
                  onPressed: () {
                    AppSettings.openDateSettings();
                  },
                  child: const Text('Open Date Settings'),
                ),
                ElevatedButton(
                  onPressed: () {
                    AppSettings.openDevelopmentSettings();
                  },
                  child: const Text('Open Development Settings'),
                ),
                ElevatedButton(
                  onPressed: () {
                    AppSettings.openDeviceSettings();
                  },
                  child: const Text('Open Device Settings'),
                ),
                ElevatedButton(
                  onPressed: () {
                    AppSettings.openDisplaySettings();
                  },
                  child: const Text('Open Display Settings'),
                ),
                ElevatedButton(
                  onPressed: () {
                    AppSettings.openHotspotSettings();
                  },
                  child: const Text('Open Hotspot Settings'),
                ),
                ElevatedButton(
                  onPressed: () {
                    AppSettings.openInternalStorageSettings();
                  },
                  child: const Text('Open Internal Storage Settings'),
                ),
                ElevatedButton(
                  onPressed: () {
                    AppSettings.openLocationSettings();
                  },
                  child: const Text('Open Location Settings'),
                ),
                ElevatedButton(
                  onPressed: () {
                    AppSettings.openLockAndPasswordSettings();
                  },
                  child: const Text('Open Lock And Password Settings'),
                ),
                ElevatedButton(
                  onPressed: () {
                    AppSettings.openNFCSettings();
                  },
                  child: const Text('Open NFC Settings'),
                ),
                ElevatedButton(
                  onPressed: () {
                    AppSettings.openNotificationSettings();
                  },
                  child: const Text('Open Notification Settings'),
                ),
                ElevatedButton(
                  onPressed: () {
                    AppSettings.openSecuritySettings();
                  },
                  child: const Text('Open Security Settings'),
                ),
                ElevatedButton(
                  onPressed: () {
                    AppSettings.openSoundSettings();
                  },
                  child: const Text('Open Sound Settings'),
                ),
                ElevatedButton(
                  onPressed: () {
                    AppSettings.openVPNSettings();
                  },
                  child: const Text('Open VPN Settings'),
                ),
                ElevatedButton(
                  onPressed: () {
                    AppSettings.openWIFISettings();
                  },
                  child: const Text('Open WIFI Settings'),
                ),
                ElevatedButton(
                  onPressed: () {
                    AppSettings.openWirelessSettings();
                  },
                  child: const Text('Open Wireless Settings'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
