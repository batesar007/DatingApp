import 'package:dating_app/resources/components/AppData/AppData.dart';
import 'package:dating_app/resources/components/Btn/CommonBtn.dart';
import 'package:dating_app/resources/constant/AppService.dart';
import 'package:dating_app/resources/constant/ImgPath.dart';
import 'package:dating_app/resources/constant/colorsheet.dart';
import 'package:dating_app/resources/constant/stylesheet.dart';
import 'package:dating_app/screens/UserDetialScreen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AppInformationScreen extends StatefulWidget {
  AppInformationScreen({super.key});

  @override
  State<AppInformationScreen> createState() => _AppInformationScreenState();
}

class _AppInformationScreenState extends State<AppInformationScreen> {
  final appimg = Appimg();

  final font = AppTextTheme();

  final appclr = Appcolor();
  bool initialvalue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(30),
            Text(
              "hookup4u",
              style: font.fs30Medium().copyWith(color: appclr.Premiery),
            ),
            Gap(20),
            Text(
              "Welcome to hookup4u.",
              style: font.fs18Medium(),
            ),
            Text(
              "Please Follow these House Rules",
              style: font.fs18Medium(),
            ),
            Gap(10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: AppData().Appinformationdata.length,
              itemBuilder: (context, i) {
                final data = AppData().Appinformationdata;
                return ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      data[i]["title"],
                      style: font.fs18Medium(),
                    ),
                    subtitle: Text(
                      data[i]["subtitle"],
                      style: font.fs13Normal(),
                    ));
              },
            ),
            // Gap(10),
            CheckboxListTile.adaptive(
              autofocus: false,
              activeColor: appclr.Premiery,
              checkColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              visualDensity: VisualDensity(horizontal: -4),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              title: Text("fdfdfhkd"),
              value: initialvalue,
              onChanged: (value) => setState(() {
                initialvalue = value!;
              }),
            ),
            Gap(15),
            Row(
              children: [
                CommonBtn(
                    btn_name: "GOT IT",
                    isexpanded: true,
                    onPressed: () {
                      App_service(context).pushTo(UserDetialScreen());
                    }),
              ],
            )
          ],
        ),
      )),
    );
  }
}
