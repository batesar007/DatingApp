import 'package:dating_app/main.dart';
import 'package:dating_app/resources/constant/colorsheet.dart';
import 'package:dating_app/screens/BottomScreens/ChatScreen.dart';
import 'package:dating_app/screens/BottomScreens/NearestScreen.dart';
import 'package:dating_app/screens/BottomScreens/NotificationScreen.dart';
import 'package:dating_app/screens/BottomScreens/ProfileScreen.dart';
import 'package:flutter/material.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  final appclr = Appcolor();
  int currentindex = 0;
  List<Widget> screen = [
    ChatScreen(),
    NearestScreen(),
    NotificationScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentindex = value;
          });
        },
        currentIndex: currentindex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: appclr.Premiery,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
              ),
              label: "Chat"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.local_fire_department_sharp,
              ),
              label: "Nearest"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications_rounded,
              ),
              label: "Notification"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "Profile"),
        ],
      ),
      body: screen[currentindex],
    );
  }
}
