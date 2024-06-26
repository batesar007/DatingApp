import 'package:dating_app/components/Btn/CommonBtn.dart';
import 'package:dating_app/resources/constant/AppService.dart';
import 'package:dating_app/resources/constant/ImgPath.dart';
import 'package:dating_app/resources/constant/colorsheet.dart';
import 'package:dating_app/resources/constant/stylesheet.dart';
import 'package:dating_app/screens/Auth/LoginScreen.dart';
import 'package:dating_app/screens/Auth/PhnNumberScreen.dart';
import 'package:dating_app/screens/Auth/SignUpGmailScreen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class StartingScreen extends StatelessWidget {
  StartingScreen({super.key});
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
                  "By typing 'Sign Up', you agree wiht our Term.Learm how we process your data in our Privacy Policy and cookies Policy.",
                  style: font.fs14Normal(),
                  textAlign: TextAlign.center,
                ),
                Gap(15),
                Row(children: [
                  CommonBtn(
                      onPressed: () {},
                      isexpanded: true,
                      btn_name: "SIGN UP WITH FACBOOK")
                ]),
                Row(
                  children: [
                    CommonBtn(
                        onPressed: () {
                          App_service(context).pushTo(PhnNumberScreen());
                        },
                        isexpanded: true,
                        btn_name: "SIGN UP WITH PHONENUMBER"),
                  ],
                ),
                Row(
                  children: [
                    CommonBtn(
                        onPressed: () {
                          App_service(context).pushTo(SignUpGmailScreen());
                        },
                        isexpanded: true,
                        btn_name: "SIGN UP WITH GMAIL"),
                  ],
                ),
                // Gap(10),
                Gap(10),
                Text("Trouble SignUp?"),
                Gap(10),
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
                          text: "Alredy you have an Account",
                          style: TextStyle(color: appclr.Black)),
                      TextSpan(
                          text: " Login",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              App_service(context).pushTo(LoginScreen());
                            })
                    ])),
              ],
            ),
          )
        ],
      ),
    );
  }
}
