import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/pages/dashboard_screen.dart';
import 'package:mobile/pages/login.dart';
import 'package:mobile/pages/settings.dart';

myDrawer(BuildContext context) {
  return SafeArea(
    child: Drawer(
        child: Column(
      children: [
        const Padding(padding: EdgeInsets.all(16)),
        SizedBox(
          height: 70,
          child: SvgPicture.asset('assets/svgPictures/co_logo.svg'),
        ),
        const DrawerHeader(
          child: SizedBox(
            height: 300,
            width: 300,
            child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.jpg')),
          ),
        ),
        const Padding(padding: EdgeInsets.all(16)),
        ListTile(
          onTap: () {},
          horizontalTitleGap: 0.0,
          // leading: SvgPicture.asset('assets/svgPictures/dashboard.svg'),
          title: const Text('Dashboard'),
        ),
        ListTile(
          onTap: () {},
          horizontalTitleGap: 0.0,
          // leading: SvgPicture,
          title: const Text('Activity'),
        ),
        ListTile(
          onTap: () {},
          horizontalTitleGap: 0.0,
          // leading: SvgPicture,
          title: const Text('Schedule'),
        ),
        ListTile(
          onTap: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsPage(),
                    ));
          },
          horizontalTitleGap: 0.0,
          // leading: SvgPicture,
          title: const Text('Settings'),
        ),
        ListTile(
          onTap: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Login(title: '', email: '',),
                    ));
          },
          horizontalTitleGap: 0.0,
          // leading: SvgPicture,
          title: const Text('Log out'),
        ),
      ],
    )),
  );
}

var myBody = const SafeArea(
    child: Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(
        flex: 5,
        child: DashboardScreen(
          storedEmail: '',
          title: '',
        ))
  ],
));
