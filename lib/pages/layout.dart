import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;

  Layout({super.key, required this.mobile, required this.desktop});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 500) {
        return mobile;
      } else {
        return desktop;
      }
    });
  }
}
