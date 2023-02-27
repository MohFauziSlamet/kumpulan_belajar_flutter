import 'package:flutter/material.dart';

var defaultBackground = Colors.grey[300];

var myAppBar = AppBar(
  backgroundColor: Colors.grey[900],
);

var myDrawer = Drawer(
  backgroundColor: Colors.grey[300],
  child: Column(
    children: const [
      DrawerHeader(
        child: Icon(Icons.favorite, size: 24.0),
      ),
      ListTile(
        leading: Icon(Icons.home, size: 24.0),
        title: Text("D A S H B O R D"),
      ),
      ListTile(
        leading: Icon(Icons.chat, size: 24.0),
        title: Text("M E S S A G E"),
      ),
      ListTile(
        leading: Icon(Icons.settings, size: 24.0),
        title: Text("S E T T I N G"),
      ),
      ListTile(
        leading: Icon(Icons.logout, size: 24.0),
        title: Text("L O G O U T"),
      ),
    ],
  ),
);
