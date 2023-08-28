import 'package:flutter/material.dart';

import 'body_part.dart';
import 'header.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen(
      {super.key, required this.title, required this.storedEmail});

  final String title;
  final String storedEmail;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Header(storedEmail: '', title: ''),
            Body(title: title, storedEmail: storedEmail)
          ],
        ),
      ),
    );
  }
}
