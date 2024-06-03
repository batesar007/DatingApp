import 'dart:async';

import 'package:dating_app/components/Btn/CommonBtn.dart';
import 'package:dating_app/resources/constant/AppService.dart';
import 'package:dating_app/resources/constant/ImgPath.dart';
import 'package:dating_app/resources/constant/colorsheet.dart';
import 'package:dating_app/resources/constant/stylesheet.dart';
import 'package:dating_app/screens/AppInformationScreen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';

class Otpscreen extends StatefulWidget {
  Otpscreen({super.key});

  @override
  State<Otpscreen> createState() => _OtpscreenState();
}

class _OtpscreenState extends State<Otpscreen> {
  final appimg = Appimg();
  final font = AppTextTheme();
  final appclr = Appcolor();
  int time = 20;
  String otp = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Center(child: Image.asset(appimg.Otpimg)),
                RichText(
                    text: TextSpan(
                        style: font.fs14Normal().copyWith(color: appclr.grey),
                        children: [
                      TextSpan(text: "Enter the code send to"),
                      TextSpan(
                        text: "+91 8950223959",
                        style:
                            font.fs14Normal().copyWith(color: appclr.Premiery),
                      )
                    ])),
                Gap(30),
                Pinput(
                  onChanged: (v) => setState(() {
                    otp = v;
                  }),
                  length: 6,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  submittedPinTheme: PinTheme(
                      width: 50,
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(color: appclr.green),
                          borderRadius: BorderRadius.circular(12))),
                  focusedPinTheme: PinTheme(
                      width: 50,
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(color: appclr.green),
                          borderRadius: BorderRadius.circular(12))),
                  defaultPinTheme: PinTheme(
                      width: 50,
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(color: appclr.Premiery),
                          borderRadius: BorderRadius.circular(12))),
                ),
                Gap(30),
                RichText(
                    text: TextSpan(
                        style: font.fs14Normal().copyWith(color: appclr.grey),
                        children: [
                      TextSpan(text: "Didn't recevie the code? "),
                      TextSpan(
                        text: "Resend OTP in 0:${time}sec",
                        style:
                            font.fs14Normal().copyWith(color: appclr.Premiery),
                      )
                    ])),
                Gap(30),
                Row(
                  children: [
                    CommonBtn(
                        btn_name: "Verify",
                        isexpanded: true,
                        onPressed: () {
                          App_service(context).pushTo(AppInformationScreen());
                        }),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  getTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (time > 0) {
        time = time - 1;
        setState(() {});
      } else {
        timer.cancel();
        print("otp time out ");
      }
    });
  }
}
