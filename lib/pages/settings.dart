import 'package:flutter/material.dart';
import 'package:mobile/theme/theme_manager.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeManager>(context);

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Settings Page'),
        leading: const BackButton(),
      ),
      body: Center(
        child: ListView(
          children: [
            Container(
              height: 35,
            ),
            userTile(),
            divider(),
            colorTiles(),
            divider(),
            ElevatedButton(
                    onPressed: () {
                      provider.toggleTheme();
                    },
                    child: const Text('Theme switch'))
          ],

          // children: [
          //   const SizedBox(
          //     height: 40,
          //   ),
          //   const Row(
          //     children: [
          //       Icon(
          //         Icons.person,
          //         color: Colors.blue,
          //       ),
          //       SizedBox(width: 10),
          //       Text("Account"),
          //     ],
          //   ),
          //   const Divider(height: 20, thickness: 1),
          //   const SizedBox(height: 10),
          //   Row(
          //     children: [
          //       const Icon(
          //         Icons.person,
          //         color: Colors.blue,
          //       ),
          //       const Text("Theme"),
          //       const SizedBox(width: 100),
          //       ElevatedButton(
          //           onPressed: () {
          //             provider.toggleTheme();
          //           },
          //           child: const Text('data'))
          //     ],
          //   ),
          // ],
        ),
      ),
    );
  }
}

Widget userTile() {
  return ListTile(
    leading: Container(
      height: 80,
      width: 80,
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/images/profile.jpg'),
      ),
    ),
  );
}

Widget divider() {
  return const Padding(
    padding: EdgeInsets.all(8),
    child: Divider(
      thickness: 1.5,
    ),
  );
}

Widget colorTiles() {
  return Column(
    children: [
      colorTile(Icons.person_outline, Colors.lightBlue, 'Personal data'),
      colorTile(Icons.settings, Colors.lightBlue, 'Settings'),
      colorTile(Icons.payment, Colors.lightBlue, 'Wallet'),
      colorTile(Icons.favorite, Colors.lightBlue, 'Refferal code'),
    ],
  );
}

Widget colorTile(IconData icon, Color color, String text) {
  return ListTile(
    leading: Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        color: color.withOpacity(0.09),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Icon(
        icon,
        color: color,
      ),
    ),
    title: Text(text),
    trailing: const Icon(
      Icons.arrow_forward_ios,
      color: Colors.black,
      size: 20,
    ),
  );
}
