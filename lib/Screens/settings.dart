import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
          ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: Text('setting 1'),
              onTap: (){},
            ),
            Divider(),
            ListTile(
              title: Text('setting 2'),
              onTap: (){},
            ),
            Divider(),
            ListTile(
              title: Text('setting 3'),
              onTap: (){},
            ),
            Divider(),
            ListTile(
              title: Text('This page is yet to be added'),
              onTap: (){},
            ),
          ],
        ),
      ),
    );
  }
}