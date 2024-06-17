import 'package:dating_app/components/Btn/CommonBtn.dart';
import 'package:dating_app/resources/constant/ImgPath.dart';
import 'package:dating_app/resources/constant/colorsheet.dart';
import 'package:dating_app/resources/constant/stylesheet.dart';
import 'package:dating_app/screens/Auth/LoginGmail.com.dart';
import 'package:dating_app/screens/Auth/PhnNumberScreen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../resources/constant/AppService.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final appclr = Appcolor();
  final appicon = Appicon();
  final appimg = Appimg();
  final font = AppTextTheme();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 55),
              decoration: BoxDecoration(
                  color: appclr.Premiery,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(22),
                      bottomRight: Radius.circular(22))),
              child: Center(
                  child: Image.asset(
                appicon.Applogo,
                fit: BoxFit.cover,
                height: 150,
              ))),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Text(
                  "By typing 'Login', you agree wiht our Term.Learm how we process your data in our Privacy Policy and cookies Policy.",
                  style: font.fs14Normal(),
                  textAlign: TextAlign.center,
                ),
                Gap(15),
                Row(children: [
                  CommonBtn(
                      onPressed: () {},
                      isexpanded: true,
                      btn_name: "LOGIN WITH FACBOOK")
                ]),
                Row(
                  children: [
                    CommonBtn(
                        onPressed: () {
                          App_service(context).pushTo(PhnNumberScreen());
                        },
                        isexpanded: true,
                        btn_name: "LOGIN WITH PHONENUMBER"),
                  ],
                ),
                Row(
                  children: [
                    CommonBtn(
                        onPressed: () {
                          App_service(context).pushTo(LoginGmailScreen());
                        },
                        isexpanded: true,
                        btn_name: "LOGIN WITH GMAIL"),
                  ],
                ),
                Gap(10),
                Text("Trouble Login?"),
                Gap(10),
                RichText(
                    text: TextSpan(
                        style: TextStyle(color: appclr.Blue),
                        children: [
                      TextSpan(
                          text: "Privacy Policy ",
                          recognizer: TapGestureRecognizer()..onTap = () {}),
                      TextSpan(
                          text: "Terms & Conditions",
                          recognizer: TapGestureRecognizer()..onTap = () {})
                    ])),
                Gap(10),
                RichText(
                    text: TextSpan(
                        style: TextStyle(color: appclr.Blue),
                        children: [
                      TextSpan(
                          text: "Do You Have No Account",
                          style: TextStyle(color: appclr.Black)),
                      TextSpan(
                          text: " SIGN UP",
                          recognizer: TapGestureRecognizer()..onTap = () {})
                    ])),
              ],
            ),
          )
        ],
      ),
    );
  }
}
