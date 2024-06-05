import 'package:dating_app/resources/constant/AppService.dart';
import 'package:dating_app/resources/constant/ImgPath.dart';
import 'package:dating_app/resources/constant/colorsheet.dart';
import 'package:dating_app/screens/Auth/StartingScreen.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4),
        () => App_service(context).pushTo(StartingScreen()));
    // final user = Prefrence.getuser(Prefrence.userkey);
    // if (user == null) {
    //   Future.delayed(Duration(seconds: 4),
    //       () => App_service(context).pushTo(StartingScreen()));
    // } else {
    //   Future.delayed(Duration(seconds: 4),
    //       () => App_service(context).pushTo(BottomBarScreen()));
    // }
  }

  @override
  Widget build(BuildContext context) {
    final Appicons = Appicon();
    final Appclr = Appcolor();
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Appclr.Premiery),
        child: Image.asset(
          Appicons.Applogo,
        ),
      ),
    );
  }
}
