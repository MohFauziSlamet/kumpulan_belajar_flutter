import 'package:belajar_flutter/kuldi_projek/18.Drawer/pages/profile_page_drawer.dart';
import 'package:belajar_flutter/kuldi_projek/18.Drawer/pages/settings_page_drawer.dart';
import 'package:flutter/material.dart';

class HomePageDrawer extends StatelessWidget {
  const HomePageDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Latihan drawer",
        ),
      ),
      body: const Center(
        child: Text(
          'Ini halaman Home Page',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),

      //
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 80,
              decoration: const BoxDecoration(
                color: Colors.lightBlue,
              ),
              child: const Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Menu",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            //
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) {
                            return const ProfilePageDrawer();
                          },
                        ),
                      );
                    },
                    leading: const Icon(
                      Icons.person_pin,
                      size: 30,
                    ),
                    title: const Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),

                  //
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) {
                            return const SettingsPageDrawer();
                          },
                        ),
                      );
                    },
                    leading: const Icon(
                      Icons.settings_outlined,
                      size: 30,
                    ),
                    title: const Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ), //
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) {
                            return const ProfilePageDrawer();
                          },
                        ),
                      );
                    },
                    leading: const Icon(
                      Icons.person_pin,
                      size: 30,
                    ),
                    title: const Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),

                  //
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) {
                            return const SettingsPageDrawer();
                          },
                        ),
                      );
                    },
                    leading: const Icon(
                      Icons.settings_outlined,
                      size: 30,
                    ),
                    title: const Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ), //
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) {
                            return const ProfilePageDrawer();
                          },
                        ),
                      );
                    },
                    leading: const Icon(
                      Icons.person_pin,
                      size: 30,
                    ),
                    title: const Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),

                  //
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) {
                            return const SettingsPageDrawer();
                          },
                        ),
                      );
                    },
                    leading: const Icon(
                      Icons.settings_outlined,
                      size: 30,
                    ),
                    title: const Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ), //
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) {
                            return const ProfilePageDrawer();
                          },
                        ),
                      );
                    },
                    leading: const Icon(
                      Icons.person_pin,
                      size: 30,
                    ),
                    title: const Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),

                  //
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) {
                            return const SettingsPageDrawer();
                          },
                        ),
                      );
                    },
                    leading: const Icon(
                      Icons.settings_outlined,
                      size: 30,
                    ),
                    title: const Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) {
                            return const ProfilePageDrawer();
                          },
                        ),
                      );
                    },
                    leading: const Icon(
                      Icons.person_pin,
                      size: 30,
                    ),
                    title: const Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),

                  //
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) {
                            return const SettingsPageDrawer();
                          },
                        ),
                      );
                    },
                    leading: const Icon(
                      Icons.settings_outlined,
                      size: 30,
                    ),
                    title: const Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) {
                            return const ProfilePageDrawer();
                          },
                        ),
                      );
                    },
                    leading: const Icon(
                      Icons.person_pin,
                      size: 30,
                    ),
                    title: const Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),

                  //
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) {
                            return const SettingsPageDrawer();
                          },
                        ),
                      );
                    },
                    leading: const Icon(
                      Icons.settings_outlined,
                      size: 30,
                    ),
                    title: const Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) {
                            return const ProfilePageDrawer();
                          },
                        ),
                      );
                    },
                    leading: const Icon(
                      Icons.person_pin,
                      size: 30,
                    ),
                    title: const Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),

                  //
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) {
                            return const SettingsPageDrawer();
                          },
                        ),
                      );
                    },
                    leading: const Icon(
                      Icons.settings_outlined,
                      size: 30,
                    ),
                    title: const Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) {
                            return const ProfilePageDrawer();
                          },
                        ),
                      );
                    },
                    leading: const Icon(
                      Icons.person_pin,
                      size: 30,
                    ),
                    title: const Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),

                  //
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) {
                            return const SettingsPageDrawer();
                          },
                        ),
                      );
                    },
                    leading: const Icon(
                      Icons.settings_outlined,
                      size: 30,
                    ),
                    title: const Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //
          ],
        ),
      ),
    );
  }
}
