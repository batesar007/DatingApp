import 'package:dating_app/components/Btn/CommonBtn.dart';
import 'package:dating_app/resources/constant/AppService.dart';
import 'package:dating_app/resources/constant/colorsheet.dart';
import 'package:dating_app/resources/constant/stylesheet.dart';
import 'package:dating_app/screens/BottomBar.dart/BottomBarScreen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final font = AppTextTheme();
  final appclr = Appcolor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   actions: [
      //     TextButton.icon(
      //         onPressed: () {},
      //         icon: Icon(Icons.arrow_forward_ios_outlined),
      //         label: Text("Skip.."))
      //   ],
      // ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(
              "Enable Location",
              style: font.fs30SemiBold(),
            ),
            Gap(20),
            Align(
                alignment: Alignment.topRight,
                child: CommonBtn(
                    btn_name: "Skipe >", bgclr: appclr.grey, onPressed: () {})),
            Expanded(
              child: Center(
                child: Container(
                  // height: 60,
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: appclr.Premiery),
                  child: Icon(
                    Icons.location_on,
                    size: 70,
                    color: appclr.White,
                  ),
                ),
              ),
            ),
            Text(
              "You'll need to provide a location in order to search around you.",
              style: font.fs16Normal().copyWith(color: appclr.grey),
              textAlign: TextAlign.center,
            ),
            Gap(20),
            Row(
              children: [
                CommonBtn(
                    btn_name: "Allow Location",
                    isexpanded: true,
                    onPressed: () {
                      App_service(context).pushTo(BottomBarScreen());
                    }),
              ],
            )
          ],
        ),
      )),
    );
  }
}
