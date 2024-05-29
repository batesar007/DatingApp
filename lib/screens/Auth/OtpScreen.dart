import 'package:dating_app/resources/constant/ImgPath.dart';
import 'package:dating_app/resources/constant/colorsheet.dart';
import 'package:dating_app/resources/constant/stylesheet.dart';
import 'package:flutter/material.dart';

class Otpscreen extends StatelessWidget {
  Otpscreen({super.key});
  final appimg = Appimg();
  final font = AppTextTheme();
  final appclr = Appcolor();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Center(child: Image.asset(appimg.Otpimg)),
              RichText(
                  text: TextSpan(
                      style: font.fs14Normal().copyWith(color: appclr.Black),
                      children: [
                    TextSpan(text: "Enter the code send to"),
                    TextSpan(text: "+91 8950223959")
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}
