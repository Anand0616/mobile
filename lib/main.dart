import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile/pages/login.dart';
import 'package:mobile/theme/theme_manager.dart';
import 'package:provider/provider.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeManager(),
      builder: (context, child) {
        final provider = Provider.of<ThemeManager>(context);
        return MaterialApp(
          navigatorKey: navigatorKey,
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: provider.theme,
          home: const Login(
            title: 'Login page',
            email: '',
          ),
        );
      },
    );
  }
}
