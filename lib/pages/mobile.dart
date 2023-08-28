import 'package:flutter/material.dart';
import 'package:mobile/constants.dart';

class Mobile extends StatefulWidget {
  const Mobile({Key? key}) : super(key: key);
  @override
  State<Mobile> createState() => _MobileState();
}

class _MobileState extends State<Mobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: myAppBar,
      drawer: myDrawer(context),
      body: myBody,
    );
  }
}
