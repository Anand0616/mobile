import 'package:flutter/material.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/pages/dashboard_screen.dart';

class Desktop extends StatefulWidget {
  const Desktop({Key? key}) : super(key: key);
  @override
  State<Desktop> createState() => _DesktopState();
}

class _DesktopState extends State<Desktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: myDrawer(context),
      body: const SafeArea(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              // flex: 5,
              child: DashboardScreen(
            storedEmail: '',
            title: '',
          ))
        ],
      )),
    );
  }
}
